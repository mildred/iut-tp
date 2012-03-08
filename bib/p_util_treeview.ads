-- module utilitaire pour le composant treeView
-- une colonne ne peut contenir qu'une chaine UTF8
-- la treeView est prevue pour contenir 5 colonnes au maximum
-- Annie Culet Oct 2008
----------------------------------------------------------------------------------
with Gtk.Tree_View; use Gtk.Tree_View;
with Gtk.Tree_Store; use Gtk.Tree_Store;
with Glib; use Glib;

package  p_util_treeview is

-- creation d'une colonne dans une treeView avec un titre.
-- la colonne est prevue pour contenir uniquement une chaine UTF8
-- le titre peut être rendu visible ou non a l'affichage de la vue.
procedure creerColonne (titre : UTF8_String; treeview : Gtk_Tree_View; titreVisible : boolean);

-- creation d'un modele pour une treeView avec le type prevu pour les colonnes.
-- il contiendra les donnees destinees a alimenter la vue.
-- la creation du modele doit etre effectue apres la creation de toutes les colonnes
procedure creerModele ( treeview : Gtk_Tree_View; modele : out Gtk_Tree_Store);

end p_util_treeview;
