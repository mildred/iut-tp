with sequential_io;

package p_foret is
   ------------------------------------------------------------------
   -- pour gerer des fichiers sequentiels binaires de caracteres
   package p_car_io is new sequential_io(character); use p_car_io;
   ------------------------------------------------------------------   

end p_foret;

