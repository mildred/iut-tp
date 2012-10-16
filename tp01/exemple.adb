with P_Esiut; use P_Esiut;	-- Le programme de ce fichier va utiliser P_Esiut

procedure exemple is		-- Programme principal exemple
 
	K : Integer;		-- Déclarations
	Pi : Float ;	
	X : Character ;	
	Nom : String (1..20);
	Formule : String(1..10) ;
	
begin				-- Début de l'algorithme

	K := -65536;		-- Initialisations des variables
	Pi := 3.14;	
	X  := '!';	
	Formule := "Bonjour   ";  -- chaine de 10 caracteres exactement
	
	Ecrire (2);
	Ecrire('K');		
	Ecrire_Ligne (K);	
	
	Ecrire("Pi = "); Ecrire_Ligne (Pi);

	Ecrire ("X : ");
	Ecrire (X);
	A_La_Ligne;			-- car Ecrire_Ligne n'existe pas pour un caractere
	
	Ecrire_Ligne (Formule);
	Ecrire ("Quel est votre nom ? ");
	lire (Nom);			-- Lire complete pas des espaces et passe a la ligne
	Ecrire_Ligne (Formule & Nom);

	Pause;
	
	Formule :="Au revoir ";
	Ecrire_Ligne(Formule & X & '.');

end exemple;			-- Fin de l'algorithme
