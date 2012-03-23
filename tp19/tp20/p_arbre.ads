with P_Liste; use P_Liste;
package p_arbre is

   procedure Insermot (MOT : in TR_Mot ; Nouveau : out boolean);
   -- {} => {si MOT n'était pas présent dans le dictionnaire, il a été inséré
   --       dans la liste des mots de même squelette, Nouveau = vrai,
   --       sinon Nouveau = faux}

   procedure AffichDico;
   -- {} => {la liste des mots du dictionnaire a été affichée selon 
   --        le format : 
   --        squelettemot 
   --	            mot mot mot mot mot(maxi 5 par ligne)
   --	            mot mot
   --        squelettemot ... etc. 
  
   procedure Listmots (MOT : in TR_Mot); 
   -- {} => {La liste des mots de même squelette que MOT est affichée}
   --        Utile pour proposer une alternative au mot saisi dans le cas
   --        où le squelette de ce mot est présent dans l'arbre

   function Verifmot (MOT : in TR_Mot) return Boolean;
   -- {} => {résultat = vrai si le mot est dans le dictionnaire, faux sinon}
   
   procedure Charge;
   -- {} => {le fichier fdico.dat est chargé en memoire sous forme d'arbre} 

   procedure Sauve;
   -- {} => {l'ensemble des mots de l'arbre est copié dans le fichier fdico.dat 
   --        suite à l'insertion de nouveaux mots dans l'arbre 
end p_arbre;