with sequential_io;
With P_Esiut ; use P_Esiut ;
 
package P_Photo is
 
   -- TYPES pour le fichier binaire d'appareils photo (app.dat)----------------
   type TR_Appareil is record
      Modele : string(1..20);
      NbcarModele : integer;
      Prix : Positive;
   end record;
 
   package P_Appareil_Io is new Sequential_Io(TR_Appareil); use P_Appareil_Io;
 

 
end P_photo;
