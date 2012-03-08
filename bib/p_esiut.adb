with system; use system;
with unchecked_conversion;
 with text_io; use text_io;

  --==========================================================
  -- corps du paquetage (A ne modifier qu'avec discernement!)
  --==========================================================
  
package body p_esiut is
  
package REEL_IO is new TEXT_IO.FLOAT_IO(FLOAT);
  
function IMAGE (LE_REEL : in FLOAT) return STRING is

  S : STRING(1..FLOAT'digits+4) := (others => '0');
  L : natural := S'length;
  I : natural := L;
  
  begin
    REEL_IO.PUT(S(1..L),LE_REEL,EXP=>0); 
    while S(I) = '0'loop
      I := I - 1;
    end loop;
    if S(I) = '.' then I := I + 1; end if;
    return S(1..I);
  end IMAGE;
  
  	 
function IMAGE (L_ENTIER : in INTEGER) return STRING is
 
begin 
  return INTEGER'IMAGE(L_ENTIER);
end IMAGE;
  
  	 
procedure ECRIRE (LE_REEL : in FLOAT) is     
begin
  TEXT_IO.PUT(IMAGE(LE_REEL));
end ECRIRE;

procedure ECRIRE_LIGNE (LE_REEL : in FLOAT) is     
begin
  ecrire(le_reel);a_la_ligne;
end ECRIRE_LIGNE;
 	 
procedure ECRIRE (L_ENTIER : in INTEGER) is     
begin
  TEXT_IO.PUT(INTEGER'IMAGE(L_ENTIER));
end ECRIRE;

procedure ECRIRE_LIGNE (L_ENTIER : in INTEGER) is     
begin
  ecrire(l_entier);a_la_ligne;
end ECRIRE_LIGNE;

procedure LIRE(LE_REEL : out FLOAT) is
begin
  loop
    begin
      REEL_IO.GET(LE_REEL);
      TEXT_IO.SKIP_LINE;
      exit;
    exception
      when others => TEXT_IO.PUT_LINE("Ce n'est pas un flottant recommencez");
                     TEXT_IO.SKIP_LINE;
    end;
  end loop;
end LIRE;
  	 
procedure LIRE(L_ENTIER : out INTEGER) is
  S : STRING(1..80);           -- 80 pourrait etre diminue
  L : POSITIVE;
begin
  loop
    begin
      TEXT_IO.GET_LINE(S,L);                -- evite d'instancier INTEGER_IO
      L_ENTIER := INTEGER'VALUE(S(1..L));
      exit;
    exception
      when others => TEXT_IO.PUT_LINE("Ce n'est pas un entier recommencez");
    end;
  end loop;
end LIRE;
  
procedure VIDER_TAMPON is
begin
  TEXT_IO.SKIP_LINE;
end VIDER_TAMPON;
  
procedure LIRE( LA_CHAINE : out STRING) is 
  S : STRING(1..LA_CHAINE'LENGTH + 1) := (others => ' ');
  L : integer range 1..S'LENGTH;
begin
  loop
    begin
      TEXT_IO.GET_LINE(S,L);
      if L >= S'LENGTH then                    -- le > n'est jamais vrai!
        TEXT_IO.SKIP_LINE;
        TEXT_IO.PUT_LINE("saisie trop longue recommencez");
	S:= (others => ' ');
      else
        L := LA_CHAINE'LENGTH;
        -- LA_CHAINE(1..L) := S(1..L);
        LA_CHAINE(LA_CHAINE'First..LA_CHAINE'First+L-1) := S(1..L);
        exit;
      end if;
    exception  -- a titre de precaution
      when others => TEXT_IO.PUT_LINE("saisie non valable recommencez");
    end;
  end loop;
end LIRE;
  
procedure LIRE_TRANCHE( LA_CHAINE : out STRING; LONG : out natural) is
  S : STRING(1..LA_CHAINE'LENGTH + 1);
  L : integer range 1..S'LENGTH;
begin
  loop
    begin
      TEXT_IO.GET_LINE(S,L);
      if L >= S'LENGTH then                     -- le > n'est jamais vrai!
        TEXT_IO.SKIP_LINE;
        TEXT_IO.PUT_LINE("saisie trop longue recommencez");
      else
        -- LA_CHAINE(1..L) := S(1..L);
        LA_CHAINE(LA_CHAINE'First..LA_CHAINE'First+L-1) := S(1..L);
        LONG := L;
        exit;
      end if;
    exception  -- a titre de precaution
      when others => TEXT_IO.PUT_LINE("saisie non valable recommencez");
    end;
  end loop;
end LIRE_TRANCHE;
  
procedure LIRE ( CARAC : out CHARACTER) is
begin
  TEXT_IO.GET(CARAC);
  TEXT_IO.SKIP_LINE;
end LIRE;
  
procedure PAUSE is
begin
  TEXT_IO.PUT("appuyez sur Entree pour continuer");
  TEXT_IO.SKIP_LINE;
end PAUSE;
 
procedure clr_ECRAN is
-- Efface l'ecran 

begin
      TEXT_IO.PUT (ASCII.ESC & "[2J");
      TEXT_IO.PUT (ASCII.ESC & "[" & "1" & ";" & "1" & "f");
end clr_ECRAN;
 
  
package body P_ENUM is
  
function IMAGE (L_ENUM : in T_ENUM) return STRING is
begin
  return T_ENUM'IMAGE(L_ENUM);
end IMAGE;     
  
procedure LIRE (L_ENUM : out T_ENUM) is
  S : STRING (1..T_ENUM'WIDTH + 1);
  L : integer range 1..S'LENGTH;
begin
  loop
    begin
      TEXT_IO.GET_LINE(S,L);
      if L >= S'LENGTH then                        -- le > jamais vrai
        TEXT_IO.SKIP_LINE;
        TEXT_IO.PUT_LINE("saisie trop longue recommencez");
      else 
        L_ENUM := T_ENUM'VALUE(S(1..L));
        exit;
      end if;
    exception  -- quand la valeur de type est non conforme
      when others => TEXT_IO.PUT_LINE("Ce n'est pas dans la liste recommencez");
    end;
  end loop;
end LIRE;
  
procedure ECRIRE (L_ENUM : in T_ENUM) is
begin
  TEXT_IO.PUT(T_ENUM'IMAGE(L_ENUM));
end ECRIRE;
  
end P_ENUM;
 

procedure ecrire_acc(a : t_acces) is

function conv is new unchecked_conversion(t_acces,integer);
package int_io is new integer_io(integer); use int_io;
begin
put(item => conv(a), base => 16);
end ecrire_acc;

-- 9/05
end p_esiut;
  
