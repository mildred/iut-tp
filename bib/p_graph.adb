-- p_graph.adb

with X.Strings;
with X.Args;
with X.Xlib;
with Forms; use Forms;
with p_esiut; use p_esiut;
with System;


package body p_graph is

package X11 renames X;

type FD_fenetre is
     record
  	fenetre: FL_FORM_access;
  	bouton: FL_OBJECT_access;
  	vdata: System.Address;
  	ldata: X.Long;
  end record;
  
  type FD_fenetre_access is access FD_fenetre;
  
  fd_win : FD_fenetre_access := new FD_fenetre;

  couleur_X : FL_Color:=FL_BLACK;
  
--------------------------------------------------------------------------------------------------
procedure changer_couleur ( coul : in T_couleur) is
--------------------------------------------------------------------------------------------------
begin
  case coul is
    when blanc    => couleur_X:=FL_WHITE;
    when noir     => couleur_X:=FL_BLACK;
    when rouge    => couleur_X:=FL_RED;
    when vert     => couleur_X:=FL_GREEN;
    when jaune    => couleur_X:=FL_YELLOW;
    when bleu     => couleur_X:=FL_BLUE;
    when cyan     => couleur_X:=FL_CYAN;
    when magenta  => couleur_X:=FL_MAGENTA;
    when gris     => couleur_X:=FL_COL1;
  end case;
end changer_couleur;

--------------------------------------------------------------------------------------------------
procedure changer_aspect ( asp : in T_aspect) is
--------------------------------------------------------------------------------------------------
begin
  case asp is
    when continu   => fl_linestyle(X.LineSolid);
    when pointille => fl_linestyle(X.LineOnOffDash);
  end case;
end changer_aspect;

  
--------------------------------------------------------------------------------------------------
procedure changer_epaisseur ( epais : in T_epaisseur) is
--------------------------------------------------------------------------------------------------
begin
  fl_linewidth(X.Int(epais));
end changer_epaisseur;

--------------------------------------------------------------------------------------------------
procedure tracer_droite  ( p_orig : in TR_point; p_dest : in TR_point; cont : TR_contexte := contexte_standard ) is
--------------------------------------------------------------------------------------------------
begin
  changer_couleur(cont.coul);
  changer_aspect(cont.asp);
  changer_epaisseur(cont.epais);
  fl_line(FL_Coord(p_orig.x),FL_Coord(p_orig.y),FL_Coord(p_dest.x),FL_Coord(p_dest.y),couleur_X);
  X.Xlib.XFlush(FL_get_Display);
  changer_couleur(contexte_standard.coul);
  changer_aspect(contexte_standard.asp);
  changer_epaisseur(contexte_standard.epais);
end tracer_droite;

--------------------------------------------------------------------------------------------------
function  bouton_enfonce return boolean is
--------------------------------------------------------------------------------------------------
  obj : FL_OBJECT_Access;
begin 
  fl_linewidth(0);fl_linestyle(X.LineSolid); 
  obj:=fl_check_forms;
  if obj = fd_win.bouton then
  ecrire_ligne("Vous avez clique sur le bouton suite");
  return true;
  else return false;
  end if;
end bouton_enfonce;

--------------------------------------------------------------------------------------------------
procedure initialisation is
--------------------------------------------------------------------------------------------------
begin
  fl_initialize( X.Args.Argc'access, X.Args.Argv, null, null, 0 );
end initialisation;

--------------------------------------------------------------------------------------------------
procedure ouvrir_fenetre (largeur : in positive; hauteur : in positive ) is
--------------------------------------------------------------------------------------------------
  Str_button:  X.Strings.const_charp := X.Strings.New_String("Suite");

  Str_fenetre:  X.Strings.const_charp := X.Strings.New_String("TP Graphique");
  obj: FL_OBJECT_access;
  p1,p2 : TR_point; 
begin   
   fd_win.fenetre := fl_bgn_form(FL_NO_BOX, FL_Coord(largeur), FL_Coord(hauteur+40));
   obj := fl_add_box(FL_UP_BOX,0,0,FL_Coord(largeur),FL_Coord(hauteur+40),null);
   obj := fl_add_button(FL_NORMAL_BUTTON,FL_Coord((largeur-70)/2),FL_Coord(hauteur+4),70,30,Str_button);
   fd_win.bouton := obj;
   fl_end_form;
   fl_show_form(fd_win.fenetre,FL_PLACE_CENTER,FL_FULLBORDER,Str_fenetre);
   p1.x:=0; p1.y:=hauteur; p2.x:=largeur-1; p2.y:=hauteur;
   tracer_droite(p1,p2);
end;

--------------------------------------------------------------------------------------------------
procedure fermer_fenetre is
--------------------------------------------------------------------------------------------------
begin
  fl_hide_form(fd_win.fenetre);
end fermer_fenetre;

end p_graph;
