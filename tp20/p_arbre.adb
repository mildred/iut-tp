with Sequential_Io;
with p_esiut; use p_esiut;
package body p_arbre is

   --***************************************************************************
   -- types
   -----------------------------------------------------------------------------
   type TR_Squel; 
   type TA_Squel is access TR_Squel; 

   type TR_Squel is 
      record 
         Squelette : Tr_Mot;   --mot représentant le squelette  
         Listmots  : Ta_Mot;   --liste des mots de même squelette 
         Gauche, Droite : Ta_Squel;  
      end record; 

   package P_Mot_Io is new Sequential_Io(Tr_Mot); use P_Mot_Io;
   Fmot : P_Mot_Io.File_Type; -- dictionnaire des mots  
      
   
   Racine : Ta_Squel;   --racine de l'arbre représentant le mot.
   --***************************************************************************
   procedure Calcsquel (MOT : in TR_Mot; Forme : out TR_Mot) is
   -- {} => {Forme contient la forme de MOT (voir ci-dessous)}
   --        La forme d'un mot est la suite de lettres qui le composent tries 
   --        dans l'ordre alphabétique et sans duplication
   --        Exp: mot = programme  => Forme = aegmopr 
    ajout : boolean;
    i : integer;
   begin
    forme.long := 0;
    for c in character'('a') .. character'('z') loop
      ajout := false;
      i := 1;
      while i <= mot.long and not ajout loop
        if mot.ch (i) = c then
          forme.long := forme.long + 1;
          forme.ch (forme.long) := c;
          ajout := true;
        end if;
        i := i + 1;
      end loop;
    end loop;
   end Calcsquel;
   -------------------------------------------------------------------------
   function Cherchesquel (Rac : in TA_Squel; Forme : in TR_Mot) return TA_Squel is
   -- {} => {Résultat = pointeur sur Forme s'il existe dans l'arbre Rac, nil sinon}
   begin
    if rac = null then
      return null;
    elsif to_string (forme) > to_string (rac.all.squelette) then
      return Cherchesquel (rac.all.gauche, forme);
    elsif to_string (forme) < to_string (rac.all.squelette) then
      return Cherchesquel (rac.all.droite, forme);
    else
      return rac;
    end if;
   end Cherchesquel;
   -------------------------------------------------------------------------
   procedure Ajoutsquel (Rac : in out TA_Squel; Forme : in TR_Mot ) is
   -- {} => {le squelette Forme est inséré dans l'arbre (s'il n'existait pas déjà)}
   begin
    if rac = null then
      rac := new TR_Squel;
      rac.all.squelette := forme;
      rac.all.listMots := null;
      rac.all.gauche := null;
      rac.all.droite := null;
    elsif to_string (forme) > to_string (rac.all.squelette) then
      Ajoutsquel (rac.all.gauche, forme);
    elsif to_string (forme) < to_string (rac.all.squelette) then
      Ajoutsquel (rac.all.droite, forme);
    end if;
   end Ajoutsquel;
   -------------------------------------------------------------------------
   procedure Afficherarbre (Rac : in TA_Squel) is
   -- voir format d'affichage
   begin
    if rac /= null then
      Afficherarbre (rac.all.gauche);
      ecrire_ligne (to_string (rac.all.squelette));
      AffichlistMots (rac.all.listMots);
      a_la_ligne;
      Afficherarbre (rac.all.droite);
    end if;
   end Afficherarbre;
   -------------------------------------------------------------------------
   procedure Copie (Fmot : in out P_Mot_Io.File_Type; Liste : in TA_Mot) is
   -- {Fmot ouvert en écriture} => {tous les mots de Liste ont été copiés dans fmot}         
   -- utilisee par la procédure Sauvefichier pour copier une liste 
   -- de mots dans le fichier dico.dat   
   begin
    if liste /= null then
      write (fmot, liste.all.mot);
      Copie (fmot, liste.all.suivant);
    end if;
   end Copie;
   -------------------------------------------------------------------------
   procedure Sauvefichier (Fmot : in out P_Mot_Io.File_Type; Racine : in Ta_Squel) is
   -- {Fmot ouvert en écriture} => {tous les mots de l'arbre ont été copiés dans fmot}
   begin
    if Racine /= null then
      Sauvefichier (fmot, Racine.all.gauche);
      Copie (fmot, Racine.all.listMots);
      Sauvefichier (fmot, Racine.all.droite);
    end if;
   end Sauvefichier;
   
   -- **********************************************************************
   
   procedure Insermot (MOT : in TR_Mot ; Nouveau : out boolean) is
   -- {} => {si MOT n'était pas présent dans le dictionnaire, il a été inséré
   --       dans la liste des mots de même squelette, Nouveau = vrai,
   --       sinon Nouveau = faux}
    forme : tr_mot;
    p : ta_squel;
   begin
    Calcsquel (mot, forme);
    Ajoutsquel (racine, forme);
    p := Cherchesquel (racine, forme);
    AjoutMot(p.all.listMots, mot, Nouveau);
   end Insermot;

   procedure AffichDico is
   -- {} => {la liste des mots du dictionnaire a été affichée selon 
   --        le format : 
   --        squelettemot 
   --	            mot mot mot mot mot(maxi 5 par ligne)
   --	            mot mot
   --        squelettemot ... etc. 
   begin
    Afficherarbre(racine);
   end AffichDico;
  
   procedure Listmots (MOT : in TR_Mot) is
   -- {} => {La liste des mots de même squelette que MOT est affichée}
   --        Utile pour proposer une alternative au mot saisi dans le cas
   --        où le squelette de ce mot est présent dans l'arbre
    forme : tr_mot;
    p : ta_squel;
   begin
    Calcsquel (mot, forme);
    p := Cherchesquel (racine, forme);
    if p = null then
      ecrire_ligne ("Aucune proposition");
    else
      AffichlistMots (p.all.listMots);
      a_la_ligne;
    end if;
   end ListMots;

   function Verifmot (MOT : in TR_Mot) return Boolean is
   -- {} => {résultat = vrai si le mot est dans le dictionnaire, faux sinon}
    forme : tr_mot;
    p : ta_squel;
   begin
    Calcsquel (mot, forme);
    p := Cherchesquel (racine, forme);
    if p = null then
      return false;
    else
      return Cherchemot(p.all.listMots, mot);
    end if;
   end Verifmot;
   
   procedure Charge is
   -- {} => {le fichier fdico.dat est chargé en memoire sous forme d'arbre} 
    f : P_Mot_Io.File_Type;
    m : tr_mot;
    foo : boolean;
   begin
    open (f, in_file, "fdico.dat");
    while not end_of_file (f) loop
      read (f, m);
      Insermot (m, foo);
    end loop;
    close (f);
   end Charge;

   procedure Sauve is
   -- {} => {l'ensemble des mots de l'arbre est copié dans le fichier fdico.dat 
   --        suite à l'insertion de nouveaux mots dans l'arbre
    f : P_Mot_Io.File_Type;
   begin
    create (f, out_file, "fdico.dat");
    Sauvefichier (f, racine);
    close (f);
   end Sauve;
end p_arbre;

