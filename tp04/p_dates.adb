with p_esiut; use p_esiut;
package body p_dates is
  
  function To_String (N : Integer) return String is
    S : constant String := N'Img;
  begin
    if N > 0 then
      return S (S'First + 1 .. S'Last);
    else
      return S;
    end if;
  end To_String;
  
  function To_String_Mois (M : T_Mois) return String is
    Mois : constant T_Nommois := T_Nommois'Val (M);
  begin
    return Mois'Img;
  end To_String_Mois;
  
  function To_String (Date : TR_Date) return String is
  begin
    return To_String (Date.Jour) & " " & To_String_Mois (Date.Mois) &
      " " & To_String (Date.An);
  end To_String;
  
  procedure Affichedate(Date : in TR_Date) is
  --{} => {Date est affichee a l'ecran sous la forme : 12 janvier 1989}
  begin
    Ecrire (To_String (Date));
  end Affichedate;

	function Siecle(Date : in TR_Date) return boolean is
  --{} => {vrai si l'annee de Date est un début de siècle (ex : 900, 1500, 2000)}	
  begin
    return Date.An mod 100 = 0;
  end Siecle;

end p_dates;
