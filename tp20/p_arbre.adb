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
    return null;
   end Cherchesquel;
   -------------------------------------------------------------------------
   procedure Ajoutsquel (Rac : in out TA_Squel; Forme : in TR_Mot ) is
   -- {} => {le squelette Forme est inséré dans l'arbre (s'il n'existait pas déjà)}
   begin
    null;
   end Ajoutsquel;
   -------------------------------------------------------------------------
   procedure Afficherarbre (Rac : in TA_Squel) is
   -- voir format d'affichage
   begin
    null;
   end Afficherarbre;
   -------------------------------------------------------------------------
   procedure Copie (Fmot : in out P_Mot_Io.File_Type; Liste : in TA_Mot) is
   -- {Fmot ouvert en écriture} => {tous les mots de Liste ont été copiés dans fmot}         
   -- utilisee par la procédure Sauvefichier pour copier une liste 
   -- de mots dans le fichier dico.dat   
   begin
    null;
   end Copie;
   -------------------------------------------------------------------------
   procedure Sauvefichier (Fmot : in out P_Mot_Io.File_Type; Racine : in Ta_Squel) is
   -- {Fmot ouvert en écriture} => {tous les mots de l'arbre ont été copiés dans fmot}
   begin
    null;
   end Sauvefichier;
   
   -- **********************************************************************
   
   procedure Insermot (MOT : in TR_Mot ; Nouveau : out boolean) is
   -- {} => {si MOT n'était pas présent dans le dictionnaire, il a été inséré
   --       dans la liste des mots de même squelette, Nouveau = vrai,
   --       sinon Nouveau = faux}
   begin
    null;
   end Insermot;

   procedure AffichDico is
   -- {} => {la liste des mots du dictionnaire a été affichée selon 
   --        le format : 
   --        squelettemot 
   --	            mot mot mot mot mot(maxi 5 par ligne)
   --	            mot mot
   --        squelettemot ... etc. 
   begin
    null;
   end AffichDico;
  
   procedure Listmots (MOT : in TR_Mot) is
   -- {} => {La liste des mots de même squelette que MOT est affichée}
   --        Utile pour proposer une alternative au mot saisi dans le cas
   --        où le squelette de ce mot est présent dans l'arbre
   begin
    null;
   end ListMots;

   function Verifmot (MOT : in TR_Mot) return Boolean is
   -- {} => {résultat = vrai si le mot est dans le dictionnaire, faux sinon}
   begin
    return false;
   end Verifmot;
   
   procedure Charge is
   -- {} => {le fichier fdico.dat est chargé en memoire sous forme d'arbre} 
   begin
    null;
   end Charge;

   procedure Sauve is
   -- {} => {l'ensemble des mots de l'arbre est copié dans le fichier fdico.dat 
   --        suite à l'insertion de nouveaux mots dans l'arbre
   begin
    null;
   end Sauve;
end p_arbre;

