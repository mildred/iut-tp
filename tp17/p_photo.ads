with ada.sequential_io;
with p_esiut;       use p_esiut ;

package p_photo is

  -- types pour le fichier binaire d'appareils photo (app.dat)----------------
  type tr_appareil is record
    modele      : string(1..20);
    nbcarmodele : integer;
    prix        : positive;
  end record;

  package p_appareil_io is new ada.sequential_io(tr_appareil); use p_appareil_io;

  type ta_string is access string;
  type tr_ap;
  type ta_ap is access tr_ap;
  type tr_ap is
    record
      modele  : ta_string;
      prix    : positive;
      suivant : ta_ap;
    end record;

  procedure creerliste(f : in out p_appareil_io.file_type; l : out ta_ap);
  procedure creerliste(filename : string; l : out ta_ap);
  procedure afficher(l : ta_ap);
  function chercheap(l : in ta_ap; nomap : in string) return ta_ap;
  procedure modifierprix(l : in ta_ap; prix : in positive);
  procedure inseretete(l : in out ta_ap; nom : string; prix : positive);
  procedure inserefin(l : in out ta_ap; nom : string; prix : positive);
  procedure inseretrieprix(l : in out ta_ap; article : in tr_ap);
  procedure trilisteprix(l : in out ta_ap);
 
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

end p_photo;
