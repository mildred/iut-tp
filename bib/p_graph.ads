-- p_graph.ads

package p_graph is

--------------------- TYPE POINT ------------------------------------------------------

type TR_point  is  record  x: integer;  y: integer;  end record;


--------------------- GESTION DU CONTEXTE GRAPHIQUE -----------------------------------

type     T_couleur    is  ( blanc, noir, rouge, vert, jaune, bleu, cyan, magenta, gris );
type     T_aspect     is  ( continu , pointille );
subtype  T_epaisseur  is  positive range 1..10;

type TR_contexte is record
	coul : T_couleur  := noir;
	asp  : T_aspect   := continu;
	epais: T_epaisseur:= 1;
end record;

contexte_standard : constant TR_contexte := (noir, continu, 1);
	 
	   
--------------------- TRACE DE TRAITS -------------------------------------------------

procedure tracer_droite  ( p_orig : in TR_point; p_dest : in TR_point;
			   cont : TR_contexte := contexte_standard);
	-- Trace un trait du point p_orig au point p_dest avec la couleur,
	-- l'aspect et l'epaisseur precise dans cont
	-- Par defaut si aucun contexte n'est precise, 
	-- le trait est trace en : noir, continu et 1


--------------------- GESTION DE LA FENETRE GRAPHIQUE ---------------------------------

procedure Initialisation;
	-- Doit etre appelee avant toute ouverture de fenetre
	
procedure ouvrir_fenetre (largeur : in positive; hauteur : in positive );
	-- Ouvre une fenetre de fond gris, contenant un bouton "Suite"
	
procedure fermer_fenetre ;

function  bouton_enfonce return boolean;
	-- renvoie TRUE si l'utilisateur a clique sur le bouton

end p_graph;
