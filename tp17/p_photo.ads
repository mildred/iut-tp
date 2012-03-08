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

end p_photo;
