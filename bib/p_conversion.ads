-- module  de conversion pour les E/S
-- Annie Culet avril 2011
----------------------------------------------------------------------------------
with Glib ; use Glib;
with ada.calendar; use ada.calendar;
with Ada.Strings.Unbounded;use Ada.Strings.Unbounded;

package p_Conversion is

-- teste si la chaine entree est vide ou non
function empty (entree : UTF8_String) return boolean;

-- effectue la conversion d'une chaine UTF8 vers le type Ada : integer non contraint
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out integer) ;

-- effectue la conversion d'une chaine UTF8 vers le type Ada : float non contraint
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out float) ;

-- effectue la conversion d'une chaine UTF8 vers le type Ada : string(1..n)
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out string );

-- effectue la conversion d'une chaine UTF8 vers le type Ada : time au format JJ/MM/AAAA
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out time) ;

-- effectue la conversion d'une chaine UTF8 vers le type Ada : unbounded_string
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out Unbounded_String) ;

ExConversion : exception ;
--------------------------------------------------------------------------------------------
-- effectue la conversion du type float non contraint vers une chaine UTF8
function to_string (item : float) return string;
-- effectue la conversion du type integer non contraint vers une chaine UTF8
function to_string (item : integer) return string;
-- effectue la conversion du type time (date) vers une chaine UTF8 de la forme JJ/MM/AAAA
function to_string (item : time) return string ;
-- effectue la conversion du type Unbounded_String  vers une chaine UTF8
function to_string (item : Unbounded_String) return string ;

----------------------------------------------------------------------------------
-- module generique de conversion pour un type enumere
-- paramètre de genericite : le type enumere Ada
generic
  	  type t_enum is (<>);
package P_Enum is
-- conversion d'une chaine UTF8 vers un type enumere
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out t_enum );
-- conversion d'un type enumere vers une chaine UTF8
function to_string (item : t_enum) return string;

ExConversion : exception ;
end P_Enum;
----------------------------------------------------------------------------------
-- module generique de conversion pour un type integer contraint (range ...)
-- paramètre de genericite : le type integer contraint Ada
generic
	type entier is range <> ;
package P_Entier is
-- conversion d'une chaine UTF8 vers le type integer contraint
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out entier );
-- conversion d'un type entier contraint vers une chaine UTF8
function to_string (item : entier) return string;

ExConversion : exception ;
end P_Entier;
----------------------------------------------------------------------------------
-- module generique de conversion pour un type float contraint ou un nouveau type basé sur float
-- paramètre de genericite : le type float contraint Ada ou real (nouveau type déclaré dans Mill)
generic
  type reel is digits <> ;
package P_Reel is
-- conversion d'une chaine UTF8 vers un type float contraint ou ou un nouveau type basé sur float
-- leve l'exception ExConversion si la conversion n'est pas possible
-- et affiche un message d'erreur dans une boite de dialogue
procedure to_ada_type(entree : UTF8_String; sortie : out reel );
-- conversion d'un type float contraint ou un nouveau type basé sur float vers une chaine UTF8
function to_string (item : reel) return string;

ExConversion : exception ;
end P_Reel;

end p_Conversion;