with p_esiut; use p_esiut;
package p_dates is
   
   -- 1 : sous-types--------------------------------------------------------------
   subtype T_Jour is Positive range 1..31;
   
   subtype T_Mois is Positive range 1..12;
   
   -- 2 : types structures--------------------------------------------------------
   type Tr_Date is record
      Jour : T_Jour;
      Mois : T_Mois;
      An : Natural;
   end record;
   
   --3 : types enumeres-----------------------------------------------------------
   type T_Joursemaine is (lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche);
   
   type T_Nommois is (janvier,fevrier,mars,avril,mai,juin,juillet,aout,septembre,
                      octobre,novembre,decembre);
      
   -- 4 : instanciation de p_enum pour l'utilisation des types enumeres
   package P_Joursemaine_IO is new P_Enum(T_Joursemaine); use P_Joursemaine_IO;
   
   package P_Mois_IO is new P_Enum(T_Nommois); use P_Mois_IO;
   
   ------------------------------------------------------------------------------
   --5 : fonctions et procedures
   ------------------------------------------------------------------------------
   procedure Affichedate(Date : in TR_Date) ;
   --{} => {Date est affichee a l'ecran sous la forme : 12 janvier 1989}

	function Siecle(Date : in TR_Date) return boolean;
   --{} => {vrai si l'annee de Date est un début de siècle (ex : 900, 1500, 2000)}	

end p_dates;
