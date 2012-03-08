with Forms; use Forms;
with Interfaces.C;use Interfaces.C;
package  p_fenbase is
  ------------------------------------------------------------------------------
  -- types à connaître pour utiliser le paquetage
  type    TA_String is access String;       -- pointeur sur une chaîne de caractères
  type    TR_Fenetre;                       -- une fenêtre de l'interface graphique
  type    T_EtatBouton is (Marche, Arret);  -- état d'un bouton (actif ou inactif)
  subtype T_Couleur is FL_COLOR;            -- couleurs disponibles dans le paquetage forms
  --   FL_BLACK, FL_RED, FL_GREEN, FL_YELLOW, FL_BLUE, FL_MAGENTA, FL_CYAN,
  --   FL_WHITE, FL_TOMATO, FL_INDIANRED, FL_SLATEBLUE, FL_COL1, FL_RIGHT_BCOL, FL_BOTTOM_BCOL,
  --   FL_TOP_BCOL, FL_LEFT_BCOL, FL_MCOL, FL_INACTIVE, FL_PALEGREEN, FL_DARKGOLD,
  --   FL_ORCHID, FL_DARKCYAN, FL_DARKTOMATO, FL_WHEAT, FL_DARKORANGE, FL_DEEPPINK,
  --   FL_CHARTREUSE, FL_DARKVIOLET, FL_SPRINGGREEN, FL_DODGERBLUE
  ------------------------------------------------------------------------------
  -- types internes au paquetage, inutile de les connaître !
  type T_TypeElement is (Bouton, TexteFixe, ChampDeSaisie, TexteAscenseur, Horloge, Fond, CheckBox, PictBouton);
  type TR_Element;
  type TA_Element is access TR_Element;
  type TR_Element is
  record
    TypeElement : T_TypeElement;
    NomElement  : TA_String;
    Texte       : TA_String;
    Contenu     : TA_String;
    PElement    : FL_OBJECT_Access;
    Suivant     : TA_Element;
  end record;
  type TR_Fenetre is
  record
    PFenetre  : FL_FORM_Access;
    Titre     : TA_String;
    PElements : TA_Element;
  end record;
  ------------------------------------------------------------------------------
  -- primitives de la bibliothèque "graphique"
  ------------------------------------------------------------------------------
  procedure InitialiserFenetres;                -- Initialiser le mode graphique
  ------------------------------------------------------------------------------
  function DebutFenetre (                       -- Créer une nouvelle fenetre
        Titre   : in     String;                --   son titre
        Largeur,                                --   sa largeur en pixels
        Hauteur : in     Positive )             --   sa hauteur en pixels
    return TR_Fenetre;                          --  résultat : la fenêtre créée
  ------------------------------------------------------------------------------
  procedure AjouterBouton (                     -- Ajouter un Bouton
        F          : in out TR_Fenetre;         --  la fenêtre où on ajoute
        NomElement : in     String;             --  le nom du bouton (unique)
        Texte      : in     String;             --  le texte affiché dans le bouton
        X,                                      --  son abscisse en pixels
        Y          : in     Natural;            --  son ordonnée en pixels
        Largeur,                                --  sa largeur en pixels
        Hauteur    : in     Positive    );      --  sa hauteur en pixels
  ------------------------------------------------------------------------------
  procedure AjouterTexte (                      -- Ajouter un texte non modifiable
        F          : in out TR_Fenetre;         --   par l'utilisateur dans f
        NomElement : in     String;     
        Texte      : in     String;             --   le texte qui sera affiché
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ); 
  ------------------------------------------------------------------------------
  procedure AjouterChamp (                      -- Ajouter un champ de saisie
        F          : in out TR_Fenetre;         
        NomElement : in     String;     
        Texte      : in     String;             --  le texte affiché en légende
        Contenu    : in     String;             --  le contenu initial du champ
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ); 
  ------------------------------------------------------------------------------
  procedure AjouterTexteAscenseur (             -- Ajouter une zone texte avec 
        F          : in out TR_Fenetre;         --  ascenseur (plusieurs lignes)
        NomElement : in     String;     
        Texte      : in     String;             --  le texte affiché en légende
        Contenu    : in     String;             --  le contenu de la zone
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ); 
  ------------------------------------------------------------------------------
  procedure AjouterHorloge (                    -- Ajouter une horloge qui affiche
        F          : in out TR_Fenetre;         --  l'heure courante
        NomElement : in     String;     
        Texte      : in     String;             --  le texte affiché en légende
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ); 
  ------------------------------------------------------------------------------ 
  procedure AjouterBoiteCocher (                -- Ajouter une boîte à cocher
        F          : in out TR_Fenetre;         -- 
        NomElement : in     String;     
        Texte      : in     String;             --  le texte affiché en légende
        X,                              
        Y          : in     Natural;    	-- position sur l'écran
        Largeur,                        
        Hauteur    : in     Positive    ); 
  ------------------------------------------------------------------------------
  procedure AjouterBoutonImage (                -- Ajouter un bouton avec image
        F          : in out TR_Fenetre;        	--  
        NomElement : in     String;     
        Texte      : in     String;            	--  le texte affiché en légende
        X,                              
        Y          : in     Natural;    			-- position sur l'écran
        Largeur,                        
        Hauteur    : in     Positive    ); 
  ------------------------------------------------------------------------------
  procedure FinFenetre (                        -- Procedure à appeler quand on a 
        F : in     TR_Fenetre );                --  fini d'ajouter des éléments
  ------------------------------------------------------------------------------
  procedure MontrerFenetre (                    -- Afficher unefenêtre
        F : in     TR_Fenetre ); 
  ------------------------------------------------------------------------------
  procedure CacherFenetre (                     -- Masquer une fenêtre
        F : in     TR_Fenetre ); 
  ------------------------------------------------------------------------------
  function AttendreBouton (                     -- Attendre qu'un bouton soit pressé
        F : in     TR_Fenetre )                 -- dans la fenetre f
    return String;                              -- Résultat = nom du bouton pressé
  ------------------------------------------------------------------------------
  function ConsulterContenu (                   -- Permet de récupérer la valeur
        F          : in     TR_Fenetre;         -- saisie par l'utilisateur dans
        NomElement : in     String      )       -- un champ de saisie
    return String;                              -- Résultat : la chaîne saisie !
  ------------------------------------------------------------------------------
  procedure ChangerTexte (                      -- Permet de modifier l'attribut
        F            : in out TR_Fenetre;       --  texte d'un élément de f
        NomElement   : in     String;           --  Le nom de l'élément à modifier
        NouveauTexte : in     String      );    --  La nouvelle valeur de texte
  ------------------------------------------------------------------------------
  procedure ChangerContenu (                    -- Permet de changer le contenu
        F              : in out TR_Fenetre;     --  d'un champ de saisie ou d'une
        NomElement     : in     String;         --  zone texte avec ascenseur
        NouveauContenu : in     String      );  --  La nouvelle valeur de contenu
  ------------------------------------------------------------------------------
  procedure ChangerCouleurTexte (             -- Permet de changer la couleur
        F               : in out TR_Fenetre;    -- du texte d'un element dans une
        NomElement      : in     String;        -- fenetre
        NouvelleCouleur : in     T_Couleur   ); --   La nouvelle couleur !
  ------------------------------------------------------------------------------
  procedure ChangerCouleurFond (                -- Permet de changer la couleur
        F               : in out TR_Fenetre;    --  de fond d'un élément dans une 
        NomElement      : in     String;        --  fenêtre
        NouvelleCouleur : in     T_Couleur   ); --  La nouvelle couleur !
  ------------------------------------------------------------------------------
  procedure ChangerStyleTexte (                	-- Permet de changer le style d'un texte
        F               : in out TR_Fenetre;    -- d'un élément dans une 
        NomElement      : in     String;        --  fenêtre
        NouveauStyle : in     FL_TEXT_STYLE   );--  Le nouveau style !
  -------------------------------------------------------------------------  
  procedure ChangerTailleTexte (                -- Permet de changer la taille d'un texte
        F               : in out TR_Fenetre;    --  d'un élément dans une 
        NomElement      : in     String;        --  fenêtre
       Taille : in     X11.Int   ); 				--  La nouvelle taille !
  ------------------------------------------------------------------------------
  procedure ChangerEtatBouton (                 -- Permet d'activer ou de désactiver
        F          : in out TR_Fenetre;         -- un bouton. S'il est désactivé, on
        NomElement : in     String;             -- ne peut plus cliquer dessus.
        Etat       : in     T_EtatBouton );     -- valeur : marche (activé) ou arret
  ------------------------------------------------------------------------------
  procedure MontrerElem (                     	-- Permet de montrer un élément
        F          : in out TR_Fenetre;         -- jusque-là caché
        NomElement : in     String );      
  ------------------------------------------------------------------------------
  procedure CacherElem (                      	-- Permet de cacher un élément
        F          : in out TR_Fenetre;         -- jusque-là visible
        NomElement : in     String );      
  ------------------------------------------------------------------------------
  function EtatBoiteCocher (                   	-- Permet de savoir si une Checkbox est 
        F          : in     TR_Fenetre;         -- cochée ou non
        NomElement : in     String      )
    return boolean;                             -- Résultat : l'état du bouton
  ------------------------------------------------------------------------------
  procedure ChangerImageBouton (              	-- Change l'image d'un bouton image
        F          : in out    TR_Fenetre;
        NomElement, NomImage : in     String      );
  ------------------------------------------------------------------------------
  function ClickDroit return boolean; -- vrai si on a pressé le bouton droit de la souris
end p_fenbase;
