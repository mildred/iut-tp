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
   
  function Bissextile(Date : in TR_Date) return Boolean;
  --{} => {vrai si l'année de Date est une année bissextile (voir indications)}

  function NbjoursAn(Date : in TR_Date) return Positive;
  --{} => {résultat = nombre de jours de l’année de Date}

  function Nbjours_Mois(Date: in TR_Date) return T_jour;
  --{} => {nombre de jours du mois de Date}

  function Nbjours_Depuis0101(Date : in TR_Date) return natural;
  --{} => { résultat = nombre de jours écoulés depuis le 1er janvier de l’année de Date
  -- exemple : si Date = 25/01/2008, résultat = 24}

  function Delta_Jours(D1, D2: in TR_Date) return natural;
  --{D1 anterieure à D2} => {nombre de jours d'écart entre D1 et D2}

end p_dates;
