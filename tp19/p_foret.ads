with sequential_io;

package p_foret is
   ------------------------------------------------------------------
   -- pour gerer des fichiers sequentiels binaires de caracteres
   package p_car_io is new sequential_io(character); use p_car_io;
   ------------------------------------------------------------------
   
   type tr_noeud;
   type ta_noeud is access tr_noeud;
   type tr_noeud is
    record
      gauche : ta_noeud;
      info : character;
      droite : ta_noeud;
    end record;
    
    procedure affiche_pre  (pa : ta_noeud);
    procedure affiche_inf  (pa : ta_noeud);
    procedure affiche_post (pa : ta_noeud);
    function creearbrepre (f : in p_car_io.file_type) return ta_noeud;
    function taille (pa : ta_noeud) return natural;
    function nbfeuille (pa : ta_noeud) return natural;
    function hauteur (pa : ta_noeud) return natural;

end p_foret;

