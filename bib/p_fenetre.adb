with X.Strings;
with X.Args;
with X.Xlib;
with System;

package body P_Fenetre is
  -----------------------------------------------------------------------------
  procedure AjoutElement (
        Pliste      : in out TA_Element;      
        TypeElement :        T_TypeElement;   
        NomElement  :        String;          
        Texte       :        String;          
        Contenu     :        String;          
        PElement    :        FL_OBJECT_Access ) is 
  begin
    if Pliste=null or else Pliste.NomElement.all>NomElement then
      Pliste:=new TR_Element'(TypeElement, new String'(NomElement),
        new String'(Texte), new String'(Contenu), PElement, Pliste);
    elsif Pliste.NomElement.all<NomElement then
      AjoutElement(Pliste.Suivant, TypeElement, NomElement, Texte, Contenu,
        PElement);
    end if;
  end AjoutElement;

  -----------------------------------------------------------------------------
  function GetElement (
        Pliste     : TA_Element; 
        NomElement : String      ) 
    return TA_Element is 
  begin
    if Pliste=null or else Pliste.NomElement.all>NomElement then
      return null;
    elsif Pliste.NomElement.all=NomElement then
      return Pliste;
    else
      return GetElement(Pliste.Suivant,NomElement);
    end if;
  end GetElement;

  -----------------------------------------------------------------------------
  function GetElement (
        Pliste : TA_Element;      
        Pobj   : FL_OBJECT_Access ) 
    return TA_Element is 
  begin
    if Pliste=null or else Pliste.Pelement=Pobj then
      return Pliste;
    else
      return GetElement(Pliste.Suivant,Pobj);
    end if;
  end GetElement;


  -----------------------------------------------------------------------------
  procedure InitialiserFenetres is 
  begin
    Fl_Initialize( X.Args.Argc'access, X.Args.Argv, null, null, 0 );
  end InitialiserFenetres;

  -----------------------------------------------------------------------------
  function DebutFenetre (
        Titre   : in     String;  
        Largeur,                  
        Hauteur : in     Positive ) 
    return TR_Fenetre is 
    F   : TR_Fenetre;  
    Obj : FL_OBJECT_Access;  
  begin
    F.Pfenetre := Fl_Bgn_Form(FL_NO_BOX, FL_Coord(Largeur), FL_Coord(
        Hauteur+40));
    Obj := Fl_Add_Box(FL_UP_BOX,0,0,FL_Coord(Largeur),FL_Coord(Hauteur+40),null);
    F.Titre   := new String'(Titre);
    F.Pelements:= null;
    AjoutElement(F.PElements, Fond, "fond", "", "",Obj);
    return F;
  end DebutFenetre;

  -----------------------------------------------------------------------------
  procedure AjouterBouton (
        F          : in out TR_Fenetre; 
        NomElement : in     String;     
        Texte      : in     String;     
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ) is 
    Obj : FL_OBJECT_Access;  
  begin
    if GetElement(F.PElements,NomElement)=null then
      Obj := Fl_Add_Button(FL_NORMAL_BUTTON,FL_Coord(X),FL_Coord(Y),
        FL_COORD(Largeur),FL_COORD(Hauteur),X11.Strings.New_String(Texte));
      AjoutElement(F.PElements, Bouton, NomElement, Texte, "",Obj);
    end if;
  end AjouterBouton;

  -----------------------------------------------------------------------------
  procedure AjouterTexte (
        F          : in out TR_Fenetre; 
        NomElement : in     String;     
        Texte      : in     String;     
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ) is 
    Obj : FL_OBJECT_Access;  
  begin
    if GetElement(F.PElements,NomElement)=null then
      Obj := Forms.Fl_Add_Text(Forms.FL_NORMAL_TEXT,FL_Coord(X),FL_Coord(
          Y),
        FL_COORD(Largeur),FL_COORD(Hauteur),X11.Strings.New_String(Texte));
      Forms.Fl_Set_Object_Lalign(Obj,Forms.FL_ALIGN_LEFT or Forms.
        FL_ALIGN_INSIDE);
      AjoutElement(F.PElements, TexteFixe, NomElement, Texte, "",Obj);
    end if;
  end;

  -----------------------------------------------------------------------------
  procedure AjouterChamp (
        F          : in out TR_Fenetre; 
        NomElement : in     String;     
        Texte      : in     String;     
        Contenu    : in     String;     
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ) is 
    Obj : FL_OBJECT_Access;  
  begin
    if GetElement(F.PElements,NomElement)=null then
      Obj := Forms.Fl_Add_Input(Forms.FL_NORMAL_INPUT,FL_Coord(X),
        FL_Coord(Y),
        FL_COORD(Largeur),FL_COORD(Hauteur),X11.Strings.New_String(Texte));
      Fl_Set_Input(Obj,X11.Strings.New_String(Contenu));
      AjoutElement(F.PElements, ChampDeSaisie, NomElement, Texte, Contenu,
        Obj);
    end if;
  end;
  -----------------------------------------------------------------------------
  procedure AjouterTexteAscenseur (
        F          : in out TR_Fenetre; 
        NomElement : in     String;     
        Texte      : in     String;     
        Contenu    : in     String;     
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ) is 
    Obj : FL_OBJECT_Access;  
  begin
    if GetElement(F.PElements,NomElement)=null then
      Obj := Forms.Fl_Add_Browser(Forms.FL_NORMAL_BROWSER,FL_Coord(X),
        FL_Coord(Y),
        FL_COORD(Largeur),FL_COORD(Hauteur),X11.Strings.New_String(Texte));
      AjoutElement(F.PElements, TexteAscenseur, NomElement, Texte, Contenu,
        Obj);
    end if;
  end;
  -----------------------------------------------------------------------------
  procedure AjouterHorloge (
        F          : in out TR_Fenetre; 
        NomElement : in     String;     
        Texte      : in     String;     
        X,                              
        Y          : in     Natural;    
        Largeur,                        
        Hauteur    : in     Positive    ) is 
    Obj : FL_OBJECT_Access;  
  begin
    if GetElement(F.PElements,NomElement)=null then

      Obj := Forms.Fl_Add_Clock(Forms.FL_ANALOG_CLOCK,FL_Coord(X),
        FL_Coord(Y),
        FL_COORD(Largeur),FL_COORD(Hauteur),X11.Strings.New_String(Texte));
      AjoutElement(F.PElements, Horloge, NomElement, Texte, "", Obj);
    end if;
  end;
  -----------------------------------------------------------------------------
  procedure FinFenetre (
        F : in     TR_Fenetre ) is 
  begin
    Fl_End_Form;
  end;
  -----------------------------------------------------------------------------
  procedure MontrerFenetre (
        F : in     TR_Fenetre ) is 
  begin
    Fl_Show_Form(F.Pfenetre,FL_PLACE_CENTER,FL_FULLBORDER,X11.Strings.
      New_String(F.Titre.all));
  end;
  -----------------------------------------------------------------------------
  procedure CacherFenetre (
        F : in     TR_Fenetre ) is 
  begin
    Fl_Hide_Form(F.Pfenetre);
  end;
  -----------------------------------------------------------------------------
  function AttendreBouton (
        F : in     TR_Fenetre ) 
    return String is 
    Pelement : TA_Element;  
  begin
    loop
      PElement:=GetElement(F.Pelements, Fl_Do_Forms);
      exit when PElement/=null;
    end loop;
    return Pelement.NomElement.all;
  end;
  -----------------------------------------------------------------------------
  procedure ChangerTexte (
        F            : in out TR_Fenetre; 
        NomElement   : in     String;     
        NouveauTexte : in     String      ) is 
    P : TA_Element;  
  begin
    P:=GetElement(F.PElements,NomElement);
    if P/=null then
      Fl_Set_Object_Label(P.Pelement,X11.Strings.New_String(NouveauTexte));
    end if;
  end;
  -----------------------------------------------------------------------------
  procedure ChangerContenu (
        F              : in out TR_Fenetre; 
        NomElement     : in     String;     
        NouveauContenu : in     String      ) is 
    P : TA_Element;  
  begin
    P:=GetElement(F.PElements,NomElement);
    if P/=null then
      if P.TypeElement=ChampDeSaisie then
        Fl_Set_Input(P.Pelement,X11.Strings.New_String(NouveauContenu));
      elsif P.TypeElement=TexteAscenseur then
        Fl_Clear_Browser(P.Pelement);
        Fl_Addto_Browser_Chars(P.Pelement,X11.Strings.New_String(
            NouveauContenu));
      end if;
    end if;
  end;
  -----------------------------------------------------------------------------
  procedure ChangerCouleurContenu (
        F               : in out TR_Fenetre; 
        NomElement      : in     String;     
        NouvelleCouleur : in     T_Couleur   ) is 
    P : TA_Element;  
  begin
    P:=GetElement(F.PElements,NomElement);
    if P/=null then
      Fl_Set_Object_Lcolor(P.Pelement,NouvelleCouleur);
    end if;
  end;
  -----------------------------------------------------------------------------
  procedure ChangerCouleurFond (
        F               : in out TR_Fenetre; 
        NomElement      : in     String;     
        NouvelleCouleur : in     T_Couleur   ) is 
    P : TA_Element;  
  begin
    P:=GetElement(F.PElements,NomElement);
    if P/=null then
      Fl_Set_Object_Color(P.Pelement,NouvelleCouleur,FL_COL1);
    end if;
  end;
  -----------------------------------------------------------------------------
  function ConsulterContenu (
        F          : in     TR_Fenetre; 
        NomElement : in     String      ) 
    return String is 
    P : TA_Element;  
    S : X11.Strings.Const_Charp;  
  begin
    P:=GetElement(F.PElements,NomElement);
    if P/=null and then P.TypeElement=ChampDeSaisie then
      S:=Fl_Get_Input(P.Pelement);
      return X11.Strings.Value(S);
    else
      return "";
    end if;
  end;
  -----------------------------------------------------------------------------
  procedure ChangerEtatBouton (
        F          : in out TR_Fenetre;  
        NomElement : in     String;      
        Etat       : in     T_EtatBouton ) is 
    P : TA_Element;  
  begin
    P:=GetElement(F.PElements,NomElement);
    if P/=null then
      if Etat=Marche then
        Fl_Activate_Object(P.Pelement);
      else
        Fl_Deactivate_Object(P.Pelement);
      end if;
    end if;
  end;
end P_Fenetre;
