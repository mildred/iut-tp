with p_photo; use p_photo;
with ada.text_io; use ada.text_io;

procedure testliste is
  subtype t_choix is integer range 0 .. 2;
  l : ta_ap;
  
  function menu return t_choix is
  begin
    new_line;
    put_line("MENU:");
    put_line("    0. Quitter");
    put_line("    1. Ouvrir un fichier");
    put_line("    2. Afficher Liste");
    loop
      put("choix: ");
      declare
        s : constant string := get_line;
      begin
        return n : t_choix := t_choix'value(s) do
          new_line;
        end return;
      exception
        when constraint_error =>
          null;
      end;
    end loop;
  end menu;
  
begin
  put_line ("Ouverture de app.dat");
  creerliste("app.dat", l);

  loop
    case menu is
      when 0 =>
        exit;
      when 1 =>
        put ("Fichier: ");
        declare
          f : constant string := get_line;
        begin
          creerliste(f, l);
        end;
      when 2 =>
        afficher(l);
    end case;
  end loop;

end testliste;
