 
package Prix is
 
   -- TYPES et procedures pour la partie 3 ------------------------------------------
   
   type T_Gamme is (Eco,Modere,ModereX,ModereXX,HautdeGamme,HautdeGammeX,HautdeGammeXX) ;
 
   package P_Enum_Gamme_IO is new P_Enum(T_Gamme); use P_Enum_Gamme_Io ;
   
   type TR_GP;
   
   type TA_GP is access TR_GP;
   
   type TR_GP is record
      Gamme : T_Gamme;
      Suivant : TA_GP;
      Appareils : TA_AP;
   end record; 
   
   type TV_EchellePrix is array(T_Gamme) of Positive;
 
   EchelledePrix : TV_EchellePrix := (
      Eco => 150,
      Modere => 200,
      ModereX => 300,
      ModereXX => 350,
      HautdeGamme =>450,
      HautdeGammeX => 600,
      HautdeGammeXX => Positive'Last) ;
 
   -- d'après cette échelle:
   -- prix des appareils Eco < 150
   -- prix des appareils Modere dans l'intervalle [150,200[
   -- prix des appareils ModereX dans l'intervalle [200,300[
   -- etc.
   -----------------------------------------------------------------------------------------------
   function Gammedeprix(V : in TV_EchellePrix ; P : in Positive) return T_Gamme ;
   -- {} => {résulat = gamme de prix correspondante au prix P d'après l'échelle considérée représentée par V}
   -----------------------------------------------------------------------------------------------    
   procedure IntervalledeGamme(V : in TV_EchellePrix ; Gamme :in T_Gamme; Binf, Bsup : out Positive);
   -- {} => {Binf = Borne de prix inf pour la gamme Gamme, Bsup = Borne de prix sup pour la gamme Gamme, bornes incluses}

 end prix;
