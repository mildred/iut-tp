
package body prix is
 
  ------------------------------------------------------------------------------------------------
  -- POUR LES EXTENSIONS
  ------------------------------------------------------------------------------------------------
  function Gammedeprix(V : in TV_EchellePrix ; P : in Positive) return T_Gamme is
  -- {} => {resulat = gamme de prix correspondante au prix P selon l'echelle V}
  I : T_Gamme;
  begin
    I := V'First;
    while I<V'Last and P >= V(I) loop
       I:= T_Gamme'Succ(I);
    end loop;
    return I;
  end Gammedeprix;  
  
  procedure IntervalledeGamme(V : in TV_EchellePrix ; Gamme :in T_Gamme; Binf, Bsup : out Positive) is
  -- {} => {Binf = Borne de prix inf pour la gamme Gamme, Bsup = Borne de prix sup pour la gamme Gamme, bornes incluses}
  begin
    Bsup := V(Gamme) - 1;
    if Gamme = V'First then 
      Binf  := 1;
    else 
      Binf := V(T_Gamme'Pred(Gamme));
    end if;
  end Intervalledegamme;  

end Prix;
