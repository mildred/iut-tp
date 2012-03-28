with ada.text_io; use ada.text_io;
with p_foret; use p_foret;

procedure testforet is
  type t_parcours is (pre, inf, post);
  
  procedure read_file(fname : string; parcours : t_parcours) is
    use p_car_io;
    f : p_car_io.file_type;
    pa : ta_noeud;
  begin
    open (f, in_file, fname);
    pa := creearbrepre (f);
    case parcours is
      when pre =>     affiche_pre  (pa);
      when inf =>     affiche_inf  (pa);
      when post =>    affiche_post (pa);
    end case;
    put_line (taille(pa)'img & nbfeuille(pa)'img & hauteur(pa)'img);
    close (f);
  end read_file;
  
  procedure write_file (fname : string; content : string) is
    use p_car_io;
    f : p_car_io.file_type;
  begin
    create (f, out_file, fname);
    for i in content'range loop
      write(f, content(i));
    end loop;
    close(f);
  end write_file;
  
begin
  read_file ("fichcarpre", pre);
  read_file ("fichcarinf", inf);
  read_file ("fichcarpost", post);
  write_file("mimosa", "MIM..O..S.A.."); read_file ("mimosa", pre);
  write_file("animal", "LIA..N..AM..."); read_file ("animal", post);
  write_file("cantonales", "ONAC...T..EAN..L..S..");
  read_file ("cantonales", inf);
end testforet;
