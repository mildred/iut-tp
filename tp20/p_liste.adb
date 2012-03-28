package body p_liste is

   function Minuscule (C : in Character ) return Character is
   begin
    if C in 'A' .. 'Z' then
      return Character'Val (Character'Pos (C) + Character'Pos ('a') - Character'Pos ('A'));
    else
      return C;
    end if;
   end Minuscule;

   procedure Saisiemot (Mot : out TR_Mot ) is
   begin
    loop
      begin
        lire_tranche (mot.ch, mot.long);
        for i in 1 .. mot.long loop
          mot.ch (i) := minuscule (mot.ch (i));
          if mot.ch (i) not in 'a' .. 'z' then
            raise Constraint_Error;
          end if;
        end loop;
        exit;
      exception
        when others =>
          ecrire_ligne ("Recommencez");
      end;
    end loop;
   end Saisiemot;
   
   function to_string (mot : tr_mot) return string is
   begin
    return mot.ch (1..mot.long);
   end to_string;

   function Cherchemot (ListMots : in TA_Mot; Mot: in TR_Mot) return Boolean is
   begin
    if ListMots = null or else to_string (ListMots.all.mot) > to_string (mot) then
      return false;
    elsif to_string (ListMots.all.mot) = to_string (mot) then
      return true;
    else
      return Cherchemot (listMots.all.suivant, mot);
    end if;
   end Cherchemot;
   
   procedure AjoutMot (ListMots : in out TA_Mot; Mot : in TR_Mot; Ajout : out boolean) is
     p : ta_mot;
   begin
    if ListMots = null or else to_string (ListMots.all.mot) > to_string (mot) then
      ajout := true;
      p := new tr_cellmot;
      p.all.mot := mot;
      p.all.suivant := ListMots;
      ListMots := p;
    elsif to_string (ListMots.all.mot) = to_string (mot) then
      ajout := false;
    else
      AjoutMot (listMots.all.suivant, mot, ajout);
    end if;
   end AjoutMot;

   procedure AffichlistMots (ListMots : in TA_Mot ) is
   begin
    if ListMots /= null then
      ecrire_ligne (to_string (ListMots.all.mot));
      AffichlistMots (ListMots.all.suivant);
    end if;
   end AffichlistMots;

end p_liste;
