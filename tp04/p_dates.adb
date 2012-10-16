with p_esiut; use p_esiut;
package body p_dates is

  To_Nom_Mois : array (T_Mois) of T_Nommois :=
    (janvier, fevrier, mars, avril, mai, juin, juillet,
     aout, septembre, octobre, novembre, decembre);
  
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
  begin
    return To_Nom_Mois (M)'Img;
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

  function Bissextile(Date : in TR_Date) return Boolean is
  --{} => {vrai si l'année de Date est une année bissextile (voir indications)}
  begin
    if siecle(date) then
      return (date.an / 100) mod 4 = 0;
    else
      return Date.An mod 4 = 0;
    end if;
  end bissextile;

  function NbjoursAn(Date : in TR_Date) return Positive is
  --{} => {résultat = nombre de jours de l’année de Date}
  begin
    if bissextile (date) then
      return 366;
    else
      return 365;
    end if;
  end nbjoursan;

  function Nbjours_Mois(Date: in TR_Date) return T_jour is
  --{} => {nombre de jours du mois de Date}
  begin
    case To_Nom_Mois (Date.Mois) is
      when janvier | mars | mai | juillet | aout | octobre | decembre =>
        return 31;
      when avril | juin | septembre | novembre =>
        return 30;
      when fevrier =>
        if Bissextile (date) then
          return 29;
        else
          return 28;
        end if;
    end case;
  end Nbjours_Mois;

  function Nbjours_Depuis0101(Date : in TR_Date) return natural is
  --{} => { résultat = nombre de jours écoulés depuis le 1er janvier de l’année de Date
  -- exemple : si Date = 25/01/2008, résultat = 24}
    nb : natural := 0;
    date2 : tr_date := date;
  begin
    for M in T_Mois'First .. Date.Mois - 1 loop
      date2.mois := M;
      nb := nb + nbjours_mois (date2);
    end loop;
    return nb + date.jour;
  end Nbjours_Depuis0101;

  function Delta_Jours(D1, D2: in TR_Date) return natural is
  --{D1 anterieure à D2} => {nombre de jours d'écart entre D1 et D2}
    nbjours : integer := 0;
    d : tr_date;
  begin
    for A in D1.An .. D2.An - 1 loop
      d.An := A;
      nbjours := nbjours + nbjoursan(d);
    end loop;
    return nbjours
      - Nbjours_Depuis0101 (D1)
      + Nbjours_Depuis0101 (D2);
  end Delta_Jours;

end p_dates;
