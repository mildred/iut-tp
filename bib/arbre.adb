with text_io, p_esiut; use text_io,p_esiut;

package body arbre is 

eol : constant character := character'val(13); -- caractère fin de ligne

c   : character;         -- caractère courant de l'expression analysée
err : boolean:=false;    -- indique une erreur dans la syntaxe de l'expression

----------------------------------------------------------------------------
procedure AV is
----------------------------------------------------------------------------
begin
  if end_of_line then c:=eol;
  else 
    loop
      get(c);
      exit when end_of_line or c/=' ';
    end loop;
  end if;
end AV;

----------------------------------------------------------------------------
procedure ERREUR is 
----------------------------------------------------------------------------
begin
  if not err then
    new_line;
    put_line("ERREUR : expression incorrecte...");
    new_line(2);
    err:=true;
  end if;
  while c/=eol loop
    AV;
  end loop;
end ERREUR;

----------------------------------------------------------------------------
function EXPADD return p_noeud;
----------------------------------------------------------------------------

----------------------------------------------------------------------------
function VAL_CHAR (c : character) return integer is
----------------------------------------------------------------------------
begin
  return character'pos(c)-character'pos('0');
end VAL_CHAR;

----------------------------------------------------------------------------
function ATOME return p_noeud is
----------------------------------------------------------------------------
  val : integer;
  p   : p_noeud;
begin
  if c='(' then 
    AV;
    p:=EXPADD;
    if c/=')' then ERREUR;
    else AV;
    end if;    
  else
    if c in '0'..'9' then
      val:=VAL_CHAR(c);
      AV;
    else ERREUR;
    end if;
    while c in '0'..'9' loop
      val:=val*10+VAL_CHAR(c);
      AV;
    end loop;
    p:=new noeud(true);
    p.operande:=val;
    p.gauche:=null;
    p.droit:=null;
  end if;
  return p;
end ATOME;

----------------------------------------------------------------------------
  function EXPMUL return p_noeud is
----------------------------------------------------------------------------
  p,pg,pd : p_noeud;
begin
  pg:=ATOME;
  loop
    case c is  
     when '*' =>
        p:=new noeud(false);
        p.operateur:=multiplication;
        AV;
        pd:=ATOME;
        p.gauche:=pg;
        p.droit:=pd;
     when '/' =>
        p:=new noeud(false);
        p.operateur:=division;
        AV;
        pd:=ATOME;
        p.gauche:=pg;
        p.droit:=pd;
     when others => 
        p:=pg;
    end case;
    pg:=p;
   exit when c/='*' and c/='/';  
  end loop;
  return p;
end EXPMUL;

----------------------------------------------------------------------------
function EXPADD return p_noeud is
----------------------------------------------------------------------------
  p,pg,pd : p_noeud;
begin
  pg:=EXPMUL;
  loop
    case c is
     when '+' =>
  	p:=new noeud(false);
  	p.operateur:=addition;
  	AV;
  	pd:=EXPMUL;
  	p.gauche:=pg;
  	p.droit:=pd;
     when '-' =>
  	p:=new noeud(false);
  	p.operateur:=soustraction;
  	AV;
  	pd:=EXPMUL;
  	p.gauche:=pg;
  	p.droit:=pd;
     when others =>
  	p:=pg;
    end case;
    pg:=p;
    exit when c/='+' and c/='-';
  end loop;
  return p;
end EXPADD;

----------------------------------------------------------------------------
function EXPRESSION return p_noeud is
----------------------------------------------------------------------------
-- Lit au clavier une expression arithmétique, résultat = arbre correspondant
-- Si l'expression est incorrecte, résultat = null, message d'erreur affiché
-- Si l'expression lue est la chaîne "q", une exception fin est levée
-- L'expression doit etre écrite selon la grammaire BNF suivante :
-- EXPRESSION := q | EXPADD
-- EXPADD     := EXPMUL { OPADD EXPMUL }
-- OPADD      := +|-
-- EXPMUL     := ATOME { OPMUL ATOME }
-- OPMUL      := *|/
-- ATOME      := (EXPADD) | ENTIER
-- ENTIER     := CHIFFRE {CHIFFRE]
-- CHIFFRE    := 0|1|2|3|4|5|6|7|8|9

  p : p_noeud;
begin
  if c='q' or c='Q' then
    AV;
    if c=eol then
      raise fin;
    else 
      ERREUR;
      return null;
    end if;
  else 
    p:=EXPADD;
    if not err and c=eol then 
      skip_line;
      return p;
    else
      ERREUR;
      skip_line;
      return null;
    end if;
  end if;
end EXPRESSION;

type type_noeud is (racine, fils_gauche, fils_droit);

-------------------------------------------------------
 procedure ECRIT_NOEUD (p : p_noeud) is
-------------------------------------------------------
-- affiche le contenu du noud p
begin
  if p.feuille then
    ecrire(p.operande);
  else
    case p.operateur is
      when addition	  => ecrire("+");
      when soustraction   => ecrire("-");
      when multiplication => ecrire("*");
      when division	  => ecrire("/");
    end case;
  end if;
end ECRIT_NOEUD;

-------------------------------------------------------
 procedure VISUALISE_RECURSIF (p : p_noeud;
			       indentation : string;
			       tn : type_noeud) is
-------------------------------------------------------
-- traite le noeud p de type tn en le faisant preceder
-- de la chaine indentation
begin
  if p/=null then
    case tn is
      when racine =>
        VISUALISE_RECURSIF(p.droit,"   |",fils_droit);
        ECRIT_NOEUD(p);
	if not p.feuille then
	  ecrire_ligne(" -+");
	  ecrire_ligne("   |");
        else a_la_ligne;
	end if;
        VISUALISE_RECURSIF(p.gauche,"   |",fils_gauche);

      when fils_droit =>
        VISUALISE_RECURSIF(p.droit ,indentation(1..indentation'last-1) & "      |",fils_droit);
	ecrire(indentation(1..indentation'last-1)&"+- ");
	ECRIT_NOEUD(p);
	if not p.feuille then
	  ecrire_ligne(" -+");
	  ecrire_ligne(indentation & "     |");
        else 
	  a_la_ligne;
	  ecrire_ligne(indentation);
	end if;
        VISUALISE_RECURSIF(p.gauche,indentation&"     |",fils_gauche);

      when fils_gauche =>
        VISUALISE_RECURSIF(p.droit ,indentation & "     |",fils_droit);
	ecrire(indentation(1..indentation'last-1)&"+- ");
	ECRIT_NOEUD(p);
	if not p.feuille then
	  ecrire_ligne(" -+");
	  ecrire_ligne(indentation(1..indentation'last-1) & "      |");
        else 
	  a_la_ligne;
	  ecrire_ligne(indentation(1..indentation'last-1));
	end if;
        VISUALISE_RECURSIF(p.gauche,indentation(1..indentation'last-1)&"      |",fils_gauche);

    end case;
  end if;
end VISUALISE_RECURSIF;

-------------------------------------------------------
 procedure VISUALISE (p : p_noeud) is
-------------------------------------------------------
-- affiche l'arbre p sous forme... d'arbre !
-- en dessinant les branchesà l'aide de caractères ASCII
-- exemple : 2*3+6/(2-1)
--                +-  1
--                |
--          +- - -+
--          |     |
--          |     +-  2
--          |     
--    +- / -+
--    |     |
--    |     +-  6
--    |     
-- + -+
--    |
--    |     +-  3
--    |     |
--    +- * -+
--          |
--          +-  2
begin
    VISUALISE_RECURSIF(p,"",racine);
end VISUALISE;

----------------------------------------------------------------------------
function LIRE_EXPRESSION return p_noeud is
----------------------------------------------------------------------------

  p : p_noeud;

begin
  err:=false;
  new_line;
  PUT ("Entrez une expression (q pour quitter) : ");
  AV;
  p:=EXPRESSION;
  new_line;
  PUT ("Arbre construit :"); new_line(2);
  VISUALISE(p);
  return p;
end LIRE_EXPRESSION;

end ARBRE;

