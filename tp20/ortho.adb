with p_esiut; use p_esiut;
with p_liste, p_arbre; use p_liste, p_arbre;

procedure ortho is
   choix : character;
   Mot : TR_Mot;
   Nouveau : boolean := false;
begin
   Charge;
   Ecrire_ligne("Fin de chargement du dictionnaire");
   loop
      a_la_ligne;
      Ecrire_ligne("* 1 - Ajouter un nouveau mot au dictionnaire ");
      Ecrire_ligne("* 2 - Verifier l'orthographe d'un mot ");
      Ecrire_ligne("* 3 - Afficher le contenu du dictionnaire ");
      Ecrire_ligne("* 4 - Sauver sur disque le dictionnaire (apres insertion de nouveaux mots)");
      Ecrire_ligne("* 5 - EXTENSION (...) ");
      Ecrire_ligne("* 6 - Quitter ");
      Lire(choix);
      case choix is
         when '1' =>
            Ecrire("Mot a inserer : ");
            SaisieMot(Mot);
            InserMot(Mot,Nouveau);
            if Nouveau then
               Ecrire_ligne("Insertion OK");
            else
               Ecrire_ligne("Mot present dans le dictionnaire");      
            end if;
         when '2' =>
            Ecrire_ligne("Mot a verifier : ");
            SaisieMot(Mot);
            ecrire_ligne("mot saisi : " & mot.ch(1..mot.long));
            if VerifMot(Mot) then
               Ecrire_ligne("Orthographe correcte");
            else
               Ecrire_ligne("Mot inexistant, liste des mots approchants : ");
               ListMots(Mot);
            end if;
         when '3' =>
            AffichDico;
         when '4' =>
            if Nouveau then
               Ecrire_ligne("Sauvegarde en cours...");
               Sauve;
               Ecrire_ligne("Sauvegarde OK");
            else
               Ecrire_ligne("Pas de nouveaux mots...");
            end if;
         when '5' =>
            --- a completer suivant extension...
            null;
         when '6' =>
            exit;
         when others =>
            Ecrire_ligne("Vous devez choisir un entier entre 1 et 6");
      end case;
   end loop;              
end ortho;

