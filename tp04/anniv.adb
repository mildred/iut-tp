with p_dates; use p_dates;
with p_esiut; use p_esiut;

procedure anniv is
  d : tr_date;
  d_jour : T_Joursemaine;
  d_jour_idx : integer range 0 .. 6;
  
  function saisir_date return tr_date is
    d : tr_date;
  begin
    ecrire ("Saisissez une date : jour : ");
    lire(d.jour);
    ecrire ("                     mois : ");
    lire(d.mois);
    ecrire ("                    année : ");
    lire(d.an);
    return d;
  end saisir_date;
  
  function ">" (d1, d2 : tr_date) return boolean is
  begin
    return D1.An > D2.An or
      (D1.An = D2.An and (D1.Mois > D2.Mois or
        (D1.Mois = D2.Mois and D1.Jour > D2.Jour)));
  end ">";
  
  ref : tr_date := (01, 09, 2012);
  ref_jour : T_Joursemaine := Samedi;
  
begin
  d := saisir_date;
  
  d_jour_idx := T_Joursemaine'pos(ref_jour);
  if d > ref then
    d_jour_idx := (d_jour_idx + delta_jours(ref, d)) mod 7;
  else
    d_jour_idx := (d_jour_idx - delta_jours(d, ref)) mod 7;
  end if;
  d_jour := T_Joursemaine'val(d_jour_idx);
  
  ecrire ("Le ");
  affichedate(d);
  ecrire (" sera un " & d_jour'img);
  a_la_ligne;
end anniv;
