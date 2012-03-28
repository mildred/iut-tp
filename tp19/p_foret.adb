with ada.text_io;

package body p_foret is

    procedure affiche_pre  (pa : ta_noeud) is
      use ada.text_io;
    begin
      if pa /= null then
        put (pa.all.info);
        affiche_pre (pa.all.gauche);
        affiche_pre (pa.all.droite);
      end if;
    end affiche_pre;
    
    procedure affiche_inf  (pa : ta_noeud) is
      use ada.text_io;
    begin
      if pa /= null then
        affiche_inf (pa.all.gauche);
        put (pa.all.info);
        affiche_inf (pa.all.droite);
      end if;
    end affiche_inf;
    
    procedure affiche_post (pa : ta_noeud) is
      use ada.text_io;
    begin
      if pa /= null then
        affiche_post (pa.all.gauche);
        affiche_post (pa.all.droite);
        put (pa.all.info);
      end if;
    end affiche_post;

    function creearbrepre (f : in p_car_io.file_type) return ta_noeud is
      use p_car_io;
      c : character;
      res : ta_noeud;
    begin
      if end_of_file (f) then
        return null;
      else
        read (f, c);
        if c = '.' then
          return null;
        else
          res := new tr_noeud;
          res.all.info := c;
          res.all.gauche := creearbrepre(f);
          res.all.droite := creearbrepre(f);
          return res;
        end if;
      end if;
    end creearbrepre;

    function taille (pa : ta_noeud) return natural is
    begin
      if pa = null then
        return 0;
      else
        return 1 + taille (pa.all.gauche) + taille (pa.all.droite);
      end if;
    end taille;
    
    function nbfeuille (pa : ta_noeud) return natural is
    begin
      if pa = null then
        return 0;
      elsif pa.all.gauche = null and pa.all.droite = null then
        return 1;
      else
        return nbfeuille (pa.all.gauche) + nbfeuille (pa.all.droite);
      end if;
    end nbfeuille;
    
    function hauteur (pa : ta_noeud) return natural is
    begin
      if pa = null then
        return 0;
      else
        return natural'max (hauteur (pa.all.gauche), hauteur (pa.all.droite));
      end if;
    end hauteur;

end p_foret;

