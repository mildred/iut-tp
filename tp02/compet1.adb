with P_Esiut; use P_Esiut;

procedure compet1 is -- saisie des temps de 2 juges et affichage du minimum

  subtype T_Temps is Float range 0.0..20.0; -- un T_temps est un reel compris entre 0 et 20

  ------------------------------------------------------------------------------------------
  function Min (X,Y : in T_Temps) return T_Temps is
    -- specif {} => {resultat = minimum de X et Y }
  begin
    -- a completer
  end Min;
  ------------------------------------------------------------------------------------------
  
  T1, T2, TempsMin : T_Temps; -- pour memoriser les temps des juges
  
begin -- programme principal

  Ecrire("Entrez le temps du juge n°1 : "); Lire(T1);   -- saisie du temps du juge n°1
  Ecrire("Entrez le temps du juge n°2 : "); Lire(T2);   -- saisie du temps du juge n°2
  
  TempsMin := Min(T1, T2);                              -- calcul du minimum de T1 et T2
  
  Ecrire("Le temps minimum est : "); Ecrire(TempsMin); A_La_Ligne;
  
end compet1;




