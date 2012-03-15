with ada.text_io;

package body P_Photo is

  procedure creerliste(f : in out p_appareil_io.file_type; l : out ta_ap) is
    use p_appareil_io;
    ap : tr_appareil;
  begin
    if not end_of_file (f) then
      read (f, ap);
      l := new tr_ap'
        (modele  => new string'(ap.modele(1 .. ap.nbcarmodele)),
         prix    => ap.prix,
         suivant => null);
      creerliste (f, l.all.suivant);
    end if;
  end creerliste;

  procedure creerliste(filename : string; l : out ta_ap) is
    use p_appareil_io;
    f : p_appareil_io.file_type;
  begin
    open(f, in_file, filename);
    creerliste(f, l);
    close(f);
  end creerliste;

  procedure afficher(l : ta_ap) is
    use ada.text_io;
    liste : ta_ap   := l;
    i     : integer := 1;
  begin
    while liste /= null loop
      put_line(i'img & " *" & liste.all.prix'img & " * " & liste.all.modele.all);
      liste := liste.all.suivant;
      i := i + 1;
    end loop;
  end afficher;

  function chercheap(l : in ta_ap; nomap : in string) return ta_ap is
  begin
    if l = null then
      return null;
    elsif l.all.modele.all = nomap then
      return l;
    else
      return chercheap (l.all.suivant, nomap);
    end if;
  end chercheap;

  procedure modifierprix(l : in ta_ap; prix : in positive) is
  begin
    pragma Assert (l /= null);
    l.all.prix := prix;
  end modifierprix;

  procedure inseretete(l : in out ta_ap; nom : string; prix : positive) is
  begin
    l := new tr_ap'(new string'(nom), prix, l);
  end inseretete;

  procedure inserefin(l : in out ta_ap; nom : string; prix : positive) is
  begin
    if l = null then
      l := new tr_ap'(new string'(nom), prix, l);
    else
      inserefin(l.all.suivant, nom, prix);
    end if;
  end inserefin;

  procedure inseretrieprix(l : in out ta_ap; article : in tr_ap) is
  begin
    if l = null or else l.all.prix > article.prix then
      l := new tr_ap'
        (modele  => article.modele,
         prix    => article.prix,
         suivant => l);
    else
      inseretrieprix(l.all.suivant, article);
    end if;
  end inseretrieprix;

  procedure trilisteprix(l : in out ta_ap) is
    -- je crée un pointeur pour itérer sur la première liste
    -- je crée une liste vide liste2
    liste1 : ta_ap := l;
    liste2 : ta_ap := null;
  begin
    -- pour chaque élément de la liste 1, je l'insère de manière triée
    while liste1 /= null loop
      inseretrieprix (liste2, liste1.all);
      liste1 := liste1.all.suivant;
    end loop;
    -- je remplace la liste donnée en paramètre par la liste triée que je viens
    -- de créer
    l := liste2;
  end trilisteprix;

  function creersousliste_it(l : ta_ap; binf, bsup : positive) return ta_ap is
    liste1 : ta_ap := l;
    liste2 : ta_ap := null;
    der2   : ta_ap := null;
    p      : ta_ap := null;
  begin
    -- pareil que trilisteprix sauf que je ne fais l'insertion que si je suis
    -- entre binf et bsup
    while liste1 /= null loop
      if liste1.all.prix >= binf and liste1.all.prix <= bsup then
        -- on peut utiliser inserefin, mais cela veut dire reparcourir toute la
        -- liste2 à chaque fois:
        --
        --   inserefin(liste2, liste1.all.nom, liste1.all.prix);
        --
        -- on peut aussi directement ajouter au dernier element:
        begin
          p := new tr_ap'(liste1.all.modele, liste1.all.prix, null);
          if der2 /= null then
            -- ce n'est pas le premier element de liste2, on ajoute
            der2.all.suivant := p;
          else
            -- liste2 est vide, on lui met le premier élément
            liste2 := p;
          end if;
          -- on affecte der2 qui correspond au dernier élément de liste2
          der2 := p;
        end;
      end if;
      liste1 := liste1.all.suivant;
    end loop;
    return liste2;
  end creersousliste_it;

  function creersousliste_rec(l : ta_ap; binf, bsup : positive) return ta_ap is
  begin
    -- précondition: l est triée sur les prix
    if l = null or else l.all.prix > bsup then
      -- la liste est vide ou on est sûr qu'il n'y aura aucun élément entre binf
      -- et bsup (on est au dela de bsup), on retourne une liste vide
      return null;
    elsif l.all.prix < binf then
      -- on est avant binf, on continue à parcourir les éléments suivants
      return creersousliste_rec(l.all.suivant, binf, bsup);
    else
      -- on est entre binf et bsup, on copie l'élément en cours dans la liste
      -- résultat et on continue à traiter les éléments suivants:
      return new tr_ap'
        (modele  => l.all.modele,
         prix    => l.all.prix,
         suivant => creersousliste_rec (l.all.suivant, binf, bsup));
      -- (c'est le schéma de création d'une liste dans le sens positif en
      -- récursif, en l'occurence c'est comme une copie de liste où on ne copie
      -- que certains éléments)
    end if;
  end creersousliste_rec;


  procedure creercatalogue(l : in ta_ap; catalogue : out ta_gp) is
    binf, bsup : positive;
    der : ta_gp := null;
    p   : ta_gp := null;
  begin
    for gamme in T_Gamme'range loop
      
      -- récupère les bornes binf et bsup pour la gamme
      IntervalledeGamme (EchelledePrix, gamme, binf, bsup);
      
      -- crée la cellule de gamme
      p := new tr_gp'(gamme, null, creersousliste(l, binf, bsup));
      
      -- place la cellule de gamme à la suite
      if der /= null then
        -- après la dernière cellule si il y a des éléments
        der.all.suivant := p;
      else
        -- au début si la liste est vide
        catalogue := p;
      end if;

      der := p;
    end loop;
  end creercatalogue;

  procedure affichecatalogue(cat : in ta_gp) is
    use ada.text_io;
  begin
    if cat /= null then
      if cat.all.appareils /= null then
        put_line(cat.all.gamme'img);
        afficher(cat.all.appareils);
      end if;
      affichecatalogue(cat.all.suivant);
    end if;
  end affichecatalogue;
  
  function selection(cat : ta_gp; gamme : t_gamme) return ta_ap is
  begin
    if cat = null or else cat.all.gamme > gamme then
      return null;
    elsif cat.all.gamme = gamme then
      return cat.all.appareils;
    else
      return selection(cat.all.suivant, gamme);
    end if;
  end selection;

  procedure miseajoursoldes(cat : ta_gp; nom : string; remise : positive; success : out boolean) is
  
    procedure extraireap(l : in out ta_ap; nomap : string; res : out ta_ap) is
      -- presque comme chercheap
    begin
      if l = null then
        res := null;
      elsif l.all.modele.all = nomap then
        res := l;
        l := l.all.suivant; -- on enleve res de l
      else
        extraireap (l.all.suivant, nomap, res);
      end if;
    end extraireap;
  
    function extraireap(cat : ta_gp; nom : string) return ta_ap is
      ap : ta_ap;
    begin
      if cat = null then
        return null;
      else
        extraireap(cat.all.appareils, nom, ap);
        if ap /= null then
          return ap;
        else
          return extraireap(cat.all.suivant, nom);
        end if;
      end if;
    end extraireap;
    
    procedure insereap(l : in out ta_ap; ap : ta_ap) is
    begin
      if l = null or else l.all.prix > ap.all.prix then
        ap.all.suivant := l;
        l := ap;
      else
        insereap(l.all.suivant, ap);
      end if;
    end insereap;
    
    procedure insereap(cat : ta_gp; ap : ta_ap) is
      gamme : t_gamme := Gammedeprix(EchelledePrix, ap.all.prix);
    begin
      if cat = null or else cat.all.gamme > gamme then
        success := false; -- la nouvelle gamme n'existe pas
      elsif cat.all.gamme = gamme then
        insereap(cat.all.appareils, ap);
      else
        insereap(cat.all.suivant, ap);
      end if;
    end insereap;
    
    ap : ta_ap;
  
  begin
    
    ap := extraireap(cat, nom);
    if ap = null then
      success := false;
    else
      success := true;
      ap.all.prix := ap.all.prix - remise;
      insereap(cat, ap);
    end if;
    
  end miseajoursoldes;

  ------------------------------------------------------------------------------
  -- POUR LES EXTENSIONS
  ------------------------------------------------------------------------------
  function Gammedeprix(V : in TV_EchellePrix ; P : in Positive) return T_Gamme is
    -- {} => {resulat = gamme de prix correspondante au prix P selon l'echelle V}
    I : T_Gamme;
  begin
    I := V'First;
    while I<V'Last and P >= V(I) loop
      I:= T_Gamme'Succ(I);
    end loop;
    return I;
  end Gammedeprix;  
  
  procedure IntervalledeGamme(V : in TV_EchellePrix ; Gamme :in T_Gamme; Binf, Bsup : out Positive) is
    -- {} => {Binf = Borne de prix inf pour la gamme Gamme, Bsup = Borne de prix
    --        sup pour la gamme Gamme, bornes incluses}
  begin
    Bsup := V(Gamme) - 1;
    if Gamme = V'First then 
      Binf  := 1;
    else 
      Binf := V(T_Gamme'Pred(Gamme));
    end if;
  end Intervalledegamme;

end P_photo;
