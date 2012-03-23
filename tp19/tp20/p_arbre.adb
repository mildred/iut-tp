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
   procedure Calcsquel (MOT : in TR_Mot; Forme : out TR_Mot) ; 
   -- {} => {Forme contient la forme de MOT (voir ci-dessous)}
   --        La forme d'un mot est la suite de lettres qui le composent tries 
   --        dans l'ordre alphabétique et sans duplication
   --        Exp: mot = programme  => Forme = aegmopr 
   -------------------------------------------------------------------------
   function Cherchesquel (Rac : in TA_Squel; Forme : in TR_Mot) return TA_Squel ; 
   -- {} => {Résultat = pointeur sur Forme s'il existe dans l'arbre Rac, nil sinon}
   -------------------------------------------------------------------------
   procedure Ajoutsquel (Rac : in out TA_Squel; Forme : in TR_Mot ) ;
   -- {} => {le squelette Forme est inséré dans l'arbre (s'il n'existait pas déjà)}
   -------------------------------------------------------------------------
   procedure Afficherarbre (Rac : in TA_Squel) ; 
   -- voir format d'affichage
   -------------------------------------------------------------------------
   procedure Copie (Fmot : in out P_Mot_Io.File_Type; Liste : in TA_Mot) ;
   -- {Fmot ouvert en écriture} => {tous les mots de Liste ont été copiés dans fmot}         
   -- utilisee par la procédure Sauvefichier pour copier une liste 
   -- de mots dans le fichier dico.dat   
   -------------------------------------------------------------------------
   procedure Sauvefichier (Fmot : in out P_Mot_Io.File_Type; Racine : in Ta_Squel) ; 
   -- {Fmot ouvert en écriture} => {tous les mots de l'arbre ont été copiés dans fmot}
   --***************************************************************************
   -- A COMPLETER par les procédures et fonctions definies dans p_arbre.ads
   --***************************************************************************
end p_arbre;

