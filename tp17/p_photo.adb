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

end P_photo;
