with Gtk.Tree_View; use Gtk.Tree_View;
with Gtk.Tree_View_Column; use Gtk.Tree_View_Column;
with Gtk.Tree_Store; use Gtk.Tree_Store;
with Gtk.Cell_Renderer_Text;use Gtk.Cell_Renderer_Text;
with Glib; use Glib;

package body p_util_treeview is

procedure creerColonne (titre : UTF8_String ; treeview : Gtk_Tree_View; titreVisible : boolean) is
	colonne : Gtk_Tree_View_Column;
	numColonne : Gint;
	text : Gtk_Cell_Renderer_Text;
begin
	-- rendre visible ou non le titre de la colonne
	Set_Headers_Visible(treeView , titreVisible );
	-- création d'une colonne pour la Tree_View
	gtk_new(colonne);
	-- ajout de la colonne à la Tree_View
	numColonne := append_column (treeview, colonne);
	set_title(colonne, titre);
	Set_Sizing (colonne, Tree_View_Column_Autosize);
	-- création d'un Cell_Renderer (type de représentation visuelle)de type chaine comme une Entry
	gtk_new(text);
	-- ajout du Renderer à la colonne
	pack_start(colonne, text, true);
	-- la colonne prendra une valeur de type chaine
 	add_attribute(colonne, text, "text", numColonne-1);
end creerColonne ;

procedure creerModele ( treeview : Gtk_Tree_View; modele : out Gtk_Tree_Store) is
-- creation du modele pour la vue et attachement à la vue
-- types de 5 colonnes du modèle (des chaines)
types : Glib.Gtype_Array(0..5) := (0..5 => Glib.Gtype_String);
begin
-- creation du modele avec les types prévus pour les colonnes
	gtk_new(modele, types);
-- attache le modele à la vue
	set_model(treeview, modele.all'Access);
end creerModele;
end p_util_treeview ;