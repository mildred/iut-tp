with p_photo; use p_photo;
with ada.text_io; use ada.text_io;

procedure testsousliste is
  subtype t_choix is integer range 0 .. 10;
  l   : ta_ap;
  cat : ta_gp;
  
  function menu return t_choix is
  begin
    new_line;
    put_line("MENU:");
    put_line("    0. Quitter");
    put_line("    1. Ouvrir un fichier");
    put_line("    2. Afficher Liste");
    put_line("    3. Modifier le prix d'un appareil");
    put_line("    4. Insertion d'un appareil");
    put_line("    5. Sélection d'une sous liste (itératif)");
    put_line("    6. Sélection d'une sous liste (récursif)");
    put_line("    7. Création du catalogue");
    put_line("    8. Affichage du catalogue");
    put_line("    9. Sélection d'une gamme");
    put_line("   10. Mise à jour de prix");
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
  
  function get_positive (Message : string := "") return positive is
  begin
    loop
      begin
        if message /= "" then
          put (message);
        end if;
        return positive'value(get_line);
      exception
        when constraint_error =>
          null;
      end;
    end loop;
  end get_positive;
  
  function get_gamme (Message : string := "Choisissez une gamme: ") return t_gamme is
  begin
    put_line("Gammes:");
    for gamme in t_gamme'range loop
      put_line(t_gamme'Pos(gamme)'img & ". " & gamme'img);
    end loop;
    loop
      if message /= "" then
        put (message);
      end if;
      declare
        s : constant string := get_line;
      begin
        return t_gamme'value(s);
      exception
        when constraint_error =>
          begin
            return t_gamme'val(integer'value(s));
          exception
            when constraint_error =>
              null;
          end;
      end;
    end loop;
  end get_gamme;
  
  choix : t_choix;
  
begin
  put_line ("Ouverture de app.dat");
  creerliste("app.dat", l);
  trilisteprix(l);
  creercatalogue(l, cat);

  loop
    choix := menu;
    case choix is
      when 0 =>
        exit;
      when 1 =>
        put ("Fichier: ");
        declare
          f : constant string := get_line;
        begin
          creerliste(f, l);
        end;
        trilisteprix(l);
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
            modifierprix(ap, get_positive("Nouveau prix: "));
          end if;
        end;
      when 4 =>
        put("Nom de l'appareil: ");
        declare
          nom : constant string := get_line;
          prix : positive := get_positive("Prix: ");
        begin
          inseretrieprix(l, tr_ap'(new string'(nom), prix, null));
        end;
      when 5 .. 6 =>
        declare
          binf, bsup : integer;
        begin
          binf := get_positive("Borne inférieure de prix: ");
          bsup := get_positive("Borne supérieure de prix: ");
          if choix = 5 then
            afficher(creersousliste_it(l, binf, bsup));
          else
            afficher(creersousliste_rec(l, binf, bsup));
          end if;
        end;
      when 7 =>
        creercatalogue(l, cat);
      when 8 =>
        affichecatalogue(cat);
      when 9 =>
        afficher(selection(cat, get_gamme));
      when 10 =>
        put("Nom de l'appareil: ");
        declare
          nom : constant string := get_line;
          remise : positive;
          res : boolean;
        begin
          remise := get_positive("Remise à effectuer: ");
          miseajoursoldes(cat, nom, remise, res);
          if res then
            put_line("L'appareil " & nom & " à eu une remise de" & remise'img);
          else
            put_line("L'appareil " & nom & " n'existe pas");
          end if;
        end;
    end case;
  end loop;

end testsousliste;
