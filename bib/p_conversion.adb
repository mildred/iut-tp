with Glib; use Glib;
with Ada.Float_Text_IO;
with Ada.Text_IO;
with Ada.Strings.Fixed;use Ada.Strings.Fixed;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Gtkada.Dialogs;use Gtkada.Dialogs;


package body p_conversion is
rep : Message_Dialog_Buttons;

function empty (entree : UTF8_String) return boolean is
	l : natural;
begin
	l := entree'length;
	return ( l = 0 );
end empty;

--E/S pour les entiers
procedure to_ada_type(entree : UTF8_String; sortie : out integer) is
  resultat : string(1..12) ;
  l : natural ;
begin
     l := entree'length;
     resultat (1..l) := entree;
     sortie := integer'value(resultat(1..l)) ;
exception
	when CONSTRAINT_ERROR =>  rep:=Message_Dialog (entree & " doit être un entier");
							raise ExConversion ;
end to_ada_type ;

function to_string (item : integer) return string is
begin
	return trim(integer'image(item), ada.strings.left);
end to_string;

--E/S pour les réels
procedure to_ada_type(entree : UTF8_String; sortie : out float) is
  resultat : string(1..20) ;
  l : positive ;
begin
     l := entree'length;
     resultat (1..l) := entree;
     sortie := float'value(resultat(1..l)) ;
exception
	when CONSTRAINT_ERROR => rep:=Message_Dialog (entree & " doit être un réel" );
							raise ExConversion ;
end to_ada_type ;

function to_string (item : float) return string is
	s : string (1..float'width):= (others => '0');
	l : natural:= s'length;
	i : natural := l;
begin
	ada.float_text_IO.put (s, item, exp=>0);
	while s(i) = '0'loop
      i := i - 1;
    end loop;
	if s(i) = '.' then
		i := i+1;
	end if;
	return trim(s(1..i), ada.strings.left);
end to_string;

--E/S pour les chaînes
procedure to_ada_type(entree : UTF8_String; sortie : out string) is
  l : integer ;
begin
 	l := entree'length;
	if l > sortie'length then rep:=Message_Dialog ("La chaine " & entree & " est trop longue");
							raise ExConversion ;
	else
		sortie := (others => ' ') ;
		sortie(sortie'first..sortie'first+l-1) := entree (entree'first..l);
	end if;
exception
	when CONSTRAINT_ERROR => rep:=Message_Dialog ("La chaine " & entree & " est trop longue ");
							raise ExConversion ;
end to_ada_type ;

function to_string (item : Unbounded_String) return string is
begin
  return Ada.Strings.Unbounded.to_string (item);
end to_string;

procedure to_ada_type(entree : UTF8_String; sortie : out Unbounded_String) is
begin
      sortie := Ada.Strings.Unbounded.to_Unbounded_string(entree);
end to_ada_type ;

--E/S pour les dates JJ/MM/AAAA
procedure to_ada_type(entree : UTF8_String; sortie : out time) is
  l : integer;
  s : string(1..40):= (others => ' ') ;
begin
  l := entree'length;
  s(s'first..s'first+l-1) := entree (entree'first..l);
  sortie := time_of (integer'value (s(7..10)), integer'value (s(4..5)),integer'value (s(1..2)));
  exception
	when CONSTRAINT_ERROR => rep:=Message_Dialog ("Le format de " & entree & " est JJ/MM/AAAA ");
							raise ExConversion ;
end to_ada_type ;

function to_string (item : time) return string is
	y : year_number;
m : month_number;
d : day_number;
dd : day_duration;
s : string (1..10):= (others => '0');

begin
split (Item, y, m, d, dd);
return ( integer'image(d) & "/" & integer'image(m) &  "/" & integer'image(y));
end to_string;

-- module générique d' E/S pour les énumérés
package body P_Enum is
procedure to_ada_type(entree : UTF8_String; sortie : out t_enum) is
	item : string (1..t_enum'width + 1);
  	l : integer ;
begin
     item := (others => ' ');
     l := entree'length;
     item (1..l) := entree;
     sortie := t_enum'value(item(1..l));
exception
	when CONSTRAINT_ERROR => rep:=Message_Dialog (entree & " n'est pas une valeur possible");
						raise ExConversion ;
end to_ada_type;

function to_string (item : t_enum) return string is
begin
	return ada.characters.handling.to_lower(t_enum'image(item));
end to_string;

end P_Enum;

-- module générique d' E/S pour les entiers contraints
package body P_Entier is

procedure to_ada_type(entree : UTF8_String; sortie : out entier) is
  resultat : string(1..12) ;
  l : integer ;
begin
     l := entree'length;
     resultat (1..l) := entree;
     sortie := entier'value(resultat(1..l)) ;
exception
	when CONSTRAINT_ERROR => rep:=Message_Dialog (entree & " doit être une valeur comprise entre " & to_string(entier'first) & " et " & to_string(entier'last));
						raise ExConversion ;
end to_ada_type ;

function to_string (item : entier) return string is
begin
	return trim(entier'image(item), ada.strings.left);
end to_string;

end P_Entier ;

-- module générique d' E/S pour les réels contraints ou un new type real
package body P_Reel is

procedure to_ada_type(entree : UTF8_String; sortie : out reel) is
  resultat : string(1..20) ;
  l : integer ;
begin
     l := entree'length;
     resultat (1..l) := entree;
     sortie := reel'value(resultat(1..l)) ;

exception
	when CONSTRAINT_ERROR =>  rep:=Message_Dialog (entree & " doit être une valeur comprise entre " & to_string(reel'first) & " et " & to_string(reel'last)) ;
							raise ExConversion ;
end to_ada_type ;

function to_string (item : reel) return string is
	s : string (1..reel'width):= (others => '0');
	l : natural:= s'length;
	i : natural := l;
	package float_IO is new Ada.Text_IO.Float_IO (reel);
begin
	float_IO.put (s, item, exp=>0);
	while s(i) = '0'loop
      i := i - 1;
    end loop;
	if s(i) = '.' then
		i := i+1;
	end if;
	return trim(s(1..i), ada.strings.left);
end to_string;

end P_Reel;

end p_conversion ;