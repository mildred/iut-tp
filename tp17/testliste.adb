with p_photo; use p_photo;
with ada.text_io; use ada.text_io;

procedure testliste is
  subtype t_choix is integer range 0 .. 3;
  l : ta_ap;
  
  function menu return t_choix is
  begin
    new_line;
    put_line("MENU:");
    put_line("    0. Quitter");
    put_line("    1. Ouvrir un fichier");
    put_line("    2. Afficher Liste");
    put_line("    3. Modifier le prix d'un appareil");
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
  
  function get_integer (Message : string := "") return integer is
    n : integer;
  begin
    loop
      begin
        if message /= "" then
          put (message);
        end if;
        return integer'value(get_line);
      exception
        when constraint_error =>
          null;
      end;
    end loop;
  end get_integer;
  
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
      when 3 =>
        put("Nom de l'appareil: ");
        declare
          s : constant string := get_line;
          ap : ta_ap;
        begin
          ap := chercheap(l, s);
          if ap = null then
            put_line ("Appareil " & s & " inexistant");
          else
            modifierprix(ap, get_integer("Nouveau prix: "));
          end if;
        end;
    end case;
  end loop;

end testliste;
