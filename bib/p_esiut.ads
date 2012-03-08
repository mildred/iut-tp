  
  --*************************************
  -- auteur Daniel Feneuille I.U.T. Aix *
  --*************************************
  --
  --=======================
  -- partie SPECIFICATIONS
  --=======================
  --
  with TEXT_IO; 
  
  package p_esiut is
     
     --==============================================
     -- Procedures d'entres/sorties sur les entiers
     --==============================================
     
     procedure ECRIRE(L_ENTIER : in integer);
  	   -- permet d'ecrire un entier sur la ligne a partir de la position
  	   -- initiale du curseur.
     procedure ECRIRE_LIGNE(L_ENTIER : in integer);
           -- c'est ECRIRE + A_LA_LIGNE
     procedure LIRE(L_ENTIER : out integer);
  	   -- permet de lire un INTEGER dans une base quelconque (2 a 16) avec
  	   -- validation (on recommence jusqu'a ce qu'il soit valable)
  
     --===============================================
     -- Procedures d'entres/sorties sur les flottants
     --===============================================
  
     procedure ECRIRE(LE_REEL : in FLOAT);
  	   -- permet d'ecrire un FLOAT sur la ligne a partir de la position
  	   -- initiale du curseur. Si l'on souhaite aller a la ligne ensuite
  	   -- utiliser en plus la procedure A_LA_LIGNE. Le reel est ecrit sous
  	   -- la forme: signe, partie entiere, point decimal et partie decimale
  	   -- le point decimal est toujours present, le signe + est remplace par
  	   -- un espace. Quant aux deux champs numeriques ils suppriment les 
  	   -- zeros non significatifs.
     procedure ECRIRE_LIGNE(LE_REEL : in FLOAT);
           -- c'est ECRIRE + A_LA_LIGNE
     procedure LIRE(LE_REEL : out FLOAT);
  	   -- permet de lire un FLOAT dans une base quelconque (2 a 16) avec
  	   -- validation (on recommence jusqu'a ce qu'il soit valable). Le point
  	   -- decimal est obligatoire a la saisie.
  
    --=================================================
    -- Procedures d'entrees/sorties sur les caracteres
    --=================================================
  
     procedure ECRIRE ( CARAC : CHARACTER)
  			 renames TEXT_IO.PUT;
  	   -- permet d'ecrire un caractere sur la ligne a partir de la position
  	   -- initiale du curseur.
  
     procedure LIRE ( CARAC : out CHARACTER);
  	   -- permet de lire un caractere unique. La lecture est tamponnee c'est-
  	   -- a-dire que l'on peut effacer le caractere saisi d'ou la necessite de
  	   -- terminer la saisie par un RC (appui sur la touche entree). Le 
  	   -- tampon est purge apres la prise en compte de ce caractere.
     
    --===============================================================
    -- Procedures d'entrees/sorties sur les chaines de caracteres ADA
    --===============================================================
  
     procedure ECRIRE( LA_CHAINE : STRING)
  			 renames TEXT_IO.PUT;
  	   -- permet d'ecrire une chaine de caracteres sur la ligne a partir 
  	   -- de la position initiale du curseur. Si l'on souhaite aller a la 
  	   -- ligne utilisez plutot la procedure ECRIRE_LIGNE.
  
     procedure LIRE( LA_CHAINE : out STRING);
  	   -- permet de saisir une frappe de caracteres terminee par entree
  	   -- si le nombre de caracteres est inferieur a la dimension du STRING
  	   -- passe en parametre le complement est initialise a espace. 
  	   -- Le tampon est purge.
  
     procedure LIRE_TRANCHE( LA_CHAINE : out STRING; LONG : out natural) ;
  	   -- permet de saisir une frappe de caracteres terminee par entree.
  	   -- le nombre de caracteres tapes est passe en parametre. Seule la
  	   -- tranche 1..LONG est valide, le reste des caracteres n'est pas
  	   -- initialise a espace. Le tampon est purge.
     
     procedure ECRIRE_LIGNE( LA_CHAINE : STRING)
  			 renames TEXT_IO.PUT_LINE;
  	   -- c'est ECRIRE + A_LA_LIGNE
  
    --=========================================================
    -- Procedures vider clavier et saut a la ligne sur l'ecran
    --=========================================================
  
     procedure VIDER_TAMPON;    
  	   -- peu utile dans le contexte propose ici puisque toutes les saisies 
  	   -- sont purgees. Permet cependant d'attendre la frappe de la touche
  	   -- entree. C'est une pause (voir ci-dessous) sans message.
  
     procedure A_LA_LIGNE( NOMBRE : TEXT_IO.POSITIVE_COUNT:=1)
  			 renames TEXT_IO.NEW_LINE;
  	   -- sans commentaire
  
     procedure PAUSE;
  	   -- affiche le traditionnel message: "appuyez sur Entree pour continuer"
  	   -- et attend la frappe sur la touche entree.
	   
     procedure CLR_ECRAN;
          -- efface le contenu de la fenetre (l'ecran)
	  
    --============================================================
    -- Transformation de Reel ou d'entier en Chaine de caracteres
    --============================================================
  	
  	function IMAGE (L_ENTIER : in INTEGER) return STRING;
  	   -- c'est une redefinition de l'attribut c'est-a-dire INTEGER'IMAGE
  
  	function IMAGE (LE_REEL : in FLOAT) return STRING;
  	   -- permet une simulation de l'attribut FLOAT'IMAGE qui n'existe pas
  	   -- l'image est celle definie dans la procedure ECRIRE avec FLOAT.
  
   --=========================
   -- Special type enumeratif       paquetage "interne" et generique
   --=========================
     generic 
  	  type T_ENUM is (<>);
     package P_ENUM is
     -- le type enumeratif ne pouvant etre fixe a priori, comme c'etait le cas
     -- pour les numeriques, ou le choix INTEGER et FLOAT s'imposait, T_ENUM
     -- doit etre variable donc parametre d'ou la genericite incontournable.
     --
     -- Modele de declaration dans la procedure utilisatrice (2 lignes):
     -- package MON_ENUM is new P_E_SORTIE.P_ENUM(vrai_type_enumeratif);
     -- use MON_ENUM;
  	  
  	  function IMAGE (L_ENUM : in T_ENUM) return STRING;
  	  -- utilisation: IMAGE(variable_du_vrai_type_instancie ou constante)
  	  -- ce string peut etre utilise dans un ECRIRE ou ECRIRE_LIGNE ce qui
  	  -- permet des ecritures d'images d'objets de type different ainsi:
  	  -- ECRIRE_LIGNE(IMAGE(...)&IMAGE(...)&...etc);
  
  	  procedure LIRE (L_ENUM : out T_ENUM);
  	  -- cette procedure controle le type. On recommence jusqu'au succes.
  	  -- utilisation: LIRE(variable_du_vrai_type_instancie);
  
  	  procedure ECRIRE (L_ENUM : in T_ENUM);
  	  -- La valeur de la variable est affichee en majuscules.
  	  -- utilisation: ECRIRE(variable_du_vrai_type_instancie ou constante);
  
  	end P_ENUM; -- fin du paquetage interne et generique
  	
     --=========================
   -- Special type acces       paquetage "interne" et generique
   --=========================
     generic 
          type mon_type is private;
  	  type t_acces is access mon_type;
          procedure ecrire_acc(a : in t_acces);
  
  -- 9/05
  end p_esiut; -- fin des specifications du paquetage d'Entrees-Sorties
  
