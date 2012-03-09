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
  begin
    -- pareil que trilisteprix sauf que je ne fais l'insertion que si je suis
    -- entre binf et bsup
    while liste1 /= null loop
      if liste1.all.prix >= binf and liste1.all.prix <= bsup then
        inseretrieprix(liste2, liste1.all);
      end if;
      liste1 := liste1.all.suivant;
    end loop;
    return liste2;
  end creersousliste;

  function creersousliste_rec(l : ta_ap; binf, bsup : positive) return ta_ap is

  begin
    while liste1 /= null loop
      if liste1.all.prix >= binf and liste1.all.prix <= bsup then
        inseretrieprix(liste2, liste1.all);
      end if;
      liste1 := liste1.all.suivant;
    end loop;
    return liste2;
  end creersousliste;

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
