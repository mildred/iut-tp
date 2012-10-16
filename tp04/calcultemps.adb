with p_dates; use p_dates;
with p_esiut; use p_esiut;

procedure calcultemps is
  d, d2 : tr_date;
  
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
  
begin
  d := saisir_date;
  affichedate(d);
  a_la_ligne;
  if siecle(d) then
    ecrire_ligne ("L'année" & d.an'img & " est en début de siècle");
  end if;
  if bissextile(d) then
    ecrire_ligne ("L'année" & d.an'img & " est bissextile");
  end if;
  ecrire_ligne ("Il y a" & nbjoursan (d)'img & " jours en" & d.an'img);
  ecrire_ligne ("Il y a" & nbjours_mois(d)'img & " jours ce mois-ci");
  ecrire_ligne ("C'est le" & nbjours_depuis0101(d)'img & "e jour de l'année");
  d2 := saisir_date;
  ecrire ("Il y a" & Delta_Jours (d, d2)'img & " jours entre le ");
  affichedate(d);
  ecrire (" et le ");
  affichedate(d2);
  a_la_ligne;
end calcultemps;
