------------------------------------------------------------------------------
-- Copyright 1996, G. Vincent Castellano gvc@ocsystems.com
--
-- Forms Library Ada Bindings, 1997-09-09, V 0.86.0
--
-- A production of the Free X11/Ada 95 programming project:  
--     http://ocsystems.com/xada
--
-- This software depends on the Forms Library, A Graphical Interface 
--   Toolkit for X, and is subject to the restrictions associated
--   with the Forms Library (i.e., free for non-commercial use).
--
-- To download XForms (get the V 0.86 package):  
--     http://bragg.phys.uwm.edu/xforms
--
-- You will also need the Intermetrics X11 Ada 95 bindings:
--     http://www.inmet.com/~mg/x11ada/x11ada.html
------------------------------------------------------------------------------

with Interfaces.C;
with X.Strings;
with Stdarg;
with System;
with X.Xlib;
with X.Xutil;
with X.Xresource;
package forms is

    package X11 renames X;

    type FL_Coord is new X11.Int;
    FL_FORMS_H          : constant Boolean := True;
    FL_VERSION          : constant  := 0;
    FL_REVISION         : constant  := 86;
    FL_FIXLEVEL         : constant  := 1;
    FL_INCLUDE_VERSION  : constant  := 1000 * FL_VERSION + FL_REVISION;
    FL_BASIC_H          : constant Boolean := True;
--     FALSE               : constant  := 0;
--     TRUE                : constant  := 1;
    FL_PATH_MAX         : constant  := 1024;
    FL_CoordIsFloat     : constant  := 0;                       
    -- define this if FL_Coord is of type 
    --  float 
    FL_MAXFONTS         : constant  := 48;               
    -- max number of fonts 
    FL_TINY_SIZE        : constant  := 8;
    FL_SMALL_SIZE       : constant  := 10;
    FL_NORMAL_SIZE      : constant  := 12;
    FL_MEDIUM_SIZE      : constant  := 14;
    FL_LARGE_SIZE       : constant  := 18;
    FL_HUGE_SIZE        : constant  := 24;
    FL_DEFAULT_SIZE     : constant  := FL_SMALL_SIZE;
    FL_TINY_FONT        : constant  := FL_TINY_SIZE;
    FL_SMALL_FONT       : constant  := FL_SMALL_SIZE;
    FL_NORMAL_FONT      : constant  := FL_NORMAL_SIZE;
    FL_MEDIUM_FONT      : constant  := FL_MEDIUM_SIZE;
    FL_LARGE_FONT       : constant  := FL_LARGE_SIZE;
    FL_HUGE_FONT        : constant  := FL_HUGE_SIZE;
    FL_NORMAL_FONT1     : constant  := FL_SMALL_FONT;
    FL_NORMAL_FONT2     : constant  := FL_NORMAL_FONT;
    FL_DEFAULT_FONT     : constant  := FL_SMALL_FONT;
    FL_BOUND_WIDTH      : constant FL_Coord := 3;               
    -- Border width of boxes 
    FL_BEGIN_GROUP      : constant  := 10000;
    FL_END_GROUP_c0     : constant  := 20000;
    FL_CLICK_TIMEOUT    : constant  := 400;                     
    -- double click interval 
    FL_XBASIC_H         : constant Boolean := True;
    FL_MINDEPTH         : constant  := 1;
    GreyScale           : constant  := X11.GrayScale;
    StaticGrey          : constant  := X11.StaticGray;
    FL_MAX_COLS         : constant  := 1024;
    FL_MAX_FONTSIZES    : constant  := 10;
    FL_ALL_EVENT        : constant  := 8319;
    FL_TIMER_EVENT      : constant  := 16#40000000#;
    FL_BITMAP_H         : constant Boolean := True;
    FL_NORMAL_BITMAP    : constant  := 0;
    FL_BITMAP_MAXSIZE   : constant  := 128*128;
    FL_NORMAL_PIXMAP    : constant  := 0;
    FL_BOX_H            : constant Boolean := True;
    FL_BROWSER_H        : constant Boolean := True;
    FL_BROWSER_LINELENGTH: constant  := 1024;
    FL_BROWSER_FONTSIZE  : constant  := FL_SMALL_FONT;
    FL_BUTTON_H          : constant Boolean := True;
    FL_BUTTON_BW         : constant FL_Coord := FL_BOUND_WIDTH;
    FL_LIGHTBUTTON_MINSIZE: constant FL_Coord := 12;
    FL_CANVAS_H           : constant Boolean := True;           
    FL_CHART_H            : constant Boolean := True;
    FL_CHART_MAX          : constant  := 512;
    FL_CHOICE_H           : constant Boolean := True;
    FL_CHOICE_MAXITEMS    : constant  := 63;
    FL_CLOCK_H            : constant Boolean := True;
    FL_COUNTER_H          : constant Boolean := True;
    FL_COUNTER_BW         : constant FL_Coord := 2;
    FL_CURSOR_H           : constant Boolean := True;
    FL_DIAL_H             : constant Boolean := True;
    FL_FILESYS_H          : constant Boolean := True;
    FL_FRAME_H            : constant Boolean := True;
    FL_FREE_H             : constant Boolean := True;
    FL_GOODIES_H          : constant Boolean := True;
    FLAlertDismissLabel   : constant X11.Strings.Const_Charp 
                            := X11.Strings.New_String("flAlert.dismiss.label");
    FLQuestionYesLabel    : constant X11.Strings.Const_Charp 
                            := X11.Strings.New_String("flQuestion.yes.label");
    FLQuestionNoLabel     : constant X11.Strings.Const_Charp 
                            := X11.Strings.New_String("flQuestion.no.label");
    FLOKLabel             : constant X11.Strings.Const_Charp 
                            := X11.Strings.New_String("flInput.ok.label");
    FLInputClearLabel     : constant X11.Strings.Const_Charp 
                            := X11.Strings.New_String("flInput.clear.label");
    FLCancelLabel             : constant X11.Strings.Const_Charp 
                            := X11.Strings.New_String("flInput.cancel.label");
    FL_MAX_FSELECTOR      : constant  := 6;
    FL_INPUT_H            : constant Boolean := True;
    FL_RINGBELL_c0        : constant  := 16;
    FL_MENU_H             : constant Boolean := True;
    FL_MENU_MAXITEMS      : constant  := 128;
    FL_MENU_MAXSTR        : constant  := 64;
    FL_POPUP_H            : constant Boolean := True;
    FL_MAXPUPI            : constant  := 64;                    
    -- max item each pup        
    FL_PUP_PADH           : constant  := 4;                     
    -- space between each items 
    FL_POSITIONER_H       : constant Boolean := True;
    FL_NORMAL_POSITIONER  : constant  := 0;
    FL_SLIDER_H           : constant Boolean := True;
    FL_SLIDER_BW1         : constant FL_Coord := FL_BOUND_WIDTH;
    FL_SLIDER_BW2         : constant FL_Coord := 2;
    FL_SLIDER_FINE        : constant := 0.05;
    FL_SLIDER_WIDTH       : constant := 0.10;
    FL_TEXT_H             : constant Boolean := True;
    FL_TEXTBOX_H          : constant Boolean := True;           -- {
    FL_TEXTBOX_LINELENGTH : constant  := 1024;                  -- forms.h:2690
    FL_TEXTBOX_FONTSIZE   : constant  := FL_SMALL_FONT;         -- forms.h:2691
    FL_TIMER_H            : constant Boolean := True;
    FL_TIMER_BLINKRATE    : constant := 0.2;
    FL_XYPLOT_H           : constant Boolean := True;
    FL_MAX_XYPLOTOVERLAY  : constant  := 32;
        
    FL_DEFAULT_CURSOR     : constant := -1;
    FL_INVISIBLE_CURSOR   : constant := -2;
    XC_Invisible          : constant := FL_INVISIBLE_CURSOR;
        
    type int_array is array (natural range <>) of X11.Int;
    type short_array is array (natural range <>) of X11.Short;
    type unsigned_long_array is array (natural range <>) of X11.unsigned_long;
    type long_array is array (natural range <>) of X11.long;
    type fl_coord_array is array (natural range <>) of FL_COORD;
    type float_array is array ( natural range <>) of interfaces.c.c_float;
    type constrained_float_Array is array ( natural range 0 .. 1_000_000 )
       of Interfaces.c.c_float;

    type enum_anonymous0_t is (                                   -- forms.h:85
        FL_CLOSE,                                                 -- forms.h:85
        FL_IGNORE,                                                -- forms.h:83
        FL_OFF,                                                   -- forms.h:77
        FL_ON,                                                    -- forms.h:70
        FL_AUTO                                                  -- forms.h:74
    );
    for enum_anonymous0_t use (
        FL_CLOSE => -2,
        FL_IGNORE => -1,
        FL_OFF => 0,
        FL_ON => 1,
        FL_AUTO => 2
    );
    for enum_anonymous0_t'Size use X11.int'Size;                  -- forms.h:85

    FL_NONE : constant enum_anonymous0_t := FL_OFF;               -- forms.h:78
    FL_CANCEL : constant enum_anonymous0_t := FL_NONE;            -- forms.h:79
    FL_INVALID : constant enum_anonymous0_t := FL_CANCEL;         -- forms.h:80
    FL_OK : constant enum_anonymous0_t := FL_ON;                  -- forms.h:71
    FL_VALID : constant enum_anonymous0_t := FL_OK;               -- forms.h:72
    FL_PREEMPT : constant enum_anonymous0_t := FL_VALID;          -- forms.h:73
    FL_WHEN_NEEDED : constant enum_anonymous0_t := FL_AUTO;       -- forms.h:75

    type FL_COORD_UNIT is (
        FL_COORD_PIXEL,
        FL_COORD_MM,
        FL_COORD_POINT,
        FL_COORD_centiMM,
        FL_COORD_centiPOINT
    );
    for FL_COORD_UNIT'Size use X11.Int'Size;

    type FL_CLASS is (
        FL_INVALID_CLASS,
        FL_BUTTON,
        FL_LIGHTBUTTON,
        FL_ROUNDBUTTON,
        FL_ROUND3DBUTTON,
        FL_CHECKBUTTON,
        FL_BITMAPBUTTON,
        FL_PIXMAPBUTTON,
        FL_BITMAP,
        FL_PIXMAP,
        FL_BOX,
        FL_TEXT,
        FL_MENU,
        FL_CHART,
        FL_CHOICE,
        FL_COUNTER,
        FL_SLIDER,
        FL_VALSLIDER,
        FL_INPUT,
        FL_BROWSER,
        FL_DIAL,
        FL_TIMER,
        FL_CLOCK,
        FL_POSITIONER,
        FL_FREE,
        FL_XYPLOT,
        FL_FRAME,
        FL_LABELFRAME,
        FL_CANVAS,
        FL_GLCANVAS,
        FL_IMAGECANVAS,
        FL_FOLDER,
        FL_TEXTBOX                  -- for internal use    
    );
    for FL_CLASS'Size use X11.Int'Size;

    FL_USER_CLASS_START: constant :=   1001;      -- min. user class  v
    FL_USER_CLASS_END  : constant :=   9999;      -- max. user class  V
      
    type FL_PLACE is (
        FL_PLACE_FREE,
        FL_PLACE_MOUSE,
        FL_PLACE_CENTER,
        FL_PLACE_POSITION,
        FL_PLACE_SIZE,
        FL_PLACE_GEOMETRY,
        FL_PLACE_ASPECT,
        FL_PLACE_FULLSCREEN,
        FL_PLACE_HOTSPOT,
        FL_PLACE_ICONIC,
        FL_FREE_SIZE,
        FL_FIX_SIZE
    );
    for FL_PLACE use (
        FL_PLACE_FREE => 0,
        FL_PLACE_MOUSE => 1,
        FL_PLACE_CENTER => 2,
        FL_PLACE_POSITION => 4,
        FL_PLACE_SIZE => 8,
        FL_PLACE_GEOMETRY => 16,
        FL_PLACE_ASPECT => 32,
        FL_PLACE_FULLSCREEN => 64,
        FL_PLACE_HOTSPOT => 128,
        FL_PLACE_ICONIC => 256,
        FL_FREE_SIZE => 16384,
        FL_FIX_SIZE => 32768
    );
    for FL_PLACE'Size use X11.Int'Size;

    type FL_DECORATION is (
        FL_FULLBORDER,
        FL_TRANSIENT,
        FL_NOBORDER,
        FL_MODAL
    );
    for FL_DECORATION use (
        FL_FULLBORDER => 1,
        FL_TRANSIENT => 2,
        FL_NOBORDER => 3,
        FL_MODAL => 256
    );
    for FL_DECORATION'Size use X11.Int'Size;

    type FL_BOX_TYPE is (
        FL_NO_BOX,
        FL_UP_BOX,
        FL_DOWN_BOX,
        FL_BORDER_BOX,
        FL_SHADOW_BOX,
        FL_FRAME_BOX,
        FL_ROUNDED_BOX,
        FL_EMBOSSED_BOX,
        FL_FLAT_BOX,
        FL_RFLAT_BOX,
        FL_RSHADOW_BOX,
        FL_ROUNDED3D_UPBOX,
        FL_ROUNDED3D_DOWNBOX,
        FL_OVAL3D_UPBOX,
        FL_OVAL3D_DOWNBOX,
        FL_OSHADOW_BOX              -- not used
    );
    for FL_BOX_TYPE'Size use X11.Int'Size;
    
    function FL_IS_UPBOX( T: in FL_BOX_TYPE ) return Boolean;
    
    function FL_TO_DOWNBOX( T: in FL_BOX_TYPE ) return FL_BOX_TYPE;
    
    type FL_ALIGN is mod 2**32;
    for FL_ALIGN'Size use X11.Int'Size;
    -- Why do this?  Why not provide an "or" operator for the enumerated
    --  type?  Tempting, but such an operator would return values
    --  whose representation corresponds to no member of the type.

    FL_ALIGN_CENTER      : constant FL_ALIGN := 0;
    FL_ALIGN_TOP         : constant FL_ALIGN := 1;
    FL_ALIGN_BOTTOM      : constant FL_ALIGN := 2;
    FL_ALIGN_LEFT        : constant FL_ALIGN := 4;
    FL_ALIGN_TOP_LEFT    : constant FL_ALIGN := 5;
    FL_ALIGN_BOTTOM_LEFT : constant FL_ALIGN := 6;
    FL_ALIGN_RIGHT       : constant FL_ALIGN := 8;
    FL_ALIGN_TOP_RIGHT   : constant FL_ALIGN := 9;
    FL_ALIGN_BOTTOM_RIGHT: constant FL_ALIGN := 10;
    FL_ALIGN_INSIDE      : constant FL_ALIGN := 8192;
    FL_ALIGN_VERT        : constant FL_ALIGN := 16384;

    FL_ALIGN_LEFT_TOP : constant FL_ALIGN := FL_ALIGN_TOP_LEFT;
    FL_ALIGN_LEFT_BOTTOM : constant FL_ALIGN := FL_ALIGN_BOTTOM_LEFT;

    FL_ALIGN_RIGHT_TOP : constant FL_ALIGN := FL_ALIGN_TOP_RIGHT;
    FL_ALIGN_RIGHT_BOTTOM : constant FL_ALIGN := FL_ALIGN_BOTTOM_RIGHT;
        
    FL_MBUTTON1: constant := 1;
    FL_MBUTTON2: constant := 2;
    FL_MBUTTON3: constant := 3;
    FL_MBUTTON4: constant := 4;
    FL_MBUTTON5: constant := 5;
        
    FL_LEFT_MOUSE   : constant := FL_MBUTTON1;
    FL_MIDDLE_MOUSE : constant := FL_MBUTTON2;
    FL_RIGHT_MOUSE  : constant := FL_MBUTTON3;
    
    FL_LEFTMOUSE    : constant := FL_LEFT_MOUSE;
    FL_MIDDLEMOUSE  : constant := FL_MIDDLE_MOUSE;
    FL_RIGHTMOUSE   : constant := FL_RIGHT_MOUSE;
      
    type enum_anonymous7_t is (
        FL_RETURN_END_CHANGED,
        FL_RETURN_CHANGED,
        FL_RETURN_END,
        FL_RETURN_ALWAYS,
        FL_RETURN_DBLCLICK
    );
    for enum_anonymous7_t'Size use X11.Int'Size;

    subtype FL_RETURN_TYPE is enum_anonymous7_t;

    type FL_PD_COL is (
        FL_BLACK,
        FL_RED,
        FL_GREEN,
        FL_YELLOW,
        FL_BLUE,
        FL_MAGENTA,
        FL_CYAN,
        FL_WHITE,
        FL_TOMATO,
        FL_INDIANRED,
        FL_SLATEBLUE,
        FL_COL1,
        FL_RIGHT_BCOL,
        FL_BOTTOM_BCOL,
        FL_TOP_BCOL,
        FL_LEFT_BCOL,
        FL_MCOL,
        FL_INACTIVE,
        FL_PALEGREEN,
        FL_DARKGOLD,
        FL_ORCHID,
        FL_DARKCYAN,
        FL_DARKTOMATO,
        FL_WHEAT,
        FL_DARKORANGE,
        FL_DEEPPINK,
        FL_CHARTREUSE,
        FL_DARKVIOLET,
        FL_SPRINGGREEN,
        FL_DODGERBLUE,
        FL_FREE_COL1,
        FL_FREE_COL2,
        FL_FREE_COL3,
        FL_FREE_COL4,
        FL_FREE_COL5,
        FL_FREE_COL6,
        FL_FREE_COL7,
        FL_FREE_COL8,
        FL_FREE_COL9,
        FL_FREE_COL10,
        FL_FREE_COL11,
        FL_FREE_COL12,
        FL_FREE_COL13,
        FL_FREE_COL14,
        FL_FREE_COL15,
        FL_FREE_COL16
    );
    for FL_PD_COL use (
        FL_BLACK => 0,
        FL_RED => 1,
        FL_GREEN => 2,
        FL_YELLOW => 3,
        FL_BLUE => 4,
        FL_MAGENTA => 5,
        FL_CYAN => 6,
        FL_WHITE => 7,
        FL_TOMATO => 8,
        FL_INDIANRED => 9,
        FL_SLATEBLUE => 10,
        FL_COL1 => 11,
        FL_RIGHT_BCOL => 12,
        FL_BOTTOM_BCOL => 13,
        FL_TOP_BCOL => 14,
        FL_LEFT_BCOL => 15,
        FL_MCOL => 16,
        FL_INACTIVE => 17,
        FL_PALEGREEN => 18,
        FL_DARKGOLD => 19,
        FL_ORCHID => 20,
        FL_DARKCYAN => 21,
        FL_DARKTOMATO => 22,
        FL_WHEAT => 23,
        FL_DARKORANGE => 24,
        FL_DEEPPINK => 25,
        FL_CHARTREUSE => 26,
        FL_DARKVIOLET => 27,
        FL_SPRINGGREEN => 28,
        FL_DODGERBLUE => 29,
        FL_FREE_COL1 => 256,
        FL_FREE_COL2 => 257,
        FL_FREE_COL3 => 258,
        FL_FREE_COL4 => 259,
        FL_FREE_COL5 => 260,
        FL_FREE_COL6 => 261,
        FL_FREE_COL7 => 262,
        FL_FREE_COL8 => 263,
        FL_FREE_COL9 => 264,
        FL_FREE_COL10 => 265,
        FL_FREE_COL11 => 266,
        FL_FREE_COL12 => 267,
        FL_FREE_COL13 => 268,
        FL_FREE_COL14 => 269,
        FL_FREE_COL15 => 270,
        FL_FREE_COL16 => 271
    );
    for FL_PD_COL'Size use X11.Int'Size;
    
    FL_DOGERBLUE: constant FL_PD_COL := FL_DODGERBLUE;
    
    subtype FL_COLOR is FL_PD_COL;

    type enum_anonymous9_t is (
        FL_PUP_NONE,
        FL_PUP_GREY,
        FL_PUP_BOX,
        FL_PUP_CHECK,
        FL_PUP_RADIO
    );
    for enum_anonymous9_t use (
        FL_PUP_NONE => 0,
        FL_PUP_GREY => 1,
        FL_PUP_BOX => 2,
        FL_PUP_CHECK => 4,
        FL_PUP_RADIO => 8
    );
    for enum_anonymous9_t'Size use X11.Int'Size;

    subtype FL_ITEM_MODE is enum_anonymous9_t;

    type FL_EVENTS is (
        FL_NOEVENT,
        FL_DRAW,
        FL_PUSH,
        FL_RELEASE,
        FL_ENTER,
        FL_LEAVE,
        FL_MOUSE,
        FL_FOCUS,
        FL_UNFOCUS,
        FL_KEYBOARD,
        FL_MOTION,
        FL_STEP,
        FL_SHORTCUT,
        FL_FREEMEM,
        FL_OTHER,
        FL_DRAWLABEL,
        FL_DBLCLICK,
        FL_TRPLCLICK,
        FL_ATTRIB,
        FL_PS
    );
    for FL_EVENTS'Size use X11.Int'Size;

    type FL_RESIZE_T is (
        FL_RESIZE_NONE,
        FL_RESIZE_X,
        FL_RESIZE_Y
    );
    for FL_RESIZE_T'Size use X11.Int'Size;

    type FL_KEY is (
        FL_KEY_TAB,
        FL_KEY_NORMAL,
        FL_KEY_SPECIAL,
        FL_KEY_ALL
    );
    for FL_KEY use (
        FL_KEY_TAB => 1,
        FL_KEY_NORMAL => 2,
        FL_KEY_SPECIAL => 4,
        FL_KEY_ALL => 7
    );
    for FL_KEY'Size use X11.Int'Size;

    FL_ALT_MASK    : constant := 2**25;
    FL_CONTROL_MASK: constant := 2**26;
    FL_SHIFT_MASK  : constant := 2**26;
    FL_ALT_VAL     : constant := FL_ALT_MASK;
  
    type FL_FIND is (
        FL_FIND_INPUT,
        FL_FIND_AUTOMATIC,
        FL_FIND_MOUSE,
        FL_FIND_CANVAS,
        FL_FIND_KEYSPECIAL
    );
    for FL_FIND'Size use X11.Int'Size;

    type FL_TEXT_STYLE is (
        FL_INVALID_STYLE,
        FL_NORMAL_STYLE,
        FL_BOLD_STYLE,
        FL_ITALIC_STYLE,
        FL_BOLDITALIC_STYLE,
        FL_FIXED_STYLE,
        FL_FIXEDBOLD_STYLE,
        FL_FIXEDITALIC_STYLE,
        FL_FIXEDBOLDITALIC_STYLE,
        FL_TIMES_STYLE,
        FL_TIMESBOLD_STYLE,
        FL_TIMESITALIC_STYLE,
        FL_TIMESBOLDITALIC_STYLE,
        FL_SHADOW_STYLE,
        FL_ENGRAVED_STYLE,
        FL_EMBOSSED_STYLE
    );
    for FL_TEXT_STYLE use (
        FL_INVALID_STYLE => -1,
        FL_NORMAL_STYLE => 0,
        FL_BOLD_STYLE => 1,
        FL_ITALIC_STYLE => 2,
        FL_BOLDITALIC_STYLE => 3,
        FL_FIXED_STYLE => 4,
        FL_FIXEDBOLD_STYLE => 5,
        FL_FIXEDITALIC_STYLE => 6,
        FL_FIXEDBOLDITALIC_STYLE => 7,
        FL_TIMES_STYLE => 8,
        FL_TIMESBOLD_STYLE => 9,
        FL_TIMESITALIC_STYLE => 10,
        FL_TIMESBOLDITALIC_STYLE => 11,
        FL_SHADOW_STYLE => 2**9,
        FL_ENGRAVED_STYLE => 2**10,
        FL_EMBOSSED_STYLE => 2**11
    );
    for FL_TEXT_STYLE'Size use X11.Int'Size;

    type enum_anonymous22_t is (
        FL_READ,
        FL_WRITE,
        FL_EXCEPT
    );
    for enum_anonymous22_t use (
        FL_READ => 1,
        FL_WRITE => 2,
        FL_EXCEPT => 4
    );
    for enum_anonymous22_t'Size use X11.Int'Size;

    type enum_anonymous27_t is (
        FL_illegalVisual,
        FL_StaticGray,
        FL_GrayScale,
        FL_StaticColor,
        FL_PseudoColor,
        FL_TrueColor,
        FL_DirectColor,
        FL_DefaultVisual
    );
    for enum_anonymous27_t use (
        FL_illegalVisual => -1,
        FL_StaticGray => 0,
        FL_GrayScale => 1,
        FL_StaticColor => 2,
        FL_PseudoColor => 3,
        FL_TrueColor => 4,
        FL_DirectColor => 5,
        FL_DefaultVisual => 10
    );
    for enum_anonymous27_t'Size use X11.Int'Size;

    type enum_anonymous28_t is (
        FL_NoGravity,
        FL_NorthWest,
        FL_North,
        FL_NorthEast,
        FL_West,
        FL_East,
        FL_SouthWest,
        FL_South,
        FL_SouthEast
    );
    for enum_anonymous28_t use (
        FL_NoGravity => 0,
        FL_NorthWest => 1,
        FL_North => 2,
        FL_NorthEast => 3,
        FL_West => 4,
        FL_East => 6,
        FL_SouthWest => 7,
        FL_South => 8,
        FL_SouthEast => 9
    );
    for enum_anonymous28_t'Size use X11.Int'Size;

    FL_ForgetGravity : constant enum_anonymous28_t := FL_NoGravity;

    subtype FL_Gravity is enum_anonymous28_t;

    type enum_anonymous33_t is (
        FL_WM_SHIFT,
        FL_WM_NORMAL
    );
    for enum_anonymous33_t use (
        FL_WM_SHIFT => 1,
        FL_WM_NORMAL => 2
    );
    for enum_anonymous33_t'Size use X11.Int'Size;

    type FL_RTYPE is (
        FL_SHORT,
        FL_BOOL,
        FL_INT,
        FL_LONG,
        FL_FLOAT,
        FL_STRING
    );
    for FL_RTYPE use (
        FL_SHORT => 10,
        FL_BOOL => 11,
        FL_INT => 12,
        FL_LONG => 13,
        FL_FLOAT => 14,
        FL_STRING => 15
    );
    for FL_RTYPE'Size use X11.Int'Size;

    type enum_anonymous38_t is (
        FL_PDDepth,
        FL_PDClass,
        FL_PDDouble,
        FL_PDSync,
        FL_PDPrivateMap,
        FL_PDLeftScrollBar,
        FL_PDPupFontSize,
        FL_PDButtonFontSize,
        FL_PDInputFontSize,
        FL_PDSliderFontSize,
        FL_PDVisual,
        FL_PDULThickness,
        FL_PDULPropWidth,
        FL_PDBS,
        FL_PDCoordUnit,
        FL_PDDebug,
        FL_PDSharedMap,
        FL_PDStandardMap,
        FL_PDBorderWidth,
        FL_PDSafe,
        FL_PDMenuFontSize,
        FL_PDBrowserFontSize,
        FL_PDChoiceFontSize,
        FL_PDLabelFontSize
    );
    for enum_anonymous38_t use (
        FL_PDDepth => 2,
        FL_PDClass => 4,
        FL_PDDouble => 8,
        FL_PDSync => 16,
        FL_PDPrivateMap => 32,
        FL_PDLeftScrollBar => 64,
        FL_PDPupFontSize => 128,
        FL_PDButtonFontSize => 256,
        FL_PDInputFontSize => 512,
        FL_PDSliderFontSize => 1024,
        FL_PDVisual => 2048,
        FL_PDULThickness => 4096,
        FL_PDULPropWidth => 8192,
        FL_PDBS => 16384,
        FL_PDCoordUnit => 32768,
        FL_PDDebug => 65536,
        FL_PDSharedMap => 131072,
        FL_PDStandardMap => 262144,
        FL_PDBorderWidth => 524288,
        FL_PDSafe => 1048576,
        FL_PDMenuFontSize => 2097152,
        FL_PDBrowserFontSize => 4194304,
        FL_PDChoiceFontSize => 8388608,
        FL_PDLabelFontSize => 16777216
    );
    for enum_anonymous38_t'Size use X11.Int'Size;

    type FL_BROWSER_TYPE is (
        FL_NORMAL_BROWSER,
        FL_SELECT_BROWSER,
        FL_HOLD_BROWSER,
        FL_MULTI_BROWSER
    );
    for FL_BROWSER_TYPE'Size use X11.Int'Size;

--     type enum_anonymous40_t is (
--         FL_SCROLLBAR_OFF,
--         FL_SCROLLBAR_ON,
--         FL_SCROLLBAR_ALWAYS_ON
--     );
--     for enum_anonymous40_t'Size use X11.Int'Size;

    type FL_BUTTON_TYPE is (
        FL_NORMAL_BUTTON,
        FL_PUSH_BUTTON,
        FL_RADIO_BUTTON,
        FL_HIDDEN_BUTTON,
        FL_TOUCH_BUTTON,
        FL_INOUT_BUTTON,
        FL_RETURN_BUTTON,
        FL_HIDDEN_RET_BUTTON,
        FL_MENU_BUTTON
    );
    for FL_BUTTON_TYPE'Size use X11.Int'Size;

    type FL_CANVAS_TYPE is (
        FL_NORMAL_CANVAS,
        FL_SCROLLED_CANVAS
    );
    for FL_CANVAS_TYPE'Size use X11.Int'Size;

    type FL_CHART_TYPE is (
        FL_BAR_CHART,
        FL_HORBAR_CHART,
        FL_LINE_CHART,
        FL_FILL_CHART,
        FL_SPIKE_CHART,
        FL_PIE_CHART,
        FL_SPECIALPIE_CHART
    );
    for FL_CHART_TYPE'Size use X11.Int'Size;
    
    FL_FILLED_CHART: constant FL_CHART_TYPE := FL_FILL_CHART;
    
    type FL_CHOICE_TYPE is (
        FL_NORMAL_CHOICE,
        FL_NORMAL_CHOICE2,
        FL_DROPLIST_CHOICE
    );
    for FL_CHOICE_TYPE'Size use X11.Int'Size;

    type enum_anonymous49_t is (
        FL_ANALOG_CLOCK,
        FL_DIGITAL_CLOCK
    );
    for enum_anonymous49_t'Size use X11.Int'Size;

    subtype FL_CLOCK_TYPE is enum_anonymous49_t;

    type FL_COUNTER_TYPE is (
        FL_NORMAL_COUNTER,
        FL_SIMPLE_COUNTER
    );
    for FL_COUNTER_TYPE'Size use X11.Int'Size;

    type FL_DIAL_TYPE is (
        FL_NORMAL_DIAL,
        FL_LINE_DIAL,
        FL_FILL_DIAL
    );
    for FL_DIAL_TYPE'Size use X11.Int'Size;
    
    type FL_DIAL_DIRECTION is (
        FL_DIAL_CW,
        FL_DIAL_CCW );
    
    type enum_anonymous52_t is (
        FT_FILE,
        FT_DIR,
        FT_LINK,
        FT_SOCK,
        FT_FIFO,
        FT_BLK,
        FT_CHR,
        FT_OTHER
    );
    for enum_anonymous52_t'Size use X11.Int'Size;

    type enum_anonymous55_t is (
        FL_NO_FRAME,
        FL_UP_FRAME,
        FL_DOWN_FRAME,
        FL_BORDER_FRAME,
        FL_SHADOW_FRAME,
        FL_ENGRAVED_FRAME,
        FL_ROUNDED_FRAME,
        FL_EMBOSSED_FRAME,
        FL_OVAL_FRAME
    );
    for enum_anonymous55_t'Size use X11.Int'Size;

    subtype FL_FRAME_TYPE is enum_anonymous55_t;
    
    FL_FRAME_COL1: constant FL_COLOR := FL_BLACK;   -- border color
    FL_FRAME_COL2: constant FL_COLOR := FL_COL1;    -- label background
    FL_FRAME_LCOL: constant FL_COLOR := FL_BLACK;   -- label color
    
    type FL_FREE_TYPE is (
        FL_NORMAL_FREE,
        FL_INACTIVE_FREE,
        FL_INPUT_FREE,
        FL_CONTINUOUS_FREE,
        FL_ALL_FREE
    );
    for FL_FREE_TYPE'Size use X11.Int'Size;

    type FL_INPUT_TYPE is (
        FL_NORMAL_INPUT,
        FL_FLOAT_INPUT,
        FL_INT_INPUT,
        FL_DATE_INPUT,
        FL_MULTILINE_INPUT,
        FL_HIDDEN_INPUT,
        FL_SECRET_INPUT
    );
    for FL_INPUT_TYPE'Size use X11.Int'Size;
    
    type Fl_Date_Input_Mode is (
        FL_INPUT_MMDD, FL_INPUT_DDMM );
    
    type FL_MENU_TYPE is (
        FL_TOUCH_MENU,
        FL_PUSH_MENU,
        FL_PULLDOWN_MENU
    );
    for FL_MENU_TYPE'Size use X11.Int'Size;

    type FL_SLIDER_TYPE is (                                    -- forms.h:2589
        FL_VERT_SLIDER,                                         -- forms.h:2579
        FL_HOR_SLIDER,                                          -- forms.h:2580
        FL_VERT_FILL_SLIDER,                                    -- forms.h:2581
        FL_HOR_FILL_SLIDER,                                     -- forms.h:2582
        FL_VERT_NICE_SLIDER,                                    -- forms.h:2583
        FL_HOR_NICE_SLIDER,                                     -- forms.h:2584
        FL_HOR_BROWSER_SLIDER,                                  -- forms.h:2585
        FL_VERT_BROWSER_SLIDER,                                 -- forms.h:2586
        FL_HOR_BROWSER_SLIDER2,                                 -- forms.h:2587
        FL_VERT_BROWSER_SLIDER2                                 -- forms.h:2589
    );
    for FL_SLIDER_TYPE'Size use X11.int'Size;                   -- forms.h:2589

    type enum_anonymous62_t is (
        FL_NORMAL_TEXT
    );
    for enum_anonymous62_t'Size use X11.Int'Size;

    subtype FL_TEXT_TYPE is enum_anonymous62_t;

    type enum_anonymous71_t is (                                -- forms.h:2678
        FL_NORMAL_TEXTBOX,                                      -- forms.h:2674
        FL_SELECT_TEXTBOX,                                      -- forms.h:2675
        FL_HOLD_TEXTBOX,                                        -- forms.h:2676
        FL_MULTI_TEXTBOX                                        -- forms.h:2678
    );
    for enum_anonymous71_t'Size use X11.int'Size;               -- forms.h:2678

    FL_TEXTBOX_BOXTYPE: constant FL_BOX_TYPE := FL_DOWN_BOX;
    FL_TEXTBOX_COL1   : constant FL_COLOR    := FL_COL1;
    FL_TEXTBOX_COL2   : constant FL_COLOR    := FL_YELLOW;
    FL_TEXTBOX_ALIGN  : constant FL_ALIGN    := FL_ALIGN_BOTTOM;
  
    type FL_TIMER_TYPE is (
        FL_NORMAL_TIMER,
        FL_VALUE_TIMER,
        FL_HIDDEN_TIMER
    );
    for FL_TIMER_TYPE'Size use X11.Int'Size;

    type FL_XYPLOT_TYPE is (
        FL_NORMAL_XYPLOT,
        FL_SQUARE_XYPLOT,
        FL_CIRCLE_XYPLOT,
        FL_FILL_XYPLOT,
        FL_POINTS_XYPLOT,
        FL_DASHED_XYPLOT,
        FL_IMPULSE_XYPLOT,
        FL_ACTIVE_XYPLOT,
        FL_EMPTY_XYPLOT
    );
    for FL_XYPLOT_TYPE'Size use X11.Int'Size;

    type enum_anonymous65_t is (
        FL_LINEAR,
        FL_LOG
    );
    for enum_anonymous65_t'Size use X11.Int'Size;
    
    type enum_anonymous76_t is (                                -- forms.h:2791
        FL_GRID_NONE,                                           -- forms.h:2788
        FL_GRID_MAJOR,                                          -- forms.h:2789
        FL_GRID_MINOR                                           -- forms.h:2791
    );
    for enum_anonymous76_t'Size use X11.int'Size;               -- forms.h:2791
    
    FL_SLIDER_NONE : constant := 0;
    FL_SLIDER_BOX  : constant := 1;
    FL_SLIDER_KNOB : constant := 2;
    FL_SLIDER_UP   : constant := 4;
    FL_SLIDER_DOWN : constant := 8;
    FL_SLIDER_ALL  : constant := 15;
    
    type long_access is access all X11.long;
    type int_const_access is access constant X11.Int;
    type float_const_access is access constant interfaces.c.c_float;


    type FL_STATE;
    type FL_pixmap_c0;
    type FL_FONT;
    type FL_WM_STUFF;
    type FD_FSELECTOR;
    type struct_forms;
    type struct_flobjs;

    type FL_VN_PAIR;
    type FL_RESOURCE;
    type FL_IOPT;
    type FL_BUTTON_STRUCT;
    type FL_Dirlist;

    type struct_forms_access is access all struct_forms;
    type struct_flobjs_access is access all struct_flobjs;
    type struct_flobjs_access_c0 is access all struct_flobjs;
    type FL_OBJECT_access is access all struct_flobjs;
    type FL_OBJECT_Access_Array is array (natural range <>) of FL_OBJECT_Access;
    type FL_FORM_access is access all struct_forms;
    type XEvent_const_access is access constant X11.Xlib.XEvent;
    type FL_Dirlist_const_access is access constant FL_Dirlist;
    type FD_FSELECTOR_access is access all FD_FSELECTOR;

    type prehandle_func_access is access function(
                p1: access struct_flobjs;
                p2: X11.Int;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: X11.Int;
                p6: System.Address)
               return X11.Int;
    pragma Convention(C, prehandle_func_access);

    subtype handle_func_access is prehandle_func_access;

    subtype posthandle_func_access is prehandle_func_access;

    type object_callback_proc_access is access procedure(
                p1: access struct_flobjs;
                p2: X11.long);
    pragma Convention(C, object_callback_proc_access);


    type anon17_func_access is access procedure(
                p1: access struct_flobjs;
                p2: System.Address);

    pragma Convention(C, anon17_func_access);

    subtype FL_FORMCALLBACKPTR is anon17_func_access;

    type anon19_func_access is access function(
                p1: access struct_forms;
                p2: System.Address)
               return X11.Int;

    pragma Convention(C, anon19_func_access);

    subtype FL_RAW_CALLBACK is anon19_func_access;

    subtype FL_FORM_ATCLOSE is anon19_func_access;

    type anon20_func_access is access procedure(
                p1: access struct_forms;
                p2: System.Address);

    pragma Convention(C, anon20_func_access);

    subtype FL_FORM_ATDEACTIVATE is anon20_func_access;

    subtype FL_FORM_ATACTIVATE is anon20_func_access;

    type anon23_func_access is access procedure(
                p1: X11.Int;
                p2: System.Address);

    pragma Convention(C, anon23_func_access);

    subtype FL_IO_CALLBACK is anon23_func_access;

    type anon25_func_access is access procedure(
                x : FL_Coord;
                y : FL_Coord;
                w : FL_Coord;
                h : FL_Coord;
                p5: X11.Int;
                p6: FL_COLOR);

    pragma Convention(C, anon25_func_access);

    subtype FL_DRAWPTR is anon25_func_access;

    type anon26_func_access is access function(
                p1: X.Strings.const_charp;
                p2: System.Address)
               return X11.Int;

    pragma Convention(C, anon26_func_access);

    subtype FL_FSCB is anon26_func_access;
    
    type Access_timeout_Callback is access procedure(
                P1: X11.Int;
                P2: System.Address );
    
    type GC_array is
        array(Natural range <>)
        of aliased X.Xlib.GC;

    type FL_STATE is
        record
            xvinfo     : aliased X11.Xutil.XVisualInfo_access;
            cur_fnt    : aliased X11.Xlib.XFontStruct_access;
            colormap   : aliased X11.Colormap;
            trailblazer: aliased X11.Window;
            vclass     : aliased X11.Int;
            depth      : aliased X11.Int;
            rgb_bits   : aliased X11.Int;
            dithered   : aliased X11.Int;
            pcm        : aliased X11.Int;
            gc         : aliased GC_array(0..15);
            textgc     : aliased GC_array(0..15);
            dimmedGC   : aliased X11.Xlib.GC;
            lut        : aliased unsigned_long_array(0..1023);

            rshift     : aliased X11.unsigned_int;
            rmask      : aliased X11.unsigned_int;
            rbits      : aliased X11.unsigned_int;
            gshift     : aliased X11.unsigned_int;
            gmask      : aliased X11.unsigned_int;
            gbits      : aliased X11.unsigned_int;
            bshift     : aliased X11.unsigned_int;
            bmask      : aliased X11.unsigned_int;
            bbits      : aliased X11.unsigned_int;
        end record;


    type FL_STATE_array is
        array(Natural range <>)
        of aliased FL_STATE;

    type FL_pixmap_c0 is
        record
            pixmap: aliased X11.Pixmap;
            win   : aliased X11.Window;
            visual: aliased X11.Xlib.Visual_access;
            x     : aliased FL_Coord;
            y     : aliased FL_Coord;
            w     : aliased X11.unsigned_int;
            h     : aliased X11.unsigned_int;
            depth : aliased X11.Int;
        end record;


    type XFontStruct_access_array is
        array(Natural range <>)
        of aliased X11.Xlib.XFontStruct_access;

    type FL_FONT is
        record
            fs   : aliased XFontStruct_access_array(0..9);
            size : aliased short_array(0..9);
            nsize: aliased X11.short;
            fname: aliased Interfaces.c.char_Array(0..79);
        end record;


    type anon32_func_access is access function(
                p1: access X11.Xlib.XEvent;
                p2: System.Address)
               return X11.Int;

    pragma Convention(C, anon32_func_access);

    subtype FL_APPEVENT_CB is anon32_func_access;


    type FL_WM_STUFF is
        record
            rpx        : aliased X11.Int;
            rpy        : aliased X11.Int;
            trpx       : aliased X11.Int;
            trpy       : aliased X11.Int;
            bw         : aliased X11.Int;
            rep_method : aliased X11.Int;
            pos_request: aliased X11.unsigned_int;
        end record;

    type anon44_func_access is access procedure(
                p1: access FL_BUTTON_STRUCT);

    pragma Convention(C, anon44_func_access);

    subtype FL_CleanupButton is anon44_func_access;

    type anon54_func_access is access function(
                p1: X11.Strings.const_charp;
                p2: X11.Int)
               return X11.Int;

    pragma Convention(C, anon54_func_access);

    subtype FL_DIRLIST_FILTER is anon54_func_access;

    type FD_FSELECTOR is
        record
            fselect : aliased FL_FORM_access;
            browser : aliased FL_OBJECT_access;
            input   : aliased FL_OBJECT_access;
            prompt  : aliased FL_OBJECT_access;
            resbutt : aliased FL_OBJECT_access;
            patbutt : aliased FL_OBJECT_access;
            dirbutt : aliased FL_OBJECT_access;
            cancel  : aliased FL_OBJECT_access;
            ready   : aliased FL_OBJECT_access;
            dirlabel: aliased FL_OBJECT_access;
            patlabel: aliased FL_OBJECT_access;
            appbutt : aliased FL_OBJECT_Access_Array(1..3);
        end record;

    pragma Convention(C, FD_FSELECTOR);

    type anon60_func_access is access function(
                p1: X11.Int)
               return X11.Int;

    pragma Convention(C, anon60_func_access);

    subtype FL_PUP_CB is anon60_func_access;

    type struct_forms is
        record
            fdui               : aliased System.Address;
            u_vdata            : aliased System.Address;
            u_ldata            : aliased X11.Long;
            label              : aliased X11.Strings.charp;
            window             : aliased X11.Window;
            x                  : aliased FL_Coord;
            y                  : aliased FL_Coord;
            w                  : aliased FL_Coord;
            h                  : aliased FL_Coord;
            hotx               : aliased FL_Coord;
            hoty               : aliased FL_Coord;
            first              : aliased struct_flobjs_access_c0;
            last               : aliased struct_flobjs_access_c0;
            focusobj           : aliased struct_flobjs_access_c0;
            form_callback      : aliased FL_FORMCALLBACKPTR;
            activate_callback  : aliased FL_FORM_ATACTIVATE;
            deactivate_callback: aliased FL_FORM_ATDEACTIVATE;
            form_cb_data       : aliased System.Address;
            activate_data      : aliased System.Address;
            deactivate_data    : aliased System.Address;
            key_callback       : aliased FL_RAW_CALLBACK;
            push_callback      : aliased FL_RAW_CALLBACK;
            crossing_callback  : aliased FL_RAW_CALLBACK;
            motion_callback    : aliased FL_RAW_CALLBACK;
            all_callback       : aliased FL_RAW_CALLBACK;
            compress_mask      : aliased X11.unsigned_long;
            evmask             : aliased X11.unsigned_long;
            close_callback     : aliased FL_FORM_ATCLOSE;
            close_data         : aliased System.Address;
            flpixmap           : aliased System.Address;
            icon_pixmap        : aliased X11.unsigned_long;
            icon_mask          : aliased X11.unsigned_long;
            vmode              : aliased X11.Int;
            deactivated        : aliased X11.Int;
            use_pixmap         : aliased X11.Int;
            frozen             : aliased X11.Int;
            visible            : aliased X11.Int;
            wm_border          : aliased X11.Int;
            prop               : aliased X11.unsigned_int;
            has_auto           : aliased X11.Int;
            top                : aliased X11.Int;
            sort_of_modal      : aliased X11.Int;
            reserved           : aliased Int_Array(1..10);
        end record;

    type struct_flobjs is
        record
            form           : aliased struct_forms_access;
            u_vdata        : aliased System.Address;
            u_ldata        : aliased X11.Long;
            objclass       : aliased X11.Int;
            c_type         : aliased X11.Int;
            boxtype        : aliased X11.Int;
            x              : aliased FL_Coord;
            y              : aliased FL_Coord;
            w              : aliased FL_Coord;
            h              : aliased FL_Coord;
            bw             : aliased FL_Coord;
            col1           : aliased FL_COLOR;
            col2           : aliased FL_COLOR;
            label          : aliased X11.Strings.charp;
            lcol           : aliased FL_COLOR;
            align          : aliased X11.Int;
            lsize          : aliased X11.Int;
            lstyle         : aliased X11.Int;
            shortcut       : aliased long_access;
            handle         : aliased handle_func_access;
            object_callback: aliased object_callback_proc_access;
            argument       : aliased X11.long;
            spec           : aliased System.Address;
            prehandle      : aliased prehandle_func_access;
            posthandle     : aliased posthandle_func_access;
            resize         : aliased X11.unsigned_int;
            nwgravity      : aliased X11.unsigned_int;
            segravity      : aliased X11.unsigned_int;
            prev           : aliased struct_flobjs_access;
            next           : aliased struct_flobjs_access;
            parent         : aliased struct_flobjs_access;
            child          : aliased struct_flobjs_access;
            nc             : aliased struct_flobjs_access;
            is_child       : aliased X11.Int;
            flpixmap       : aliased System.Address;
            use_pixmap     : aliased X11.Int;
            double_buffer  : aliased X11.Int;
            pushed         : aliased X11.Int;
            focus          : aliased X11.Int;
            belowmouse     : aliased X11.Int;
            active         : aliased X11.Int;
            input          : aliased X11.Int;
            wantkey        : aliased X11.Int;
            radio          : aliased X11.Int;
            automatic      : aliased X11.Int;
            redraw         : aliased X11.Int;
            visible        : aliased X11.Int;
            clip           : aliased X11.Int;
            click_timeout  : aliased X11.unsigned_long;
            c_vdata        : aliased System.Address;
            c_ldata        : aliased X11.long;
            spec_size      : aliased X11.Unsigned_Int;
            reserved       : aliased Int_Array(1..6);
        end record;

    subtype FL_OBJECT is struct_flobjs;

    type anon43_func_access is access procedure(
                p1: access FL_OBJECT);

    pragma Convention(C, anon43_func_access);

    subtype FL_DrawButton is anon43_func_access;
    subtype DrawButton is anon43_func_access;

    subtype FL_FORM is struct_forms;

    type FL_VN_PAIR is
        record
            val : aliased X11.Int;
            name: aliased X11.Strings.const_charp;
        end record;

    subtype FL_POINT is X11.Xlib.XPoint;
    
    subtype FL_RECT is X11.Xlib.XRectangle;                   -- forms.h:1020

    type FL_RESOURCE is
        record
            res_name : aliased X11.Strings.const_charp;
            res_class: aliased X11.Strings.const_charp;
            c_type   : aliased FL_RTYPE;
            var      : aliased System.Address;
            defval   : aliased X11.Strings.const_charp;
            nbytes   : aliased X11.Int;
        end record;


    type FL_IOPT is
        record
            rgamma          : aliased interfaces.c.c_float;
            ggamma          : aliased interfaces.c.c_float;
            bgamma          : aliased interfaces.c.c_float;
            debug           : aliased X11.Int;
            sync            : aliased X11.Int;
            depth           : aliased X11.Int;
            vclass          : aliased X11.Int;
            doubleBuffer    : aliased X11.Int;
            ulPropWidth     : aliased X11.Int;
            ulThickness     : aliased X11.Int;
            buttonFontSize  : aliased X11.Int;
            sliderFontSize  : aliased X11.Int;
            inputFontSize   : aliased X11.Int;
            browserFontSize : aliased X11.Int;
            menuFontSize    : aliased X11.Int;
            choiceFontSize  : aliased X11.Int;
            labelFontSize   : aliased X11.Int;
            pupFontSize     : aliased X11.Int;
            pupFontStyle    : aliased X11.Int;
            privateColormap : aliased X11.Int;
            sharedColormap  : aliased X11.Int;
            standardColormap: aliased X11.Int;
            leftScrollBar   : aliased X11.Int;
            backingStore    : aliased X11.Int;
            coordUnit       : aliased X11.Int;
            borderWidth     : aliased X11.Int;
            safe            : aliased X11.Int;
            rgbfile         : aliased X11.Strings.charp;
            vname           : aliased Interfaces.c.char_Array(0..23);
        end record;


    type FL_BUTTON_STRUCT is
        record
            pixmap  : aliased X11.Pixmap;
            mask    : aliased X11.Pixmap;
            bits_w  : aliased X11.unsigned_int;
            bits_h  : aliased X11.unsigned_int;
            val     : aliased X11.Int;
            mousebut: aliased X11.Int;
            timdel  : aliased X11.Int;
            event   : aliased X11.Int;
            cspecl  : aliased X11.long;
            cspecv  : aliased System.Address;
        end record;
    
    subtype FL_BUTTON_SPEC is FL_BUTTON_STRUCT;

    type FL_Dirlist is
        record
            name    : aliased X11.Strings.charp;
            C_Type  : aliased X11.Int;
            Dl_Mtime: aliased X11.Long;
            Dl_Size : aliased X11.Unsigned_Long;
            Filler  : aliased Long_Array(1..3);
        end record;
    
    type Fl_Dirlist_Sort_Kind is (
        FL_ALPHASORT,
        FL_RALPHASORT,
        FL_MTIMESORT,
        FL_RMTIMESORT,
        FL_SIZESORT,
        FL_RSIZESORT );    
    
    for Fl_Dirlist_Sort_Kind use (
        FL_ALPHASORT => 1,
        FL_RALPHASORT => 2,
        FL_MTIMESORT => 3,
        FL_RMTIMESORT => 4,
        FL_SIZESORT => 5,
        FL_RSIZESORT => 6 );    
    
    subtype FL_FONT_STYLE is FL_TEXT_STYLE;
    subtype FL_CMD_OPT is X11.Xresource.XrmOptionDescRec;

    FL_EVENT        : aliased FL_OBJECT_access;
    fl_current_form : aliased FL_FORM_access;
    fl_display      : aliased X11.Xlib.XDisplay_Access;
    pragma Import(C, fl_display, "fl_display");
    
    fl_screen       : aliased X11.Int;
    fl_root         : aliased X11.Window;
    fl_vroot        : aliased X11.Window;
    fl_scrh         : aliased X11.Int;
    fl_scrw         : aliased X11.Int;
    fl_vmode        : aliased X11.Int;
    pragma Import(C, fl_vmode, "fl_vmode");
    
    subtype fl_state_range is natural range 1 .. 8192;
    fl_state_c0     : aliased FL_STATE_array(0..fl_state_range'Last);
    -- fl_state_range defined so as not to be 0 .. Natural'last
    
    type FD_CMDLOG is
       record
          Form         : FL_FORM_Access;
          Browser      : FL_OBJECT_Access;
          Close_Browser: FL_OBJECT_Access;
          Clear_Browser: FL_OBJECT_Access;
       end record;
    
    type FD_CMDLOG_Access is access FD_CMDLOG;
    
    type FL_EditKeymap is
       record
          -- basic editing 
          del_prev_char    : X11.Long;     -- delete previous char    
          del_next_char    : X11.Long;     -- delete next char        
          del_prev_word    : X11.Long;     -- delete previous word    
          del_next_word    : X11.Long;     -- delete next word        
          
          -- movement 
          moveto_prev_line : X11.Long;     -- one line  up             
          moveto_next_line : X11.Long;     -- one line down            
          moveto_prev_char : X11.Long;     -- one char left            
          moveto_next_char : X11.Long;     -- one char right           
          moveto_prev_word : X11.Long;     -- one word left            
          moveto_next_word : X11.Long;     -- one word right           
          moveto_prev_page : X11.Long;     -- one page up              
          moveto_next_page : X11.Long;     -- one page down            
          moveto_bol       : X11.Long;     -- move to begining of line 
          moveto_eol       : X11.Long;     -- move to end of line      
          moveto_bof       : X11.Long;     -- move to begin of file    
          moveto_eof       : X11.Long;     -- move to end of file      
          
          -- misc. stuff 
          transpose        : X11.Long;     -- switch two char positions 
          paste            : X11.Long;     -- paste the edit buffer    
          backspace        : X11.Long;     -- another  del_prev_char   
          del_to_bol       : X11.Long;     -- cut to begining of line  
          del_to_eol       : X11.Long;     -- cut to end of line       
          clear_field      : X11.Long;     -- delete everything        
          del_to_eos       : X11.Long;     -- not implemented          
          Reserved         : Long_Array(1..4);     -- filler                  
      end record;
    
    type FL_EditKeymap_Access is access FL_EditKeymap;
    type FL_EditKeymap_Const_Access is access FL_EditKeymap;
    
    fl_ul_magic_char: aliased X11.Strings.charp;
    fl_textgc       : aliased X11.Xlib.GC;
    fl_get_vclass
              : X11.Int renames fl_vmode;
    fl_get_form_vclass                                          
              : X11.Int renames fl_vmode;
    fl_get_display
              : X11.Xlib.XDisplay_Access renames fl_display;
    FL_FormDisplay
              : X11.Xlib.XDisplay_Access renames fl_display;
    FL_ObjectDisplay
              : X11.Xlib.XDisplay_Access renames fl_display;

    type anon18_func_access is access procedure(
                p1: access FL_OBJECT;
                p2: X11.long);

    pragma Convention(C, anon18_func_access);

    subtype FL_CALLBACKPTR is anon18_func_access;

    type anon21_func_access is access function(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: X11.Int;
                p6: System.Address)
               return X11.Int;

    pragma Convention(C, anon21_func_access);

    subtype FL_HANDLEPTR is anon21_func_access;

    type anon45_func_access is access function(
                ob: access FL_OBJECT;
                p2: X11.Window;
                p3: X11.Int;
                p4: X11.Int;
                p5: access X11.Xlib.XEvent;
                p6: System.Address)
               return X11.Int;

    pragma Convention(C, anon45_func_access);

    subtype FL_HANDLE_CANVAS is anon45_func_access;

    type anon46_func_access is access function(
                p1: access FL_OBJECT)
               return X11.Int;

    pragma Convention(C, anon46_func_access);

    subtype FL_MODIFY_CANVAS_PROP is anon46_func_access;

    type anon58_func_access is access function(
                p1: access FL_OBJECT;
                p2: X11.Strings.const_charp;
                p3: X11.Strings.const_charp;
                p4: X11.Int)
               return X11.Int;

    pragma Convention(C, anon58_func_access);

    subtype FL_INPUTVALIDATOR is anon58_func_access;

    type FL_TIMER_FILTER is access function(
                p1: access FL_OBJECT;
                p2: Interfaces.C.double)
               return X11.Strings.charp;                     -- forms.h:2738

    pragma Convention(C, FL_TIMER_FILTER);

    procedure fl_add_io_callback(
                p1: X11.Int;
                p2: X11.unsigned_int;
                p3: FL_IO_CALLBACK;
                p4: System.Address);

    procedure fl_remove_io_callback(
                p1: X11.Int;
                p2: X11.unsigned_int;
                p3: FL_IO_CALLBACK);

    subtype FL_SIGNAL_HANDLER is anon23_func_access;

    procedure fl_add_signal_callback(
                p1: X11.int;
                p2: FL_SIGNAL_HANDLER;
                p3: System.Address);

    procedure fl_remove_signal_callback(
                p1: X11.Int);

    procedure fl_signal_caught(
                p1: X11.Int);

    procedure fl_app_signal_direct(
                p1: X11.Int);
    
    function fl_add_timeout( 
                P1: X11.Long;
                P2: Access_Timeout_Callback;
                P3: System.Address ) return X11.Int;
    
    procedure Fl_Remove_Timeout( P1: in X11.Int );
    
    function fl_get_vn_value(
                p1: access FL_VN_PAIR;
                p2: X11.Strings.const_charp)
               return X11.Int;

    pragma Import(C, fl_get_vn_value, "fl_get_vn_value");

    function fl_get_vn_name(
                p1: access FL_VN_PAIR;
                p2: X11.Int)
               return X11.Strings.const_charp;

    function fl_msleep(
                p1: X11.unsigned_long)
               return X11.unsigned_long;

    function fl_library_version(
                p1: access X11.Int;
                p2: access X11.Int)
               return X11.Int;

    function fl_bgn_form(
                form_type: FL_BOX_TYPE;
                w        : FL_Coord;
                h        : FL_Coord)
               return FL_FORM_access;

    procedure fl_end_form;

    function fl_do_forms return FL_OBJECT_access;
    procedure fl_do_forms;

    function fl_check_forms return FL_OBJECT_access;
    procedure fl_check_forms;

    function fl_do_only_forms return FL_OBJECT_access;

    function fl_check_only_forms return FL_OBJECT_access;

    procedure fl_freeze_form(
                form: access FL_FORM);

    procedure fl_set_focus_object(
                p1: access FL_FORM;
                p2: access FL_OBJECT);

    procedure fl_reset_focus_object(
                p1: access FL_OBJECT);
    
    function fl_set_form_atclose(
                p1: access FL_FORM;
                p2: FL_FORM_ATCLOSE;
                p3: System.Address)
               return FL_FORM_ATCLOSE;

    function fl_set_atclose(
                p1: FL_FORM_ATCLOSE;
                p2: System.Address)
               return FL_FORM_ATCLOSE;

    function fl_set_form_atactivate(
                form    : access FL_FORM;
                callback: FL_FORM_ATACTIVATE;
                data    : System.Address)
               return FL_FORM_ATACTIVATE;

    function fl_set_form_atdeactivate(
                form    : access FL_FORM;
                callback: FL_FORM_ATDEACTIVATE;
                data    : System.Address)
               return FL_FORM_ATDEACTIVATE;

    procedure fl_unfreeze_form(
                form: access FL_FORM);

    procedure fl_deactivate_form(
                form: access FL_FORM);

    procedure fl_activate_form(
                form: access FL_FORM);

    procedure fl_deactivate_all_forms;

    procedure fl_activate_all_forms;

    procedure fl_freeze_all_forms;

    procedure fl_unfreeze_all_forms;

    procedure fl_scale_form(
                form: access FL_FORM;
                xsc : Interfaces.C.Double;
                ysc : Interfaces.C.Double);

    procedure fl_set_form_position(
                form: access FL_FORM;
                x   : FL_Coord;
                y   : FL_Coord);

    procedure fl_set_form_title(
                p1: access FL_FORM;
                p2: X11.Strings.const_charp);

    pragma Import(C, fl_set_form_title, "fl_set_form_title");


    procedure fl_set_form_property(
                p1: access FL_FORM;
                p2: X11.unsigned_int);

    procedure fl_set_app_mainform(
                p1: access FL_FORM);

    function fl_get_app_mainform return FL_FORM_access;

    procedure fl_set_app_nomainform(
                p1: X11.Int);

    procedure fl_set_form_callback(
                form: access FL_FORM;
                p2: FL_FORMCALLBACKPTR;
                p3: System.Address);

    procedure fl_set_form_size(
                form: access FL_FORM;
                x   : FL_Coord;
                y   : FL_Coord);

    procedure fl_set_form_hotspot(
                form: access FL_FORM;
                x   : FL_Coord;
                y   : FL_Coord);

    procedure fl_set_form_hotobject(
                form: access FL_FORM;
                ob  : access FL_OBJECT);

    procedure fl_set_form_minsize(
                form: access FL_FORM;
                minw: FL_Coord;
                minh: FL_Coord);

    procedure fl_set_form_maxsize(
                form: access FL_FORM;
                maxw: FL_Coord;
                maxh: FL_Coord);

    procedure fl_set_form_event_cmask(
                p1: access FL_FORM;
                p2: X11.unsigned_long);

    function fl_get_form_event_cmask(
                p1: access FL_FORM)
               return X11.unsigned_long;

    procedure fl_set_form_geometry(
                form: access FL_FORM;
                x   : FL_Coord;
                y   : FL_Coord;
                w   : FL_Coord;
                h   : FL_Coord);

    function fl_show_form(
                form  : access FL_FORM;
                place : FL_PLACE;
                border: FL_DECORATION;
                title : X11.Strings.const_charp)
               return X11.long;

    procedure fl_show_form(
                form  : access FL_FORM;
                place : FL_PLACE;
                border: FL_DECORATION;
                title : X11.Strings.const_charp);

    pragma Import(C, fl_show_form, "fl_show_form");


    procedure fl_hide_form(
                form: access FL_FORM);

    procedure fl_free_form(
                form: access FL_FORM);

    procedure fl_redraw_form(
                form: access FL_FORM);

    procedure fl_set_form_dblbuffer(
                form: access FL_FORM;
                yes : boolean); -- X11.Int);

    function fl_prepare_form_window(
                form: access FL_FORM;
                p2  : X11.Int;
                p3  : X11.Int;
                p4  : X11.Strings.const_charp)
               return X11.Window;  -- X11.long;

    pragma Import(C, fl_prepare_form_window, "fl_prepare_form_window");

    function fl_show_form_window(
                p1: access FL_FORM)
               return X11.long;
    
    function fl_adjust_form_size(
                p1: access FL_FORM)
               return Interfaces.C.Double;
    
    procedure fl_adjust_form_size(
                p1: access FL_FORM);
    
    function fl_form_is_visible(
                p1: access FL_FORM)
               return Boolean;
    
    function fl_register_raw_callback(
                form    : access FL_FORM;
                mask    : X.long; -- X11.unsigned_long;
                callback: FL_RAW_CALLBACK)
               return FL_RAW_CALLBACK;

    function fl_bgn_group return FL_OBJECT_access;

    function fl_end_group return FL_OBJECT_access;
    procedure fl_end_group;

    procedure fl_addto_group(
                p1: access FL_OBJECT);

    procedure fl_set_object_boxtype(
                obj    : access FL_OBJECT;
                boxtype: FL_BOX_TYPE);

    procedure fl_set_object_bw(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_object_resize(
                ob       : access FL_OBJECT;
                howresize: FL_RESIZE_T);

    procedure fl_set_object_gravity(
                obj      : access FL_OBJECT;
                NWGravity: FL_Gravity;
                SEGravity: FL_Gravity);

    procedure fl_set_object_lsize(
                obj  : access FL_OBJECT;
                lsize: X11.Int);

    procedure fl_set_object_lstyle(
                obj   : access FL_OBJECT;
                lstyle: FL_TEXT_STYLE);

    procedure fl_set_object_lcol(
                p1: access FL_OBJECT;
                p2: FL_COLOR);

    procedure fl_set_object_lcolor(
                p1: access FL_OBJECT;
                p2: FL_COLOR) renames Fl_Set_Object_Lcol;

    procedure fl_set_object_return(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_object_lalign(
                obj  : access FL_OBJECT;
                align: FL_ALIGN);

    procedure fl_set_object_shortcut(
                obj   : access FL_OBJECT;
                str   : X11.Strings.const_charp;
                showUL: Boolean);

    pragma Import(C, fl_set_object_shortcut, "fl_set_object_shortcut");

    procedure fl_set_object_shortcutkey(
                p1: access FL_OBJECT;
                p2: X11.unsigned_int);

    procedure fl_set_object_dblbuffer(
                obj: access FL_OBJECT;
                yes: Boolean);

    procedure fl_set_object_color(
                obj : access FL_OBJECT;
                col1: FL_COLOR;
                col2: FL_COLOR);

    procedure fl_set_object_label(
                obj  : access FL_OBJECT;
                label: X11.Strings.const_charp);

    pragma Import(C, fl_set_object_label, "fl_set_object_label");


    procedure fl_set_object_position(
                p1: access FL_OBJECT;
                p2: FL_Coord;
                p3: FL_Coord);

    procedure fl_set_object_size(
                p1: access FL_OBJECT;
                p2: FL_Coord;
                p3: FL_Coord);

    procedure fl_set_object_automatic(
                obj: access FL_OBJECT;
                yes: Boolean);

    procedure fl_draw_object_label(
                p1: access FL_OBJECT);

    procedure fl_draw_object_label_outside(
                p1: access FL_OBJECT);

    procedure fl_draw_object_outside_label(
                p1: access FL_OBJECT) renames fl_draw_object_label_outside;

    procedure fl_set_object_geometry(
                p1: access FL_OBJECT;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord);

    procedure fl_fit_object_label(
                p1: access FL_OBJECT;
                p2: FL_Coord;
                p3: FL_Coord);

    procedure fl_get_object_geometry(
                ob: access FL_OBJECT;
                p2: access FL_Coord;
                p3: access FL_Coord;
                p4: access FL_Coord;
                p5: access FL_Coord);

    procedure fl_get_object_position(
                p1: access FL_OBJECT;
                p2: access FL_Coord;
                p3: access FL_Coord);

    procedure fl_compute_object_geometry(
                p1: access FL_OBJECT;
                p2: access FL_Coord;
                p3: access FL_Coord;
                p4: access FL_Coord;
                p5: access FL_Coord);

    procedure fl_get_object_bbox(
                p1: access FL_OBJECT;
                p2: access FL_Coord;
                p3: access FL_Coord;
                p4: access FL_Coord;
                p5: access FL_Coord) renames fl_compute_object_geometry;

    procedure fl_call_object_callback(
                p1: access FL_OBJECT);

    function fl_set_object_prehandler(
                p1: access FL_OBJECT;
                p2: FL_HANDLEPTR)
               return FL_HANDLEPTR;

    function fl_set_object_posthandler(
                p1: access FL_OBJECT;
                p2: FL_HANDLEPTR)
               return FL_HANDLEPTR;

    function fl_set_object_callback(
                obj     : access FL_OBJECT;
                callback: FL_CALLBACKPTR;
                argument: X11.long)
               return FL_CALLBACKPTR;

    procedure fl_set_object_callback(
                obj     : access FL_OBJECT;
                callback: FL_CALLBACKPTR;
                argument: X11.long);

    procedure fl_redraw_object(
                obj: access FL_OBJECT);

    procedure fl_scale_object(
                p1: access FL_OBJECT;
                p2: Interfaces.C.Double;
                p3: Interfaces.C.Double);

    procedure fl_show_object(
                obj: access FL_OBJECT);

    procedure fl_hide_object(
                obj: access FL_OBJECT);

    procedure fl_free_object(
                obj: access FL_OBJECT);

    procedure fl_delete_object(
                obj: access FL_OBJECT);

    procedure fl_trigger_object(
                p1: access FL_OBJECT);

    procedure fl_activate_object(
                obj: access FL_OBJECT);

    procedure fl_deactivate_object(
                obj: access FL_OBJECT);

    type p1_proc_access is access procedure(
                s: X11.Strings.const_charp);
    pragma Convention(C, p1_proc_access);


    function fl_enumerate_fonts(
                p1: p1_proc_access;
                p2: X11.Int)
               return X11.Int;

    procedure fl_set_font_name(
                numb: X11.Int;
                name: X11.Strings.const_charp);

    function fl_set_font_name(
                numb: X11.Int;
                name: X11.Strings.const_charp) return X11.Int;

    pragma Import(C, fl_set_font_name, "fl_set_font_name");


    procedure fl_set_font(
                p1: X11.Int;
                p2: X11.Int);

    function fl_get_char_height(
                style  : FL_TEXT_STYLE;
                size   : X11.Int;
                ascend : access X11.Int;
                descend: access X11.Int)
               return X11.Int;

    function fl_get_char_width(
                style: FL_TEXT_STYLE;
                size : X11.Int)
               return X11.Int;

    function fl_get_string_height(
                style  : FL_TEXT_STYLE;
                size   : X11.Int;
                str    : X11.Strings.const_charp;
                len    : X11.Int;
                ascend : access X11.Int;
                descend: access X11.Int)
               return X11.Int;

    pragma Import(C, fl_get_string_height, "fl_get_string_height");

    function fl_get_string_width(
                style: FL_TEXT_STYLE;
                size : X11.Int;
                str  : X11.Strings.const_charp;
                len  : X11.Int)
               return X11.Int;

    pragma Import(C, fl_get_string_width, "fl_get_string_width");

    function fl_get_string_widthTAB(
                style: FL_TEXT_STYLE;
                size : X11.Int;
                str  : X11.Strings.const_charp;
                len  : X11.Int)
               return X11.Int;

    pragma Import(C, fl_get_string_widthTAB, "fl_get_string_widthTAB");

    procedure fl_get_string_dimension(
                p1: X11.Int;
                p2: X11.Int;
                p3: X11.Strings.const_charp;
                p4: X11.Int;
                p5: access X11.Int;
                p6: access X11.Int);

    pragma Import(C, fl_get_string_dimension, "fl_get_string_dimension");

    procedure fl_get_align_xy(
                p1 : X11.Int;
                p2 : X11.Int;
                p3 : X11.Int;
                p4 : X11.Int;
                p5 : X11.Int;
                p6 : X11.Int;
                p7 : X11.Int;
                p8 : X11.Int;
                p9 : X11.Int;
                p10: access X11.Int;
                p11: access X11.Int);

    procedure fl_drw_text(
                align: FL_ALIGN;
                x    : FL_Coord;
                y    : FL_Coord;
                w    : FL_Coord;
                h    : FL_Coord;
                c    : FL_COLOR;
                size : X11.Int;
                style: FL_TEXT_STYLE;
                str  : X11.Strings.charp);

    pragma Import(C, 
    fl_drw_text, "fl_drw_text");


    procedure fl_drw_text_beside(
                align: FL_ALIGN;
                x    : FL_Coord;
                y    : FL_Coord;
                w    : FL_Coord;
                h    : FL_Coord;
                c    : FL_COLOR;
                size : X11.Int;
                style: FL_TEXT_STYLE;
                str  : X11.Strings.charp);

    pragma Import(C, fl_drw_text_beside, "fl_drw_text_beside");


    procedure fl_drw_text_cursor(
                align: FL_ALIGN;
                x    : FL_Coord;
                y    : FL_Coord;
                w    : FL_Coord;
                h    : FL_Coord;
                c    : X11.Int;
                size : X11.Int;
                style: FL_TEXT_STYLE;
                str  : X11.Strings.charp;
                cc   : X11.Int;
                pos  : X11.Int);

    pragma Import(C, fl_drw_text_cursor, "fl_drw_text_cursor");


    procedure fl_drw_box(
                style: FL_BOX_TYPE;
                x    : FL_Coord;
                y    : FL_Coord;
                w    : FL_Coord;
                h    : FL_Coord;
                col  : FL_COLOR;
                bw   : X11.Int);

    function fl_add_symbol(
                p1: X11.Strings.const_charp;
                p2: FL_DRAWPTR;
                p3: X11.Int)     
               return X11.Int;

    pragma Import(C, fl_add_symbol, "fl_add_symbol");

    function fl_draw_symbol(
                p1: X11.Strings.const_charp;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_COLOR)
               return X11.Int;

    pragma Import(C, fl_draw_symbol, "fl_draw_symbol");

    function fl_mapcolor(
                index: FL_COLOR;
                red  : X11.Int;
                green: X11.Int;
                blue : X11.Int)
               return X11.unsigned_long;
    
    procedure fl_drw_slider(
                p1:  X11.Int;
                p2:  FL_Coord;
                p3:  FL_Coord;
                p4:  FL_Coord;
                p5:  FL_Coord;
                p6:  FL_COLOR;
                p7:  FL_COLOR;
                p8:  X11.Int;
                p9:  Interfaces.C.Double;
                p10: Interfaces.C.Double;
                p11: X11.Strings.const_charp;
                p12: X11.Int;
                p13: X11.Int;
                p14: X11.Int );
                            
    
    function fl_mapcolorname(
                p1: FL_COLOR;
                p2: X11.Strings.const_charp)
               return X11.long;

    pragma Import(C, fl_mapcolorname, "fl_mapcolorname");

    function fl_getmcolor(
                index: FL_COLOR;
                red  : access X11.Int;
                green: access X11.Int;
                blue : access X11.Int)
               return X11.unsigned_long;

    procedure fl_free_colors(
                p1: access FL_COLOR;
                p2: X11.Int);

    procedure fl_free_pixels(
                p1: access X11.unsigned_long;
                p2: X11.Int);

    procedure fl_set_color_leak(
                p1: X11.Int);

    function fl_get_pixel(
                p1: FL_COLOR)
               return X11.unsigned_Long;

    procedure fl_get_icm_color(
                index: FL_COLOR;
                r    : access X11.Int;
                g    : access X11.Int;
                b    : access X11.Int);

    procedure fl_set_icm_color(
                index: FL_COLOR;
                r    : X11.Int;
                g    : X11.Int;
                b    : X11.Int);

    procedure fl_color_c0(
                p1: FL_COLOR);

    procedure fl_bk_color(
                index: FL_COLOR);

    procedure fl_textcolor(
                p1: FL_COLOR);

    procedure fl_bk_textcolor(
                p1: FL_COLOR);

    procedure fl_set_gamma(
                p1: Interfaces.C.Double;
                p2: Interfaces.C.Double;
                p3: Interfaces.C.Double);

    procedure fl_show_errors(
                p1: X11.Int);

    procedure fl_add_object(
                p1: access FL_FORM;
                p2: access FL_OBJECT);

    procedure fl_addto_form(
                p1: access FL_FORM);

    function fl_make_object(
                p1: X11.Int;
                p2: X11.Int;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_Coord;
                p7: X11.Strings.const_charp;
                p8: FL_HANDLEPTR)
               return FL_OBJECT_access;

    pragma Import(C, fl_make_object, "fl_make_object");


    procedure fl_set_coordunit(
                p1: X11.Int);

    function fl_get_coordunit return X11.Int;

    procedure fl_set_border_width(
                p1: X11.Int);

    function fl_get_border_width return X11.Int;

    procedure fl_flip_yorigin;

    function fl_mode_capable(
                p1: X11.Int;
                p2: X11.Int)
               return X11.Int;

    procedure fl_rectangle(
                p1: X11.Int := 0;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_COLOR);

    procedure fl_rectbound(
                p1: FL_Coord;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_COLOR);

    procedure fl_roundrectangle(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_COLOR);

    procedure fl_polygon(
                p1: X11.Int;
                p2: access FL_POINT;
                n : X11.Int;
                p4: FL_COLOR);

    procedure fl_lines(
                p1: access FL_POINT;
                n : X11.Int;
                p3: FL_COLOR);

    procedure fl_line(
                x  : FL_Coord;
                y  : FL_Coord;
                w  : FL_Coord;
                h  : FL_Coord;
                col: FL_COLOR);

    procedure fl_dashedlinestyle(
                p1: X11.Strings.const_charp;
                p2: X11.Int);

    pragma Import(C, fl_dashedlinestyle, "fl_dashedlinestyle");

    procedure fl_drawmode(
                p1: X11.Int);
    procedure fl_set_drawmode(
                p1: X11.Int) renames fl_drawmode;
    
    function fl_get_linewidth return X11.Int;
    function fl_get_linestyle return X11.Int;
    function fl_get_drawmode  return X11.Int;
    
    
    
    procedure fl_linewidth(
                lw: X11.Int);
    procedure fl_set_linewidth(
                lw: X11.Int) renames fl_linewidth;

    procedure fl_linestyle(
                style: X.Unsigned_Int);    -- from type in xgcvalues
    procedure fl_set_linestyle(
                style: X.Unsigned_Int) renames fl_linestyle;

    procedure fl_oval(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_COLOR);

    procedure fl_ovalbound(
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR);

    procedure fl_ovalarc(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Int;
                p7: X11.Int;
                c: FL_COLOR);

    procedure fl_pieslice(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Int;
                p7: X11.Int;
                p8: FL_COLOR);

    procedure fl_add_vertex(
                p1: FL_Coord;
                p2: FL_Coord);

    procedure fl_add_float_vertex(
                p1: interfaces.c.c_float;
                p2: interfaces.c.c_float);

    procedure fl_reset_vertex;

    procedure fl_endline;

    procedure fl_endpolygon;

    procedure fl_endclosedline;

    procedure fl_drw_frame(
                style: FL_BOX_TYPE;
                x    : FL_Coord;     
                y    : FL_Coord;
                w    : FL_Coord;
                h    : FL_Coord;
                col  : FL_COLOR;
                bw   : X11.Int);

    procedure fl_drw_checkbox(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_COLOR;
                p7: X11.Int);

    function fl_get_fontstruct(
                style: FL_TEXT_STYLE;
                size : X11.Int)
               return X11.Xlib.XFontStruct_access;

    function fl_get_mouse(
                x      : access FL_Coord;
                y      : access FL_Coord;
                keymask: access X11.unsigned_int)
               return X11.Window;

    procedure fl_set_mouse(
                x: FL_Coord;
                y: FL_Coord);

    function fl_get_win_mouse(
                win    : X11.Window;
                x      : access FL_Coord;
                y      : access FL_Coord;
                keymask: access X11.unsigned_int)
               return X11.Window;

    function fl_get_form_mouse(
                form   : access FL_FORM;
                x      : access FL_Coord;
                y      : access FL_Coord;
                keymask: access X11.unsigned_int)
               return X11.Window;

    function fl_win_to_form(
                win: X11.Window)
               return FL_FORM_access;

    procedure fl_set_form_icon(
                p1: access FL_FORM;
                p2: X11.Pixmap;
                p3: X11.Pixmap);
    
    procedure Fl_Raise_Form (F: FL_FORM_Access );
    pragma Inline( Fl_Raise_Form );
    
    procedure Fl_Lower_Form (F: FL_FORM_Access );
    pragma Inline( Fl_Lower_Form );
    
    function fl_wincreate(
                p1: X11.Strings.const_charp)
               return X11.Window;

    pragma Import(C, fl_wincreate, "fl_wincreate");

    function fl_winshow(
                p1: X11.Window)
               return X11.Window;

    function fl_winopen(
                name: X11.Strings.const_charp)
               return X11.Window;

    pragma Import(C, fl_winopen, "fl_winopen");

    procedure fl_winhide(
                win: X11.Window);

    procedure fl_winclose(
                win: X11.Window);

    procedure fl_winset(
                win: X11.Window);

    function fl_winget return X11.Window;

    procedure fl_winresize(
                p1: X11.Window;
                p2: FL_Coord;
                p3: FL_Coord);

    procedure fl_winmove(
                p1: X11.Window;
                p2: FL_Coord;
                p3: FL_Coord);

    procedure fl_winreshape(
                p1: X11.Window;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord);

    procedure fl_winicon(
                p1: X11.Window;
                p2: X11.Pixmap;
                p3: X11.Pixmap);

    procedure fl_winbackground(
                win  : X11.Window;
                color: X11.unsigned_long);

    procedure fl_winstepunit(
                p1: X11.Window;
                p2: FL_Coord;
                p3: FL_Coord);

    function fl_winisvalid(
                p1: X11.Window)
               return X11.Int;

    procedure fl_wintitle(
                p1: X11.Window;
                p2: X11.Strings.const_charp);

    pragma Import(C, fl_wintitle, "fl_wintitle");

    procedure fl_winposition(
                x: FL_Coord;
                y: FL_Coord);

    procedure fl_winminsize(
                window: X11.Window;
                minw  : FL_Coord;
                minh  : FL_Coord);

    procedure fl_winmaxsize(
                window: X11.Window;
                maxw  : FL_Coord;
                maxh  : FL_Coord);

    procedure fl_winaspect(
                p1: X11.Window;
                p2: FL_Coord;
                p3: FL_Coord);

    procedure fl_reset_winconstraints(
                win: X11.Window);

    procedure fl_winsize(
                w: FL_Coord;
                h: FL_Coord);

    procedure fl_initial_winsize(
                w: FL_Coord;
                h: FL_Coord);

    procedure fl_initial_winstate(
                p1: X11.Int);

    function fl_create_colormap(
                xvinfo: access X11.Xutil.XVisualInfo;
                fill  : Boolean)
               return X11.Colormap;

    procedure fl_wingeometry(
                p1: FL_Coord;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord);

    procedure fl_initial_wingeometry(
                p1: FL_Coord;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord);

    procedure fl_noborder_c0;

    procedure fl_transient_c0;

    procedure fl_get_winsize(
                win: X11.Window;
                w  : access FL_Coord;
                h  : access FL_Coord);

    procedure fl_get_winorigin(
                win: X11.Window;
                x  : access FL_Coord;
                y  : access FL_Coord);

    procedure fl_get_wingeometry(
                win: X11.Window;
                x  : access FL_Coord;
                y  : access FL_Coord;
                w  : access FL_Coord;
                h  : access FL_Coord);

    function fl_XNextEvent(
                xev: access X11.Xlib.XEvent)
               return X11.Int;

    function fl_XPeekEvent(
                xev: access X11.Xlib.XEvent)
               return X11.Int;

    function fl_XEventsQueued(
                mode: X11.Int)
               return X11.Int;

    procedure fl_XPutBackEvent(
                xev: access X11.Xlib.XEvent);

    function fl_last_event return XEvent_const_access;

    function fl_set_event_callback(
                callback : FL_APPEVENT_CB;
                user_data: System.Address)
               return FL_APPEVENT_CB;

    function fl_set_idle_callback(
                callback : FL_APPEVENT_CB;
                user_data: System.Address)
               return FL_APPEVENT_CB;

    function fl_addto_selected_xevent(
                p1: X11.Window;
                p2: X11.long)
               return X11.long;

    function fl_remove_selected_xevent(
                p1: X11.Window;
                p2: X11.long)
               return X11.long;

    function fl_add_event_callback(
                win        : X11.Window;
                xevent_type: X11.Int;
                callback   : FL_APPEVENT_CB;
                user_data  : System.Address)
               return FL_APPEVENT_CB;

    procedure fl_remove_event_callback(
                win        : X11.Window;
                xevent_type: X11.Int);

    procedure fl_activate_event_callbacks(
                win: X11.Window);

    function fl_print_xevent_name(
                where: X11.Strings.const_charp;
                xev  : XEvent_const_access)
               return X11.Xlib.XEvent_access;

    pragma Import(C, fl_print_xevent_name, "fl_print_xevent_name");



    function fl_initialize(
                argc     : access X11.Strings.Natural_Int;  
                argv     : X11.Strings.charp_vector;
                appname  : X11.Strings.const_charp;
                app_opt  : X11.Xresource.XrmOptionDescList;
                n_app_opt: X11.Int)
               return X11.Xlib.XDisplay_Access;

    procedure fl_initialize(
                argc     : access X11.Strings.Natural_Int;  
                argv     : X11.Strings.charp_vector;
                appname  : X11.Strings.const_charp;
                app_opt  : X11.Xresource.XrmOptionDescList;
                n_app_opt: X11.Int);

    pragma Import(C, fl_initialize, "fl_initialize");


    procedure fl_finish;

    function fl_get_resource(
                p1: X11.Strings.const_charp;
                p2: X11.Strings.const_charp;
                p3: FL_RTYPE;
                p4: X11.Strings.const_charp;
                p5: System.Address;
                p6: X11.Int)
               return X11.Strings.const_charp;

    pragma Import(C, fl_get_resource, "fl_get_resource");

    procedure fl_set_resource(
                str: X11.Strings.const_charp;
                val: X11.Strings.const_charp);

    pragma Import(C, fl_set_resource, "fl_set_resource");

    procedure fl_get_app_resources(
                resources  : access FL_RESOURCE;
                n          : X11.Int);

    procedure fl_set_graphics_mode(
                p1: X11.Int;
                p2: X11.Int);

    procedure fl_set_visualID(
                p1: X11.long);

    function fl_keysym_pressed(
                p1: X11.Keysym)
               return X11.Int;

    procedure fl_set_defaults(
                mask  : X11.unsigned_long;
                flopts: access FL_IOPT);

    procedure fl_set_tabstop(
                s: X11.Strings.const_charp);

    pragma Import(C, fl_set_tabstop, "fl_set_tabstop");


    procedure fl_get_defaults(
                p1: access FL_IOPT);

    function fl_get_visual_depth return X11.Int;

    function fl_vclass_name(
                p1: X11.Int)
               return X11.Strings.const_charp;

    function fl_vclass_val(
                p1: X11.Strings.const_charp)
               return X11.Int;

    pragma Import(C, fl_vclass_val, "fl_vclass_val");


    procedure fl_set_ul_property(
                p1: X11.Int;
                p2: X11.Int);

    procedure fl_set_clipping(
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord);

    procedure fl_set_gc_clipping(
                p1: X11.Xlib.GC;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord);

    procedure fl_unset_gc_clipping(
                p1: X11.Xlib.GC);

    procedure fl_set_clippings(
                p1: access FL_RECT;
                p2: X11.Int);

    procedure fl_unset_clipping;

    function fl_create_bitmap(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_bitmap, "fl_create_bitmap");


    function fl_add_bitmap(
                bitmap_type: X11.Int;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_bitmap, "fl_add_bitmap");


    procedure fl_set_bitmap_data(
                ob     : access FL_OBJECT;
                width  : X11.Int;
                height : X11.Int;
                bits   : access X11.unsigned_char);

    procedure fl_set_bitmap_file(
                ob  : access FL_OBJECT;
                file: X11.Strings.const_charp);

    pragma Import(C, fl_set_bitmap_file, "fl_set_bitmap_file");


    function fl_read_bitmapfile(
                p1: X11.Window;
                p2: X11.Strings.const_charp;
                p3: access X11.unsigned_int;
                p4: access X11.unsigned_int;
                p5: access X11.Int;
                p6: access X11.Int)
               return X11.Pixmap;

    pragma Import(C, fl_read_bitmapfile, "fl_read_bitmapfile");


    function fl_create_pixmap(
                pixmap_type: X11.Int;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_pixmap, "fl_create_pixmap");


    function fl_add_pixmap(
                pixmap_type: X11.Int;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_pixmap, "fl_add_pixmap");


    procedure fl_set_pixmap_data(
                p1: access FL_OBJECT;
                p2: access X11.Strings.charp);

    procedure fl_set_pixmap_file(
                ob  : access FL_OBJECT;
                file: X11.Strings.const_charp);

    pragma Import(C, fl_set_pixmap_file, "fl_set_pixmap_file");


    procedure fl_set_pixmap_align(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: X11.Int;
                p4: X11.Int);

    procedure fl_set_pixmapbutton_align(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: X11.Int;
                p4: X11.Int) renames fl_set_pixmap_align;

    procedure fl_set_pixmap_pixmap(
                p1: access FL_OBJECT;
                p2: X11.Pixmap;
                p3: X11.Pixmap);

    procedure fl_set_pixmap_colorcloseness(
                p1: X11.Int;
                p2: X11.Int;
                p3: X11.Int);

    procedure fl_free_pixmap_pixmap(
                p1: access FL_OBJECT);

    function fl_get_pixmap_pixmap(
                p1: access FL_OBJECT;
                p2: access X11.Pixmap;
                p3: access X11.Pixmap)
               return X11.Pixmap;

    function fl_read_pixmapfile(
                p1: X11.Window;
                p2: X11.Strings.const_charp;
                p3: access X11.unsigned_int;
                p4: access X11.unsigned_int;
                p5: access X11.Pixmap;
                p6: access X11.Int;
                p7: access X11.Int;
                p8: FL_COLOR)
               return X11.Pixmap;

    pragma Import(C, fl_read_pixmapfile, "fl_read_pixmapfile");


    function fl_create_from_pixmapdata(
                p1: X11.Window;
                p2: access X11.Strings.charp;
                p3: access X11.unsigned_int;
                p4: access X11.unsigned_int;
                p5: access X11.Pixmap;
                p6: access X11.Int;
                p7: access X11.Int;
                p8: FL_COLOR)
               return X11.Pixmap;

    function fl_create_box(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_box, "fl_create_box");


    function fl_add_box(
                box_type: FL_BOX_TYPE;
                x       : FL_Coord;
                y       : FL_Coord;
                w       : FL_Coord;
                h       : FL_Coord;
                label   : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_box, "fl_add_box");


    function fl_create_browser(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_browser, "fl_create_browser");


    function fl_add_browser(
                browser_type: FL_BROWSER_TYPE;
                x           : FL_Coord;
                y           : FL_Coord;
                w           : FL_Coord;
                h           : FL_Coord;
                label       : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_browser, "fl_add_browser");


    procedure fl_clear_browser(
                obj: access FL_OBJECT);

    procedure fl_add_browser_line(
                obj : access FL_OBJECT;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_add_browser_line, "fl_add_browser_line");



    procedure fl_addto_browser(
                obj : access FL_OBJECT;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_addto_browser, "fl_addto_browser");

    procedure fl_addto_browser_chars(
                obj : access FL_OBJECT;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_addto_browser_chars, "fl_addto_browser_chars");

    procedure fl_append_browser(
                obj : access FL_OBJECT;
                text: X11.Strings.const_charp) renames fl_addto_browser_chars;

    procedure fl_insert_browser_line(
                obj : access FL_OBJECT;
                line: X11.Int;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_insert_browser_line, "fl_insert_browser_line");



    procedure fl_delete_browser_line(
                obj : access FL_OBJECT;
                line: X11.Int);

    procedure fl_replace_browser_line(
                obj : access FL_OBJECT;
                line: X11.Int;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_replace_browser_line, "fl_replace_browser_line");



    function fl_get_browser_line(
                obj : access FL_OBJECT;
                line: X11.Int)
               return X11.Strings.const_charp;

    function fl_load_browser(       
                obj     : access FL_OBJECT;
                filename: X11.Strings.const_charp)
               return X11.Int;

    pragma Import(C, fl_load_browser, "fl_load_browser");


    procedure fl_select_browser_line(
                obj : access FL_OBJECT;
                line: X11.Int);

    procedure fl_deselect_browser_line(
                obj : access FL_OBJECT;
                line: X11.Int);

    procedure fl_deselect_browser(
                obj: access FL_OBJECT);

    function fl_isselected_browser_line(
                obj : access FL_OBJECT;
                line: X11.Int)
               return X11.Int;

    function fl_get_browser_topline(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_get_browser(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_get_browser_maxline(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_get_browser_screenlines(
                obj: access FL_OBJECT)
               return X11.Int;

    procedure fl_set_browser_topline(
                obj : access FL_OBJECT;
                line: X11.Int);

    procedure fl_set_browser_fontsize(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_browser_fontstyle(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_browser_specialkey(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_browser_vscrollbar(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_browser_hscrollbar(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_browser_leftslider(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_browser_line_selectable(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: X11.Int);

    procedure fl_get_browser_dimension(
                p1: access FL_OBJECT;
                p2: access FL_Coord;
                p3: access FL_Coord;
                p4: access FL_Coord;
                p5: access FL_Coord);

    procedure fl_set_browser_dblclick_callback(
                p1: access FL_OBJECT;
                p2: FL_CALLBACKPTR;
                p3: X11.long);

    procedure fl_set_browser_xoffset(
                p1: access FL_OBJECT;
                p2: FL_Coord);

    procedure fl_set_browser_scrollbarsize(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: X11.Int);

    function fl_create_button(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_button, "fl_create_button");


    function fl_create_roundbutton(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_roundbutton, "fl_create_roundbutton");

    function fl_create_round3dbutton(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_round3dbutton, "fl_create_round3dbutton");



    function fl_create_lightbutton(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_lightbutton, "fl_create_lightbutton");



    function fl_create_checkbutton(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_checkbutton, "fl_create_checkbutton");



    function fl_create_bitmapbutton(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_bitmapbutton, "fl_create_bitmapbutton");



    function fl_create_pixmapbutton(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_pixmapbutton, "fl_create_pixmapbutton");



    function fl_add_roundbutton(
                button_type: FL_BUTTON_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_roundbutton, "fl_add_roundbutton");

    function fl_add_round3dbutton(
                button_type: FL_BUTTON_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_round3dbutton, "fl_add_round3dbutton");



    function fl_add_lightbutton(
                button_type: FL_BUTTON_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_lightbutton, "fl_add_lightbutton");


    function fl_add_checkbutton(
                button_type: FL_BUTTON_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_checkbutton, "fl_add_checkbutton");


    function fl_add_button(
                button_type: FL_BUTTON_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_button, "fl_add_button");


    function fl_add_bitmapbutton(
                button_type: FL_BUTTON_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_bitmapbutton, "fl_add_bitmapbutton");



    procedure fl_set_bitmapbutton_file(
                ob      : access FL_OBJECT;
                filename: X11.Strings.const_charp);

    pragma Import(C, fl_set_bitmapbutton_file, "fl_set_bitmapbutton_file");



    procedure fl_set_bitmapbutton_data(
                ob  : access FL_OBJECT;
                w   : X11.Int;
                h   : X11.Int;
                bits: access X11.unsigned_char);

    function fl_add_pixmapbutton(
                button_type: FL_BUTTON_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_pixmapbutton, "fl_add_pixmapbutton");



    function fl_get_button(
                obj: access FL_OBJECT)
               return Boolean;

    procedure fl_set_button(
                obj   : access FL_OBJECT;
                pushed: Boolean);

    function fl_get_button_numb(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_create_generic_button(
                p1: X11.Int;
                p2: X11.Int;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_Coord;
                p7: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_generic_button, "fl_create_generic_button");



    procedure fl_add_button_class(
                p1: X11.Int;
                p2: FL_DrawButton;
                p3: FL_CleanupButton);

    function fl_create_generic_canvas(
                p1: X11.Int;
                p2: X11.Int;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: FL_Coord;
                p7: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_generic_canvas, "fl_create_generic_canvas");



    function fl_add_canvas(
                canvas_type: FL_CANVAS_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_canvas, "fl_add_canvas");


    function fl_create_canvas(
                canvas_type: FL_CANVAS_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_canvas, "fl_create_canvas");


    function fl_create_mesacanvas(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_mesacanvas, "fl_create_mesacanvas");



    function fl_add_mesacanvas(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_mesacanvas, "fl_add_mesacanvas");


    procedure fl_set_canvas_decoration(
                ob        : access FL_OBJECT;
                frame_type: FL_DECORATION);

    procedure fl_set_canvas_colormap(
                ob : access FL_OBJECT;
                map: X11.Colormap);

    procedure fl_set_canvas_visual(
                ob: access FL_OBJECT;
                vi: access X11.Xlib.Visual);

    procedure fl_set_canvas_depth(
                ob   : access FL_OBJECT;
                depth: X11.Int);

    procedure fl_set_canvas_attributes(
                p1: access FL_OBJECT;
                p2: X11.unsigned_int;
                p3: access X11.Xlib.XSetWindowAttributes);

    function fl_add_canvas_handler(
                ob       : access FL_OBJECT;
                event    : X11.Int;
                handler  : FL_HANDLE_CANVAS;
                user_data: System.Address)
               return FL_HANDLE_CANVAS;

    function fl_get_canvas_id(
                ob: access FL_OBJECT)
               return X11.Window;

    function fl_get_canvas_colormap(
                ob: access FL_OBJECT)
               return X11.Colormap;

    function fl_get_canvas_depth(
                p1: access FL_OBJECT)
               return X11.Int;

    procedure fl_remove_canvas_handler(
                ob     : access FL_OBJECT;
                event  : X11.Int;
                handler: FL_HANDLE_CANVAS);

    procedure fl_hide_canvas(
                p1: access FL_OBJECT);

    procedure fl_canvas_yield_to_shortcut(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_modify_canvas_prop_c0(
                ob      : access FL_OBJECT;
                init    : FL_MODIFY_CANVAS_PROP;
                activate: FL_MODIFY_CANVAS_PROP;
                cleanup : FL_MODIFY_CANVAS_PROP);

    function fl_create_glcanvas(
                canvas_type: FL_CANVAS_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_glcanvas, "fl_create_glcanvas");


    function fl_add_glcanvas(
                canvas_type: FL_CANVAS_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_glcanvas, "fl_add_glcanvas");


    procedure fl_set_glcanvas_defaults(
                p1: int_const_access);

    procedure fl_get_glcanvas_defaults(
                p1: access X11.Int);

    procedure fl_set_glcanvas_attributes(
                p1: access FL_OBJECT;
                p2: int_const_access);

    procedure fl_get_glcanvas_attributes(
                p1: access FL_OBJECT;
                p2: access X11.Int);

    procedure fl_set_glcanvas_direct(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_activate_glcanvas(
                p1: access FL_OBJECT);

    function fl_get_glcanvas_xvisualinfo(
                p1: access FL_OBJECT)
               return X11.Xutil.XVisualInfo_access;

    function fl_create_chart(
                chart_type: FL_CHART_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_chart, "fl_create_chart");


    function fl_add_chart(
                chart_type: FL_CHART_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_chart, "fl_add_chart");


    procedure fl_clear_chart(
                obj: access FL_OBJECT);

    procedure fl_add_chart_value(
                obj : access FL_OBJECT;
                val : Interfaces.C.Double;
                text: X11.Strings.const_charp;
                col : X11.Int);

    pragma Import(C, fl_add_chart_value, "fl_add_chart_value");


    procedure fl_insert_chart_value(
                obj  : access FL_OBJECT;
                index: X11.Int;
                val  : Interfaces.C.Double;
                text : X11.Strings.const_charp;
                col  : X11.Int);

    pragma Import(C, fl_insert_chart_value, "fl_insert_chart_value");



    procedure fl_replace_chart_value(
                obj  : access FL_OBJECT;
                index: X11.Int;
                val  : Interfaces.C.Double;
                text : X11.Strings.const_charp;
                col  : X11.Int);

    pragma Import(C, fl_replace_chart_value, "fl_replace_chart_value");



    procedure fl_set_chart_bounds(
                obj: access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_set_chart_lstyle(
                obj    : access FL_OBJECT;
                Style  : X11.Int);
    
    procedure fl_set_chart_lsize(
                obj    : access FL_OBJECT;
                Size   : X11.Int);
    
    procedure fl_set_chart_lcolor(
                obj    : access FL_OBJECT;
                C      : FL_COLOR);
    
    procedure fl_set_chart_lcol(
                obj    : access FL_OBJECT;
                C      : FL_COLOR) renames fl_set_chart_lcolor;
    
    procedure fl_set_chart_maxnumb(
                obj    : access FL_OBJECT;
                maxnumb: X11.Int);

    procedure fl_set_chart_autosize(
                obj     : access FL_OBJECT;
                autosize: Boolean);

    function fl_create_choice(
                choice_type: FL_CHOICE_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_choice, "fl_create_choice");


    function fl_add_choice(
                choice_type: FL_CHOICE_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_choice, "fl_add_choice");


    procedure fl_clear_choice(
                obj: access FL_OBJECT);

    procedure fl_addto_choice(
                obj : access FL_OBJECT;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_addto_choice, "fl_addto_choice");


    procedure fl_replace_choice(
                obj : access FL_OBJECT;
                line: X11.Int;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_replace_choice, "fl_replace_choice");


    procedure fl_delete_choice(
                obj : access FL_OBJECT;
                line: X11.Int);

    procedure fl_set_choice(
                obj : access FL_OBJECT;
                line: X11.Int);

    procedure fl_set_choice_text(
                obj: access FL_OBJECT;
                txt: X11.Strings.const_charp);

    pragma Import(C, fl_set_choice_text, "fl_set_choice_text");


    function fl_get_choice(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_get_choice_item_text(
                p1: access FL_OBJECT;
                p2: X11.int)
               return X11.Strings.const_charp;

    function fl_get_choice_maxitems(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_get_choice_text(
                obj: access FL_OBJECT)
               return X11.Strings.const_charp;

    procedure fl_set_choice_fontsize(
                obj : access FL_OBJECT;
                size: X11.Int);

    procedure fl_set_choice_fontstyle(
                obj  : access FL_OBJECT;
                style: FL_TEXT_STYLE);

    procedure fl_set_choice_align(
                obj  : access FL_OBJECT;
                align: X11.Int);

    procedure fl_set_choice_item_mode(
                obj : access FL_OBJECT;
                numb: X11.Int;
                mode: FL_ITEM_MODE);

    procedure fl_set_choice_item_shortcut(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: X11.Strings.const_charp);

    pragma Import(C, fl_set_choice_item_shortcut, "fl_set_choice_item_shortcut");



    function fl_create_clock(
                clock_type: FL_CLOCK_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_clock, "fl_create_clock");

    function fl_add_clock(
                clock_type: FL_CLOCK_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_clock, "fl_add_clock");

    procedure fl_get_clock(
                obj: access FL_OBJECT;
                h  : access X11.Int;
                m  : access X11.Int;
                s  : access X11.Int);

    function fl_create_counter(
                counter_type: FL_COUNTER_TYPE;
                x           : FL_Coord;
                y           : FL_Coord;
                w           : FL_Coord;
                h           : FL_Coord;
                label       : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_counter, "fl_create_counter");

    function fl_add_counter(
                counter_type: FL_COUNTER_TYPE;
                x           : FL_Coord;
                y           : FL_Coord;
                w           : FL_Coord;
                h           : FL_Coord;
                label       : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_counter, "fl_add_counter");

    procedure fl_set_counter_value(
                obj: access FL_OBJECT;
                val: Interfaces.C.Double);

    procedure fl_set_counter_bounds(
                obj: access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_get_counter_bounds(
                obj: access FL_OBJECT;
                min: access Interfaces.C.Double;
                max: access Interfaces.C.Double);

    procedure fl_set_counter_step(
                obj  : access FL_OBJECT;
                small: Interfaces.C.Double;
                large: Interfaces.C.Double);

    procedure fl_set_counter_precision(
                obj : access FL_OBJECT;
                prec: X11.Int);

    function fl_get_counter_value(
                obj: access FL_OBJECT)
               return Interfaces.C.Double;

    procedure fl_set_counter_return(
                obj   : access FL_OBJECT;
                always: Boolean);

    type counter_filter_func_access is access function(
                p1: access FL_OBJECT;
                p2: Interfaces.C.Double;
                p3: X11.Int)
               return X11.Strings.const_charp;
    pragma Convention(C, counter_filter_func_access);


    procedure fl_set_counter_filter(
                p1: access FL_OBJECT;
                p2: counter_filter_func_access);

    procedure fl_set_cursor(
                p1: X11.Window;
                p2: X11.Int);

    procedure fl_set_cursor_color(
                p1: X11.Int;
                p2: FL_COLOR;
                p3: FL_COLOR);

    function fl_create_bitmap_cursor(
                p1: X11.Strings.const_charp;
                p2: X11.Strings.const_charp;
                p3: X11.Int;
                p4: X11.Int;
                p5: X11.Int;
                p6: X11.Int)
               return X11.Int;

    pragma Import(C, fl_create_bitmap_cursor, "fl_create_bitmap_cursor");

    procedure fl_reset_cursor( Win: X11.Window );
    pragma Inline( fl_reset_cursor );

    function fl_get_cursor_byname(
                p1: X11.Int)
               return X11.Cursor;

    function fl_create_dial(
                dial_type: FL_DIAL_TYPE;
                x        : FL_Coord;
                y        : FL_Coord;
                w        : FL_Coord;
                h        : FL_Coord;
                label    : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_dial, "fl_create_dial");


    function fl_add_dial(
                dial_type: FL_DIAL_TYPE;
                x        : FL_Coord;
                y        : FL_Coord;
                w        : FL_Coord;
                h        : FL_Coord;
                label    : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_dial, "fl_add_dial");


    procedure fl_set_dial_value(
                obj: access FL_OBJECT;
                val: Interfaces.C.Double);

    function fl_get_dial_value(
                val: access FL_OBJECT)
               return Interfaces.C.Double;

    procedure fl_set_dial_bounds(
                obj: access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_get_dial_bounds(
                obj: access FL_OBJECT;
                min: access Interfaces.C.Double;
                max: access Interfaces.C.Double);

    procedure fl_set_dial_step(
                obj : access FL_OBJECT;
                step: Interfaces.C.Double);

    procedure fl_set_dial_return(
                obj   : access FL_OBJECT;
                always: Boolean);

    procedure fl_set_dial_angles(
                obj: access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_set_dial_cross(
                p1: access FL_OBJECT;
                p2: X11.Int);

    procedure fl_set_dial_direction(
                p1: access FL_OBJECT;
                p2: FL_DIAL_DIRECTION);

    function fl_get_dirlist(
                p1: X11.Strings.const_charp;
                p2: X11.Strings.const_charp;
                p3: access X11.Int;
                p4: X11.Int)
               return FL_Dirlist_const_access;

    pragma Import(C, fl_get_dirlist, "fl_get_dirlist");


    function fl_set_dirlist_filter(
                p1: FL_DIRLIST_FILTER)
               return FL_DIRLIST_FILTER;
    
    procedure fl_set_dirlist_sort( kind: fl_dirlist_sort_kind );
    
    procedure fl_free_dirlist(
                p1: access FL_Dirlist);

    procedure fl_free_all_dirlist;

    function fl_is_valid_dir(
                p1: X11.Strings.const_charp)
               return X11.Int;

    pragma Import(C, fl_is_valid_dir, "fl_is_valid_dir");


    function fl_fmtime(
                p1: X11.Strings.const_charp)
               return X11.unsigned_long;

    pragma Import(C, fl_fmtime, "fl_fmtime");


    function fl_fix_dirname(
                p1: X11.Strings.charp)
               return X11.Strings.charp;

    pragma Import(C, fl_fix_dirname, "fl_fix_dirname");


    function fl_create_frame(
                frame_type: FL_BOX_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_frame, "fl_create_frame");


    function fl_add_frame(
                frame_type: FL_FRAME_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_frame, "fl_add_frame");

    function fl_create_labelframe(
                frame_type: FL_BOX_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_labelframe, "fl_create_labelframe");


    function fl_add_labelframe(
                frame_type: FL_FRAME_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_labelframe, "fl_add_labelframe");



    function fl_create_free(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp;
                p7: FL_HANDLEPTR)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_free, "fl_create_free");


    function fl_add_free(
                p1: X11.Int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp;
                p7: FL_HANDLEPTR)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_free, "fl_add_free");


    procedure fl_set_goodies_font(
                style: FL_TEXT_STYLE;
                size : X11.Int);

    procedure fl_show_message(
                s1: X11.Strings.const_charp;
                s2: X11.Strings.const_charp;
                s3: X11.Strings.const_charp);

    pragma Import(C, fl_show_message, "fl_show_message");

    procedure fl_show_messages(
                s1: X11.Strings.const_charp);

    pragma Import(C, fl_show_messages, "fl_show_messages");

    procedure fl_show_question(
                s1: X11.Strings.Const_Charp;
                p2: X11.int);

    pragma Import(C, fl_show_question, "fl_show_question");


    procedure fl_show_alert(
                s1: X11.Strings.const_charp;
                s2: X11.Strings.const_charp;
                s3: X11.Strings.const_charp;
                c : Boolean);

    pragma Import(C, fl_show_alert, "fl_show_alert");


    function fl_show_input(
                str1  : X11.Strings.const_charp;
                defstr: X11.Strings.const_charp)
               return X11.Strings.const_charp;

    pragma Import(C, fl_show_input, "fl_show_input");

    function fl_show_simple_input(
                str1  : X11.Strings.const_charp;
                defstr: X11.Strings.const_charp)
               return X11.Strings.const_charp;

    pragma Import(C, fl_show_simple_input, "fl_show_simple_input");



    function fl_show_colormap(
                oldcol: X11.Int)
               return X11.Int;

    function fl_show_choice(
                s1  : X11.Strings.const_charp;
                s2  : X11.Strings.const_charp;
                s3  : X11.Strings.const_charp;
                numb: X11.Int;
                b1  : X11.Strings.const_charp;
                b2  : X11.Strings.const_charp;
                b3  : X11.Strings.const_charp;
                p8  : X11.Int )
               return X11.Int;

    pragma Import(C, fl_show_choice, "fl_show_choice");

    function fl_show_choices(
                s1  : X11.Strings.const_charp;
                numb: X11.Int;
                b1  : X11.Strings.const_charp;
                b2  : X11.Strings.const_charp;
                b3  : X11.Strings.const_charp;
                p6  : X11.Int )
               return X11.Int;

    pragma Import(C, fl_show_choices, "fl_show_choices");


    procedure fl_set_choice_shortcut(
                s1: X11.Strings.const_charp;
                s2: X11.Strings.const_charp;
                s3: X11.Strings.const_charp);

    pragma Import(C, fl_set_choice_shortcut, "fl_set_choice_shortcut");

    procedure fl_set_choices_shortcut(
                s1: X11.Strings.const_charp;
                s2: X11.Strings.const_charp;
                s3: X11.Strings.const_charp) renames fl_set_choice_shortcut;


    procedure fl_show_oneliner(
                p1: X11.Strings.const_charp;
                p2: FL_Coord;
                p3: FL_Coord);

    pragma Import(C, fl_show_oneliner, "fl_show_oneliner");


    procedure fl_hide_oneliner;

    procedure fl_set_oneliner_font(
                p1: X11.Int;
                p2: X11.Int);

    procedure fl_set_oneliner_color(
                p1: FL_COLOR;
                p2: FL_COLOR);
    
    function fl_exe_command(
                P1: X11.Strings.const_charp;
                P2: X11.Int ) return X11.Long;
    
    function fl_open_command(
                P1: X11.Strings.const_charp;
                P2: X11.Int ) return X11.Long renames fl_exe_command;
    
    function fl_end_command(
                P1: X11.Int ) return X11.Int;
    
    function fl_close_command(
                P1: X11.Int ) return X11.Int renames fl_end_command;
    
    function fl_end_all_command return X11.Int;
    
    procedure fl_show_command_log (P1: X11.Int );
    
    procedure fl_hide_command_log;
    
    procedure fl_clear_command_log;
    
    procedure fl_addto_command_log( P1: X11.Strings.Const_Charp );
    
    procedure fl_set_command_log_position( P1, p2: X11.int );
    
    function fl_get_command_log_fdstruct return FD_CMDLOG_Access;
    
    function fl_use_fselector(
                p1: X11.Int)
               return X11.Int;

    function fl_show_fselector(
                message  : X11.Strings.const_charp;
                directory: X11.Strings.const_charp;
                pattern  : X11.Strings.const_charp;
                default  : X11.Strings.const_charp)
               return X11.Strings.const_charp;

    pragma Import(C, fl_show_fselector, "fl_show_fselector");

    procedure fl_set_fselector_placement(
                place: FL_PLACE);

    procedure fl_set_fselector_fontsize(
                Size: X11.int);

    procedure fl_set_fselector_fontstyle(
                Style: FL_TEXT_STYLE);

    procedure fl_set_fselector_border(
                p1: FL_DECORATION);

    type p1_func_access is access function(
                p1: X11.Strings.const_charp;
                p2: System.Address)
               return X11.Int;
    pragma Convention(C, p1_func_access);


    procedure fl_set_fselector_callback(
                callback: p1_func_access;
                p2: System.Address);

    function fl_get_directory return X11.Strings.const_charp;

    function fl_get_pattern return X11.Strings.const_charp;

    function fl_set_directory(
                p1: X11.Strings.const_charp)
               return X11.int;

    pragma Import(C, fl_set_directory, "fl_set_directory");

    procedure fl_set_pattern(
                p1: X11.Strings.const_charp);

    pragma Import(C, fl_set_pattern, "fl_set_pattern");

    function fl_get_filename return X11.Strings.const_charp;

    procedure fl_refresh_fselector;

    type p2_proc_access is access procedure(
                p1: System.Address);
    pragma Convention(C, p2_proc_access);


    procedure fl_add_fselector_appbutton(
                label   : X11.Strings.const_charp;
                callback: p2_proc_access;
                p3: System.Address);

    pragma Import(C, fl_add_fselector_appbutton, "fl_add_fselector_appbutton");



    procedure fl_remove_fselector_appbutton(
                label: X11.Strings.const_charp);

    pragma Import(C, fl_remove_fselector_appbutton, "fl_remove_fselector_appbutton");



    procedure fl_disable_fselector_cache(
                yes: Boolean);

    procedure fl_invalidate_fselector_cache;

    function fl_get_fselector_form return FL_FORM_access;

    function fl_get_fselector_fdstruct return FD_FSELECTOR_access;

    procedure fl_hide_fselector;

    procedure fl_set_fselector_filetype_marker(
                dir : X11.int;
                fifo: X11.int;
                sock: X11.int;
                cdev: X11.int;
                bdev: X11.int);

    function fl_create_input(
                input_type: FL_INPUT_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_input, "fl_create_input");


    function fl_add_input(
                input_type: FL_INPUT_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_input, "fl_add_input");


    procedure fl_set_input(
                obj: access FL_OBJECT;
                str: X11.Strings.const_charp);

    pragma Import(C, fl_set_input, "fl_set_input");


    procedure fl_set_input_color(
                obj : access FL_OBJECT;
                tcol: X11.Int;
                ccol: X11.Int);

    function fl_get_input(
                obj: access FL_OBJECT)
               return X11.Strings.const_charp;

    procedure fl_set_input_return(
                obj       : access FL_OBJECT;
                how_return: FL_RETURN_TYPE);

    procedure fl_set_input_scroll(
                obj : access FL_OBJECT;
                flag: Boolean);

    procedure fl_set_input_cursorpos(
                ob : access FL_OBJECT;
                pos: X11.Int;
                p3: X11.Int);

    function fl_get_input_cursorpos(
                p1: access FL_OBJECT;
                p2: access X11.Int;
                p3: access X11.Int)
               return X11.Int;

    procedure fl_set_input_selected(
                ob  : access FL_OBJECT;
                flag: Boolean);

    procedure fl_set_input_selected_range(
                ob       : access FL_OBJECT;
                the_start: X11.Int;
                the_end  : X11.Int);

    procedure fl_set_input_maxchars(
                p1: access FL_OBJECT;
                p2: X11.Int);
    
    procedure fl_set_input_format(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: X11.Int);
    
    procedure fl_set_input_hscrollbar(
                p1: access FL_OBJECT;
                p2: X11.Int);
    
    procedure fl_set_input_vscrollbar(
                p1: access FL_OBJECT;
                p2: X11.Int);
    
    procedure fl_set_input_xoffset(
                p1: access FL_OBJECT;
                p2: X11.Int);
    
    procedure fl_set_input_topline(
                p1: access FL_OBJECT;
                p2: X11.Int);
    
    procedure fl_set_input_scrollbarsize(
                p1: access FL_OBJECT;
                p2: X11.Int;
                p3: X11.Int);
    
    function fl_get_input_topline(p1: access FL_OBJECT) return X11.Int;
    
    function fl_get_input_screenlines(p1: access FL_OBJECT) return X11.Int;
    
    function fl_get_input_numberoflines(p1: access FL_OBJECT) return X11.Int;
    
    procedure fl_get_input_format(p1: access FL_OBJECT; 
                                  P2: access X11.int;  
                                  P3: access X11.int);  
    
    function fl_set_input_filter(
                p1: access FL_OBJECT;
                p2: FL_INPUTVALIDATOR)
               return FL_INPUTVALIDATOR;
    
    procedure fl_set_input_editkeymap( P1: FL_EditKeymap_Const_Access );
                                        
    pragma Import(C, fl_set_input_editkeymap, "fl_set_input_editkeymap");
    
    function fl_create_menu(
                menu_type: FL_MENU_TYPE;
                x        : FL_Coord;
                y        : FL_Coord;
                w        : FL_Coord;
                h        : FL_Coord;
                label    : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_menu, "fl_create_menu");


    function fl_add_menu(
                menu_type: FL_MENU_TYPE;
                x        : FL_Coord;
                y        : FL_Coord;
                w        : FL_Coord;
                h        : FL_Coord;
                label    : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_menu, "fl_add_menu");


    procedure fl_clear_menu(
                obj: access FL_OBJECT);

    procedure fl_set_menu(
                obj    : access FL_OBJECT;
                menustr: X11.Strings.const_charp);

    pragma Import(C, fl_set_menu, "fl_set_menu");


    procedure fl_addto_menu(
                obj    : access FL_OBJECT;
                menustr: X11.Strings.const_charp);

    pragma Import(C, fl_addto_menu, "fl_addto_menu");


    procedure fl_replace_menu_item(
                obj    : access FL_OBJECT;
                numb   : X11.Int;
                menustr: X11.Strings.const_charp);

    pragma Import(C, fl_replace_menu_item, "fl_replace_menu_item");



    procedure fl_delete_menu_item(
                obj : access FL_OBJECT;
                numb: X11.Int);

    procedure fl_set_menu_item_shortcut(
                obj : access FL_OBJECT;
                numb: X11.Int;
                str : X11.Strings.const_charp);

    pragma Import(C, fl_set_menu_item_shortcut, "fl_set_menu_item_shortcut");



    procedure fl_set_menu_item_mode(
                obj : access FL_OBJECT;
                numb: X11.Int;
                mode: FL_ITEM_MODE);

    procedure fl_show_menu_symbol(
                obj : access FL_OBJECT;
                show: Boolean);

    procedure fl_set_menu_popup(
                p1: access FL_OBJECT;
                p2: X11.Int);

    function fl_get_menu(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_get_menu_item_text(
                p1: access FL_OBJECT;
                p2: X11.int)
               return X11.Strings.const_charp;

    function fl_get_menu_maxitems(
                obj: access FL_OBJECT)
               return X11.Int;

    function fl_get_menu_item_mode(
                p1: access FL_OBJECT;
                p2: X11.Int)
               return X11.unsigned_int;

    function fl_get_menu_text(
                obj: access FL_OBJECT)
               return X11.Strings.const_charp;

    function fl_newpup(
                parent: X11.Window)
               return X11.Window;

    function fl_defpup(
                parent: X11.Window;
                str   : X11.Strings.const_charp;
                Args  : Stdarg.ArgList := Stdarg.Empty)
               return X11.Window;

    pragma Import(C, fl_defpup, "fl_defpup");


    function fl_addtopup(
                menuID: X11.Window;
                str   : X11.Strings.const_charp;
                Args  : Stdarg.ArgList := Stdarg.Empty)
               return X11.Int;

    pragma Import(C, fl_addtopup, "fl_addtopup");


    function fl_setpup_mode(
                menuID  : X11.Window;
                item_num: X11.Int;
                mode    : FL_ITEM_MODE)
               return X11.Int;

    procedure fl_freepup(
                menuID: X11.Window);

    function fl_dopup(
                menuID: X11.Window)
               return X11.Int;

    procedure fl_setpup_shortcut(
                p1: X11.Int;
                p2: X11.Int;
                p3: X11.Strings.const_charp);

    pragma Import(C, fl_setpup_shortcut, "fl_setpup_shortcut");


    procedure fl_setpup_position(
                x: X11.Int;
                y: X11.Int);

    procedure fl_setpup_selection(
                menuID  : X11.Window;
                item_val: X11.Int);

    procedure fl_setpup_fontsize(
                size: X11.Int);

    procedure fl_setpup_fontstyle(
                style: FL_TEXT_STYLE);

    procedure fl_setpup_shadow(
                menuID: X11.Window;
                yes   : Boolean);

    procedure fl_setpup_softedge(
                menuID: X11.Window;
                yes   : Boolean);

    procedure fl_setpup_color(
                bkcolor  : FL_COLOR;
                textcolor: FL_COLOR);

    procedure fl_setpup_checkcolor(
                p1: FL_COLOR);

    procedure fl_setpup_title(
                p1: X11.Int;
                p2: X11.Strings.const_charp);

    pragma Import(C, fl_setpup_title, "fl_setpup_title");


    procedure fl_setpup_bw(
                p1: X11.Int;
                p2: X11.Int);

    procedure fl_setpup_pad(
                p1: X11.Int;
                p2: X11.Int;
                p3: X11.Int);

    function fl_setpup_cursor(
                p1: X11.Int;
                p2: X11.Int)
               return X11.Cursor;

    function fl_setpup_default_cursor(
                p1: X11.Int)
               return X11.Cursor;

    function fl_setpup_maxpup(
                p1: X11.Int)
               return X11.Int;

    function fl_getpup_mode(
                p1: X11.Int;
                p2: X11.Int)
               return X11.unsigned_int;

    function fl_getpup_text(
                p1: X11.Int;
                p2: X11.Int)
               return X11.Strings.const_charp;

    procedure fl_showpup(
                p1: X11.Int);

    procedure fl_hidepup(
                p1: X11.Int);

    function fl_setpup_itemcb(
                menuID  : X11.Window;
                item_val: X11.Int;
                cb      : FL_PUP_CB)
               return FL_PUP_CB;

    function fl_setpup_menucb(
                menuID: X11.Window;
                cb    : FL_PUP_CB)
               return FL_PUP_CB;

    procedure fl_setpup_submenu(
                menuID   : X11.Window;
                item_val : X11.Int;
                submenuID: X11.Window);

    function fl_create_positioner(
                positioner_type: X11.Int;
                x              : FL_Coord;
                y              : FL_Coord;
                w              : FL_Coord;
                h              : FL_Coord;
                label          : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_positioner, "fl_create_positioner");



    function fl_add_positioner(
                positioner_type: X11.Int;
                x              : FL_Coord;
                y              : FL_Coord;
                w              : FL_Coord;
                h              : FL_Coord;
                label          : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_positioner, "fl_add_positioner");


    procedure fl_set_positioner_xvalue(
                obj: access FL_OBJECT;
                val: Interfaces.C.Double);

    function fl_get_positioner_xvalue(
                obj: access FL_OBJECT)
               return Interfaces.C.Double;

    procedure fl_set_positioner_xbounds(
                obj: access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_get_positioner_xbounds(
                obj: access FL_OBJECT;
                min: access Interfaces.C.Double;
                max: access Interfaces.C.Double);

    procedure fl_set_positioner_yvalue(
                obj: access FL_OBJECT;
                val: Interfaces.C.Double);

    function fl_get_positioner_yvalue(
                obj: access FL_OBJECT)
               return Interfaces.C.Double;

    procedure fl_set_positioner_ybounds(
                obj: access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_get_positioner_ybounds(
                obj: access FL_OBJECT;
                min: access Interfaces.C.Double;
                max: access Interfaces.C.Double);

    procedure fl_set_positioner_xstep(
                obj : access FL_OBJECT;
                step: Interfaces.C.Double);

    procedure fl_set_positioner_ystep(
                obj : access FL_OBJECT;
                step: Interfaces.C.Double);

    procedure fl_set_positioner_return(
                obj   : access FL_OBJECT;
                always: Boolean);

    function fl_create_slider(
                slider_type: FL_SLIDER_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_slider, "fl_create_slider");


    function fl_add_slider(
                slider_type: FL_SLIDER_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_slider, "fl_add_slider");


    function fl_create_valslider(
                slider_type: FL_SLIDER_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_valslider, "fl_create_valslider");



    function fl_add_valslider(
                slider_type: FL_SLIDER_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_valslider, "fl_add_valslider");


    procedure fl_set_slider_value(
                obj: access FL_OBJECT;
                val: Interfaces.C.Double);

    function fl_get_slider_value(
                p1: access FL_OBJECT)
               return Interfaces.C.Double;

    procedure fl_set_slider_bounds(
                obj: access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_get_slider_bounds(
                obj: access FL_OBJECT;
                min: access Interfaces.C.Double;
                max: access Interfaces.C.Double);

    procedure fl_set_slider_return(
                obj   : access FL_OBJECT;
                always: FL_RETURN_TYPE);

    procedure fl_set_slider_step(
                obj : access FL_OBJECT;
                step: Interfaces.C.Double);

    procedure fl_set_slider_increment(
                obj : access FL_OBJECT;
                P2  : Interfaces.C.Double;
                P3  : Interfaces.C.Double);

    procedure fl_set_slider_size(
                p1: access FL_OBJECT;
                p2: Interfaces.C.double);                  -- forms.h:2629
    
    procedure fl_set_slider_precision(
                obj : access FL_OBJECT;
                prec: X11.Int);

    type slider_filter_func_access is access function(
                p1: access FL_OBJECT;
                p2: Interfaces.C.Double;
                p3: X11.Int)
               return X11.Strings.const_charp;
    pragma Convention(C, slider_filter_func_access);


    procedure fl_set_slider_filter(
                p1: access FL_OBJECT;
                p2: slider_filter_func_access);

    function fl_create_text(
                text_type: FL_TEXT_TYPE;
                x        : FL_Coord;
                y        : FL_Coord;
                w        : FL_Coord;
                h        : FL_Coord;
                label    : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_text, "fl_create_text");


    function fl_add_text(
                text_type: FL_TEXT_TYPE;
                x        : FL_Coord;
                y        : FL_Coord;
                w        : FL_Coord;
                h        : FL_Coord;
                label    : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_text, "fl_add_text");

    function fl_create_textbox(
                p1: X11.int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;                         -- forms.h:2695
    pragma Import(C, fl_create_textbox, "fl_create_textbox");   -- forms.h:2695

    function fl_add_textbox(
                p1: X11.int;
                p2: FL_Coord;
                p3: FL_Coord;
                p4: FL_Coord;
                p5: FL_Coord;
                p6: X11.Strings.const_charp)
               return FL_OBJECT_access;                         -- forms.h:2697
    pragma Import(C, fl_add_textbox, "fl_add_textbox");         -- forms.h:2697

    procedure fl_clear_textbox(
                p1: access FL_OBJECT);                          -- forms.h:2699

    procedure fl_set_textbox_topline(
                p1: access FL_OBJECT;
                p2: X11.int);                                   -- forms.h:2700

    procedure fl_set_textbox_xoffset(
                p1: access FL_OBJECT;
                p2: FL_Coord);                                  -- forms.h:2701

    function fl_get_textbox_longestline(
                p1: access FL_OBJECT)
               return X11.int;                                  -- forms.h:2702

    function fl_create_timer(
                timer_type: FL_TIMER_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_timer, "fl_create_timer");


    function fl_add_timer(
                timer_type: FL_TIMER_TYPE;
                x         : FL_Coord;
                y         : FL_Coord;
                w         : FL_Coord;
                h         : FL_Coord;
                label     : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_timer, "fl_add_timer");


    procedure fl_set_timer(
                obj        : access FL_OBJECT;
                timer_delay: Interfaces.C.Double);

    function fl_get_timer(
                obj: access FL_OBJECT)
               return Interfaces.C.Double;
    
    procedure fl_set_timer_countup(
                p1: access FL_OBJECT;
                p2: X11.int);                                   -- forms.h:2748

    function fl_set_timer_filter(
                p1: access FL_OBJECT;
                p2: FL_TIMER_FILTER)
               return FL_TIMER_FILTER;                          -- forms.h:2749

    procedure fl_suspend_timer(
                p1: access FL_OBJECT);                          -- forms.h:2750

    procedure fl_resume_timer(
                p1: access FL_OBJECT);                          -- forms.h:2751

    procedure fl_set_xyplot_return(
                ob    : access FL_OBJECT;
                always: Boolean);

    procedure fl_set_xyplot_xtics(
                ob   : access FL_OBJECT;
                major: X11.Int;
                minor: X11.Int);

    procedure fl_set_xyplot_ytics(
                ob   : access FL_OBJECT;
                major: X11.Int;
                minor: X11.Int);

    procedure fl_set_xyplot_xbounds(
                ob : access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_set_xyplot_ybounds(
                ob : access FL_OBJECT;
                min: Interfaces.C.Double;
                max: Interfaces.C.Double);

    procedure fl_get_xyplot_xbounds(
                ob : access FL_OBJECT;
                min: access interfaces.c.c_float;
                max: access interfaces.c.c_float);

    procedure fl_get_xyplot_ybounds(
                ob : access FL_OBJECT;
                min: access interfaces.c.c_float;
                max: access interfaces.c.c_float);

    procedure fl_get_xyplot(
                ob: access FL_OBJECT;
                x : access interfaces.c.c_float;
                y : access interfaces.c.c_float;
                i : access X11.Int);

    procedure fl_get_xyplot_data(
                ob: access FL_OBJECT;
                x : access constrained_float_array;
                y : access constrained_float_array;
                n : access X11.Int);

    function fl_create_xyplot(
                xyplot_type: FL_XYPLOT_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_create_xyplot, "fl_create_xyplot");


    function fl_add_xyplot(
                xyplot_type: FL_XYPLOT_TYPE;
                x          : FL_Coord;
                y          : FL_Coord;
                w          : FL_Coord;
                h          : FL_Coord;
                label      : X11.Strings.const_charp)
               return FL_OBJECT_access;

    pragma Import(C, fl_add_xyplot, "fl_add_xyplot");


    procedure fl_set_xyplot_data(
                obj   : access FL_OBJECT;
                x     : access interfaces.c.c_float;
                y     : access interfaces.c.c_float;
                n     : X11.Int;
                title : X11.Strings.const_charp;
                xlabel: X11.Strings.const_charp;
                ylabel: X11.Strings.const_charp);

    pragma Import(C, fl_set_xyplot_data, "fl_set_xyplot_data");


    procedure fl_set_xyplot_file(
                obj     : access FL_OBJECT;
                filename: X11.Strings.const_charp;
                title   : X11.Strings.const_charp;
                xlabel  : X11.Strings.const_charp;
                ylabel  : X11.Strings.const_charp);

    pragma Import(C, fl_set_xyplot_file, "fl_set_xyplot_file");


    procedure fl_add_xyplot_text(
                obj  : access FL_OBJECT;
                x    : Interfaces.C.Double;
                y    : Interfaces.C.Double;
                text : X11.Strings.const_charp;
                align: FL_ALIGN;
                col  : FL_COLOR);

    pragma Import(C, fl_add_xyplot_text, "fl_add_xyplot_text");


    procedure fl_delete_xyplot_text(
                obj : access FL_OBJECT;
                text: X11.Strings.const_charp);

    pragma Import(C, fl_delete_xyplot_text, "fl_delete_xyplot_text");

    function fl_set_xyplot_maxoverlays(
                p1: access FL_OBJECT;
                p2: X11.int)
               return X11.int;


    procedure fl_add_xyplot_overlay(
                obj    : access FL_OBJECT;
                ID     : X11.Int;
                x      : access interfaces.c.c_float;
                y      : access interfaces.c.c_float;
                npoints: X11.Int;
                col    : FL_COLOR);

    procedure fl_add_xyplot_overlay_file(
                p1: access FL_OBJECT;
                p2: X11.int;
                p3: X11.Strings.const_charp;
                p4: FL_COLOR);                                  -- forms.h:2821
    pragma Import(C, fl_add_xyplot_overlay_file, "fl_add_xyplot_overlay_file");

    procedure fl_set_xyplot_overlay_type(
                obj        : access FL_OBJECT;
                ID         : X11.Int;
                xyplot_type: FL_XYPLOT_TYPE);

    procedure fl_delete_xyplot_overlay(
                obj: access FL_OBJECT;
                ID : X11.Int);

    procedure fl_set_xyplot_interpolate(
                ob    : access FL_OBJECT;
                ID    : X11.Int;
                degree: X11.Int;
                grid  : Interfaces.C.Double);

    procedure fl_set_xyplot_fontsize(
                ob  : access FL_OBJECT;
                size: X11.Int);

    procedure fl_set_xyplot_fontstyle(
                ob   : access FL_OBJECT;
                style: FL_TEXT_STYLE);

    procedure fl_set_xyplot_inspect(
                ob : access FL_OBJECT;
                yes: Boolean);

    procedure fl_set_xyplot_symbolsize(
                ob  : access FL_OBJECT;
                size: X11.Int);

    procedure fl_set_xyplot_xscale(
                p1: access FL_OBJECT;
                p2: X11.int;
                p3: Interfaces.C.double);

    procedure fl_set_xyplot_yscale(
                p1: access FL_OBJECT;
                p2: X11.int;
                p3: Interfaces.C.double);

    procedure fl_clear_xyplot(
                p1: access FL_OBJECT);                          -- forms.h:2851

    procedure fl_set_xyplot_linewidth(
                p1: access FL_OBJECT;
                p2: X11.int;
                p3: X11.int);                                   -- forms.h:2852

    procedure fl_set_xyplot_xgrid(
                p1: access FL_OBJECT;
                p2: X11.int);                                   -- forms.h:2853

    procedure fl_set_xyplot_ygrid(
                p1: access FL_OBJECT;
                p2: X11.int);                                   -- forms.h:2854

    procedure fl_set_xyplot_alphaxtics(
                p1: access FL_OBJECT;
                p2: X11.Strings.Const_Charp;
                p3: X11.Strings.Const_Charp);                   -- forms.h:2855
    pragma Import(C, fl_set_xyplot_alphaxtics, "fl_set_xyplot_alphaxtics");
                                                                -- forms.h:2855
    procedure fl_set_xyplot_alphaytics(
                p1: access FL_OBJECT;
                p2: X11.Strings.Const_Charp;
                p3: X11.Strings.Const_Charp);                   -- forms.h:2856
    pragma Import(C, fl_set_xyplot_alphaytics, "fl_set_xyplot_alphaytics");
                                                                -- forms.h:2856
    procedure fl_set_xyplot_fixed_xaxis(
                p1: access FL_OBJECT;
                p2: X11.Strings.Const_Charp;
                p3: X11.Strings.Const_Charp);                   -- forms.h:2857
    pragma Import(C, fl_set_xyplot_fixed_xaxis, "fl_set_xyplot_fixed_xaxis");
                                                                -- forms.h:2857
    procedure fl_set_xyplot_fixed_yaxis(
                p1: access FL_OBJECT;
                p2: X11.Strings.Const_Charp;
                p3: X11.Strings.Const_Charp);                   -- forms.h:2858
    pragma Import(C, fl_set_xyplot_fixed_yaxis, "fl_set_xyplot_fixed_yaxis");
                                                                -- forms.h:2858
    procedure fl_replace_xyplot_point(
                obj: access FL_OBJECT;
                i  : X11.Int;
                x  : Interfaces.C.Double;
                y  : Interfaces.C.Double);

    procedure fl_get_xyplot_xmapping(
                p1: access FL_OBJECT;
                p2: access interfaces.c.c_float;
                p3: access interfaces.c.c_float);

    procedure fl_get_xyplot_ymapping(
                p1: access FL_OBJECT;
                p2: access interfaces.c.c_float;
                p3: access interfaces.c.c_float);

    function fl_interpolate(
                p1: float_const_access;
                p2: float_const_access;
                p3: X11.Int;
                p4: access interfaces.c.c_float;
                p5: access interfaces.c.c_float;
                p6: Interfaces.C.Double;
                p7: X11.Int)
               return X11.Int;

    procedure fl_xyplot_s2w(
                p1: access FL_OBJECT;
                p2: Interfaces.C.Double;
                p3: Interfaces.C.Double;
                p4: access interfaces.c.c_float;
                p5: access interfaces.c.c_float);

    procedure fl_xyplot_w2s(
                p1: access FL_OBJECT;
                p2: Interfaces.C.Double;
                p3: Interfaces.C.Double;
                p4: access interfaces.c.c_float;
                p5: access interfaces.c.c_float);

    procedure fl_set_object_focus(
                form: access FL_FORM;
                obj : access FL_OBJECT)
               renames fl_set_focus_object;


    procedure fl_set_form_call_back(
                form     : access FL_FORM;
                cb       : FL_FORMCALLBACKPTR;
                user_data: System.Address)
               renames fl_set_form_callback;


    procedure fl_set_initial_placement(
                form: access FL_FORM;
                x   : FL_Coord;
                y   : FL_Coord;
                w   : FL_Coord;
                h   : FL_Coord)
               renames fl_set_form_geometry;


    function fl_register_call_back(
                form    : access FL_FORM;
                mask    : X11.long;
                callback: FL_RAW_CALLBACK)
               return FL_RAW_CALLBACK
               renames fl_register_raw_callback;


    procedure fl_set_object_align(
                obj  : access FL_OBJECT;
                align: FL_ALIGN)
               renames fl_set_object_lalign;


    function fl_set_call_back(
                obj     : access FL_OBJECT;
                callback: FL_CALLBACKPTR;
                argument: X11.long)
               return FL_CALLBACKPTR
               renames fl_set_object_callback;


    procedure fl_get_string_size(
                p1: X11.Int;
                p2: X11.Int;
                p3: X11.Strings.const_charp;
                p4: X11.Int;
                p5: access X11.Int;
                p6: access X11.Int)
               renames fl_get_string_dimension;

    function fl_mapcolor_name(
                p1: FL_COLOR;
                p2: X11.Strings.const_charp)
               return X11.long
               renames fl_mapcolorname;

    function fl_get_flcolor(
                p1: FL_COLOR)
               return X11.unsigned_long
               renames fl_get_pixel;

    procedure fl_rectf(
                p1: X11.Int := 1;
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR) 
      renames fl_rectangle;

    procedure fl_roundrectf(
                p1: X11.Int := 1;
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR) 
      renames fl_roundrectangle;

    procedure fl_roundrect(
                p1: X11.Int := 0;
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR) 
      renames fl_roundrectangle;

    procedure fl_polyf(
                p1: X11.Int := 1;
                p: access FL_POINT;
                n: X11.Int;
                c: FL_COLOR)
      renames fl_polygon;

    procedure fl_polyl(
                p1: X11.Int := 0;
                p: access FL_POINT;
                n: X11.Int;
                c: FL_COLOR)
      renames fl_polygon;

    procedure fl_simple_line(
                x  : FL_Coord;
                y  : FL_Coord;
                w  : FL_Coord;
                h  : FL_Coord;
                col: FL_COLOR)
               renames fl_line;

    procedure fl_diagline(
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR);
    pragma Inline(fl_diagline);

    procedure fl_ovalf(
                p1:  X11.Int := 1;
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR)
              renames fl_oval;

    procedure fl_ovall(
                p1:  X11.Int := 1;
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR)
              renames fl_oval;

    procedure fl_oval_bound(
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR)
               renames fl_ovalbound;

    procedure fl_circf(
                x  : FL_Coord;
                y  : FL_Coord;
                r  : FL_Coord;
                col: FL_COLOR);
    pragma Inline(fl_circf);

    procedure fl_circ(
                x  : FL_Coord;
                y  : FL_Coord;
                r  : FL_Coord;
                col: FL_COLOR);
    pragma Inline(fl_circ);

    procedure fl_arcf(
                x : FL_Coord;
                y : FL_Coord;
                r : FL_Coord;
                a1: X11.Int;
                a2: X11.Int;
                c : FL_COLOR);
    pragma Inline(fl_arcf);

    procedure fl_arc(
                x : FL_Coord;
                y : FL_Coord;
                r : FL_Coord;
                a1: X11.Int;
                a2: X11.Int;
                c : FL_COLOR);
    pragma Inline(fl_arc);

    procedure fl_bgnline
               renames fl_reset_vertex;

    procedure fl_bgnclosedline
               renames fl_reset_vertex;

    procedure fl_bgnpolygon
               renames fl_reset_vertex;

    procedure fl_v2s(
                v: FL_Coord_array);
    pragma Inline(fl_v2s);

    procedure fl_v2i(
                v: FL_Coord_array);
    pragma Inline(fl_v2i);

    procedure fl_v2f(
                v: float_array);
    pragma Inline(fl_v2f);

    procedure fl_v2d(
                v: float_array);
    pragma Inline(fl_v2d);

    function fl_get_font_struct(
                style: FL_TEXT_STYLE;
                size : X11.Int)
               return X11.Xlib.XFontStruct_access
               renames fl_get_fontstruct;

    function fl_set_foreground(
                gc: X11.Xlib.GC;
                c : FL_COLOR)
               return X11.Int;
    pragma Inline(fl_set_foreground);

    function fl_set_background(
                gc: X11.Xlib.GC;
                c : FL_COLOR)
               return X11.Int;
    pragma Inline(fl_set_background);

    procedure fl_pref_winposition(
                x: FL_Coord;
                y: FL_Coord)
               renames fl_winposition;

    procedure fl_win_background(
                p1   : X11.Window;
                color: X11.unsigned_long)
               renames fl_winbackground;

    procedure fl_set_winstepunit(
                p1: X11.Window;
                p2: FL_Coord;
                p3: FL_Coord)
               renames fl_winstepunit;

    procedure fl_pref_winsize(
                w: FL_Coord;
                h: FL_Coord)
               renames fl_winsize;

    procedure fl_pref_wingeometry(
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord)
               renames fl_wingeometry;

    procedure fl_get_win_size(
                win: X11.Window;
                w  : access FL_Coord;
                h  : access FL_Coord)
               renames fl_get_winsize;

    procedure fl_get_win_origin(
                win: X11.Window;
                x  : access FL_Coord;
                y  : access FL_Coord)
               renames fl_get_winorigin;

    procedure fl_get_win_geometry(
                win: X11.Window;
                x  : access FL_Coord;
                y  : access FL_Coord;
                w  : access FL_Coord;
                h  : access FL_Coord)
               renames fl_get_wingeometry;

    function fl_add_selected_xevent(
                p1: X11.Window;
                p2: X11.long)
               return X11.long
               renames fl_addto_selected_xevent;
    
    procedure fl_set_idle_delta(P1: X11.Long);

    function fl_keypressed(
                p1: X11.Keysym)
               return X11.Int
               renames fl_keysym_pressed;

--    procedure fl_set_text_clipping(
--                a: FL_Coord;
--                b: FL_Coord;
--                c: FL_Coord;
--                d: FL_Coord);
--    pragma Inline(fl_set_text_clipping);

--    procedure fl_unset_text_clipping;
--    pragma Inline(fl_unset_text_clipping);

    function fl_create_from_bitmapdata(
                win : X11.Drawable;
                data: X11.Strings.const_charp;
                w   : X11.unsigned_int;
                h   : X11.unsigned_int)
               return X11.Pixmap;
    pragma Inline(fl_create_from_bitmapdata);

    procedure fl_set_bitmap_datafile(
                ob  : access FL_OBJECT;
                file: X11.Strings.const_charp)
               renames fl_set_bitmap_file;

    procedure fl_set_browser_leftscrollbar(
                p1: access FL_OBJECT;
                p2: X11.Int)
               renames fl_set_browser_leftslider;

    procedure fl_set_bitmapbutton_datafile(
                ob      : access FL_OBJECT;
                filename: X11.Strings.const_charp)
               renames fl_set_bitmapbutton_file;

    procedure fl_set_pixmapbutton_data(
                p1: access FL_OBJECT;
                p2: access X11.Strings.charp)
               renames fl_set_pixmap_data;

    procedure fl_set_pixmapbutton_file(
                ob  : access FL_OBJECT;
                file: X11.Strings.const_charp)
               renames fl_set_pixmap_file;

    procedure fl_set_pixmapbutton_datafile(
                ob  : access FL_OBJECT;
                file: X11.Strings.const_charp)
               renames fl_set_pixmap_file;

    procedure fl_set_pixmapbutton_focus_outline(
                ob     : access FL_OBJECT;
                Outline: X11.int);

    procedure fl_set_pixmapbutton_pixmap(
                p1: access FL_OBJECT;
                p2: X11.Pixmap;
                p3: X11.Pixmap)
               renames fl_set_pixmap_pixmap;

    function fl_get_pixmapbutton_pixmap(
                p1: access FL_OBJECT;
                p2: access X11.Pixmap;
                p3: access X11.Pixmap)
               return X11.Pixmap
               renames fl_get_pixmap_pixmap;

    procedure fl_free_pixmapbutton_pixmap(
                p1: access FL_OBJECT)
               renames fl_free_pixmap_pixmap;

    procedure fl_set_button_shortcut(
                obj   : access FL_OBJECT;
                str   : X11.Strings.const_charp;
                showUL: Boolean)
               renames fl_set_object_shortcut;

    procedure fl_set_fselector_transient(
                b: Boolean);
    pragma Inline(fl_set_fselector_transient);

    function fl_show_file_selector(
                message  : X11.Strings.const_charp;
                directory: X11.Strings.const_charp;
                pattern  : X11.Strings.const_charp;
                default  : X11.Strings.const_charp)
               return X11.Strings.const_charp
               renames fl_show_fselector;

    procedure fl_set_fselector_cb(
                p1: p1_func_access;
                p2: System.Address)
               renames fl_set_fselector_callback;

    procedure fl_set_fselector_title(
                s: X11.Strings.const_charp);
    pragma Inline(fl_set_fselector_title);

    procedure fl_set_input_shortcut(
                obj   : access FL_OBJECT;
                str   : X11.Strings.const_charp;
                showUL: Boolean)
               renames fl_set_object_shortcut;

    procedure fl_ringbell( Percent: in X11.Int );
    
    procedure fl_free_pixmap( Id: X11.Pixmap );
    pragma Inline(fl_free_pixmap);
    
    procedure Fl_Gettime( Sec, usec: access X11.Long );
    
    function fl_mouse_button return X11.Long;
    function fl_mousebutton return X11.Long renames fl_mouse_button;
    
    procedure fl_setpup_hotkey(
                p1: X11.Int;
                p2: X11.Int;
                p3: X11.Strings.const_charp)
               renames fl_setpup_shortcut;


    function fl_setpup(
                menuID  : X11.Window;
                item_num: X11.Int;
                mode    : FL_ITEM_MODE)
               return X11.Int
               renames fl_setpup_mode;


    procedure fl_set_xyplot_datafile(
                obj     : access FL_OBJECT;
                filename: X11.Strings.const_charp;
                title   : X11.Strings.const_charp;
                xlabel  : X11.Strings.const_charp;
                ylabel  : X11.Strings.const_charp)
               renames fl_set_xyplot_file;



private

    pragma Import(C, FL_EVENT, "FL_EVENT");
    pragma Import(C, fl_current_form, "fl_current_form");
    pragma Import(C, fl_screen, "fl_screen");
    pragma Import(C, fl_root, "fl_root");
    pragma Import(C, fl_vroot, "fl_vroot");
    pragma Import(C, fl_scrh, "fl_scrh");
    pragma Import(C, fl_scrw, "fl_scrw");
    pragma Import(C, fl_state_c0, "fl_state");
    pragma Import(C, fl_ul_magic_char, "fl_ul_magic_char");
    pragma Import(C, fl_textgc, "fl_textgc");
    pragma Import(C, fl_add_io_callback, "fl_add_io_callback");
    pragma Import(C, fl_remove_io_callback, "fl_remove_io_callback");
    pragma Import(C, fl_add_signal_callback, "fl_add_signal_callback");
    pragma Import(C, fl_remove_signal_callback, "fl_remove_signal_callback");
    pragma Import(C, fl_signal_caught, "fl_signal_caught");
    pragma Import(C, fl_app_signal_direct, "fl_app_signal_direct");
    pragma Import(C, Fl_Add_Timeout, "fl_add_timeout" );
    pragma Import(C, Fl_Remove_Timeout, "fl_remove_timeout" );
    pragma Import(C, fl_get_vn_name, "fl_get_vn_name");
    pragma Import(C, fl_msleep, "fl_msleep");
    pragma Import(C, fl_library_version, "fl_library_version");
    pragma Import(C, fl_bgn_form, "fl_bgn_form");
    pragma Import(C, fl_end_form, "fl_end_form");
    pragma Import(C, fl_do_forms, "fl_do_forms");
    pragma Import(C, fl_check_forms, "fl_check_forms");
    pragma Import(C, fl_do_only_forms, "fl_do_only_forms");
    pragma Import(C, fl_check_only_forms, "fl_check_only_forms");
    pragma Import(C, fl_freeze_form, "fl_freeze_form");
    pragma Import(C, fl_set_focus_object, "fl_set_focus_object");
    pragma Import(C, fl_reset_focus_object, "fl_reset_focus_object");
    pragma Import(C, fl_set_form_atclose, "fl_set_form_atclose");
    pragma Import(C, fl_set_atclose, "fl_set_atclose");
    pragma Import(C, fl_set_form_atactivate, "fl_set_form_atactivate");

    pragma Import(C, fl_set_form_atdeactivate, "fl_set_form_atdeactivate");

    pragma Import(C, fl_unfreeze_form, "fl_unfreeze_form");
    pragma Import(C, fl_deactivate_form, "fl_deactivate_form");
    pragma Import(C, fl_activate_form, "fl_activate_form");
    pragma Import(C, fl_deactivate_all_forms, "fl_deactivate_all_forms");

    pragma Import(C, fl_activate_all_forms, "fl_activate_all_forms");

    pragma Import(C, fl_freeze_all_forms, "fl_freeze_all_forms");
    pragma Import(C, fl_unfreeze_all_forms, "fl_unfreeze_all_forms");

    pragma Import(C, fl_scale_form, "fl_scale_form");
    pragma Import(C, fl_set_form_position, "fl_set_form_position");

    pragma Import(C, fl_set_form_property, "fl_set_form_property");

    pragma Import(C, fl_set_app_mainform, "fl_set_app_mainform");
    pragma Import(C, fl_get_app_mainform, "fl_get_app_mainform");
    pragma Import(C, fl_set_app_nomainform, "fl_set_app_nomainform");

    pragma Import(C, fl_set_form_callback, "fl_set_form_callback");

    pragma Import(C, fl_set_form_size, "fl_set_form_size");
    pragma Import(C, fl_set_form_hotspot, "fl_set_form_hotspot");
    pragma Import(C, fl_set_form_hotobject, "fl_set_form_hotobject");

    pragma Import(C, fl_set_form_minsize, "fl_set_form_minsize");
    pragma Import(C, fl_set_form_maxsize, "fl_set_form_maxsize");
    pragma Import(C, fl_set_form_event_cmask, "fl_set_form_event_cmask");

    pragma Import(C, fl_get_form_event_cmask, "fl_get_form_event_cmask");

    pragma Import(C, fl_set_form_geometry, "fl_set_form_geometry");

    pragma Import(C, fl_hide_form, "fl_hide_form");
    pragma Import(C, fl_free_form, "fl_free_form");
    pragma Import(C, fl_redraw_form, "fl_redraw_form");
    pragma Import(C, fl_set_form_dblbuffer, "fl_set_form_dblbuffer");

    pragma Import(C, fl_show_form_window, "fl_show_form_window");
    
    pragma Import(C, fl_adjust_form_size, "fl_adjust_form_size" );
    pragma Import(C, fl_form_is_visible, "fl_form_is_visible" );
    
    pragma Import(C, fl_register_raw_callback, "fl_register_raw_callback");

    pragma Import(C, fl_bgn_group, "fl_bgn_group");
    pragma Import(C, fl_end_group, "fl_end_group");
    pragma Import(C, fl_addto_group, "fl_addto_group");
    pragma Import(C, fl_set_object_boxtype, "fl_set_object_boxtype");

    pragma Import(C, fl_set_object_bw, "fl_set_object_bw");
    pragma Import(C, fl_set_object_resize, "fl_set_object_resize");

    pragma Import(C, fl_set_object_gravity, "fl_set_object_gravity");

    pragma Import(C, fl_set_object_lsize, "fl_set_object_lsize");
    pragma Import(C, fl_set_object_lstyle, "fl_set_object_lstyle");

    pragma Import(C, fl_set_object_lcol, "fl_set_object_lcol");
    pragma Import(C, fl_set_object_return, "fl_set_object_return");

    pragma Import(C, fl_set_object_lalign, "fl_set_object_lalign");

    pragma Import(C, fl_set_object_shortcutkey, "fl_set_object_shortcutkey");

    pragma Import(C, fl_set_object_dblbuffer, "fl_set_object_dblbuffer");

    pragma Import(C, fl_set_object_color, "fl_set_object_color");
    pragma Import(C, fl_set_object_position, "fl_set_object_position");

    pragma Import(C, fl_set_object_size, "fl_set_object_size");
    pragma Import(C, fl_set_object_automatic, "fl_set_object_automatic");

    pragma Import(C, fl_draw_object_label, "fl_draw_object_label");
    pragma Import(C, fl_draw_object_label_outside, "fl_draw_object_label_outside");
    pragma Import(C, fl_set_object_geometry, "fl_set_object_geometry");

    pragma Import(C, fl_fit_object_label, "fl_fit_object_label");
    pragma Import(C, fl_get_object_geometry, "fl_get_object_geometry");

    pragma Import(C, fl_get_object_position, "fl_get_object_position");

    pragma Import(C, fl_compute_object_geometry, "fl_compute_object_geometry");

    pragma Import(C, fl_call_object_callback, "fl_call_object_callback");

    pragma Import(C, fl_set_object_prehandler, "fl_set_object_prehandler");

    pragma Import(C, fl_set_object_posthandler, "fl_set_object_posthandler");

    pragma Import(C, fl_set_object_callback, "fl_set_object_callback");

    pragma Import(C, fl_redraw_object, "fl_redraw_object");
    pragma Import(C, fl_scale_object, "fl_scale_object");
    pragma Import(C, fl_show_object, "fl_show_object");
    pragma Import(C, fl_hide_object, "fl_hide_object");
    pragma Import(C, fl_free_object, "fl_free_object");
    pragma Import(C, fl_delete_object, "fl_delete_object");
    pragma Import(C, fl_trigger_object, "fl_trigger_object");
    pragma Import(C, fl_activate_object, "fl_activate_object");
    pragma Import(C, fl_deactivate_object, "fl_deactivate_object");

    pragma Import(C, fl_enumerate_fonts, "fl_enumerate_fonts");
    pragma Import(C, fl_set_font, "fl_set_font");
    pragma Import(C, fl_get_char_height, "fl_get_char_height");
    pragma Import(C, fl_get_char_width, "fl_get_char_width");
    pragma Import(C, fl_get_align_xy, "fl_get_align_xy");
    pragma Import(C, fl_drw_box, "fl_drw_box");
    pragma Import(C, fl_mapcolor, "fl_mapcolor");
    pragma Import(C, fl_drw_slider, "fl_drw_slider");
    pragma Import(C, fl_getmcolor, "fl_getmcolor");
    pragma Import(C, fl_free_colors, "fl_free_colors");
    pragma Import(C, fl_free_pixels, "fl_free_pixels");
    pragma Import(C, fl_set_color_leak, "fl_set_color_leak");
    pragma Import(C, fl_get_pixel, "fl_get_pixel");
    pragma Import(C, fl_get_icm_color, "fl_get_icm_color");
    pragma Import(C, fl_set_icm_color, "fl_set_icm_color");
    pragma Import(C, fl_color_c0, "fl_color");
    pragma Import(C, fl_bk_color, "fl_bk_color");
    pragma Import(C, fl_textcolor, "fl_textcolor");
    pragma Import(C, fl_bk_textcolor, "fl_bk_textcolor");
    pragma Import(C, fl_set_gamma, "fl_set_gamma");
    pragma Import(C, fl_show_errors, "fl_show_errors");
    pragma Import(C, fl_add_object, "fl_add_object");
    pragma Import(C, fl_addto_form, "fl_addto_form");
    pragma Import(C, fl_set_coordunit, "fl_set_coordunit");
    pragma Import(C, fl_get_coordunit, "fl_get_coordunit");
    pragma Import(C, fl_set_border_width, "fl_set_border_width");
    pragma Import(C, fl_get_border_width, "fl_get_border_width");
    pragma Import(C, fl_flip_yorigin, "fl_flip_yorigin");
    pragma Import(C, fl_mode_capable, "fl_mode_capable");
    pragma Import(C, fl_rectangle, "fl_rectangle");
    pragma Import(C, fl_rectbound, "fl_rectbound");
    pragma Import(C, fl_roundrectangle, "fl_roundrectangle");
    pragma Import(C, fl_polygon, "fl_polygon");
    pragma Import(C, fl_lines, "fl_lines");
    pragma Import(C, fl_line, "fl_line");
    pragma Import(C, fl_drawmode, "fl_drawmode");
    pragma Import(C, fl_linewidth, "fl_linewidth");
    pragma Import(C, fl_linestyle, "fl_linestyle");
    pragma Import(C, fl_oval, "fl_oval");
    pragma Import(C, fl_ovalbound, "fl_ovalbound");
    pragma Import(C, fl_ovalarc, "fl_ovalarc");                 -- forms.h:1064
    pragma Import(C, fl_pieslice, "fl_pieslice");
    pragma Import(C, fl_add_vertex, "fl_add_vertex");
    pragma Import(C, fl_add_float_vertex, "fl_add_float_vertex");

    pragma Import(C, fl_reset_vertex, "fl_reset_vertex");
    pragma Import(C, fl_endline, "fl_endline");
    pragma Import(C, fl_endpolygon, "fl_endpolygon");
    pragma Import(C, fl_endclosedline, "fl_endclosedline");
    pragma Import(C, fl_drw_frame, "fl_drw_frame");
    pragma Import(C, fl_drw_checkbox, "fl_drw_checkbox");
    pragma Import(C, fl_get_fontstruct, "fl_get_fontstruct");
    pragma Import(C, fl_get_mouse, "fl_get_mouse");
    pragma Import(C, fl_set_mouse, "fl_set_mouse");
    pragma Import(C, fl_get_win_mouse, "fl_get_win_mouse");
    pragma Import(C, fl_get_form_mouse, "fl_get_form_mouse");
    pragma Import(C, fl_win_to_form, "fl_win_to_form");
    pragma Import(C, fl_set_form_icon, "fl_set_form_icon");
    pragma Import(C, fl_winshow, "fl_winshow");
    pragma Import(C, fl_winhide, "fl_winhide");
    pragma Import(C, fl_winclose, "fl_winclose");
    pragma Import(C, fl_winset, "fl_winset");
    pragma Import(C, fl_winget, "fl_winget");
    pragma Import(C, fl_winresize, "fl_winresize");
    pragma Import(C, fl_winmove, "fl_winmove");
    pragma Import(C, fl_winreshape, "fl_winreshape");
    pragma Import(C, fl_winicon, "fl_winicon");
    pragma Import(C, fl_winbackground, "fl_winbackground");
    pragma Import(C, fl_winstepunit, "fl_winstepunit");
    pragma Import(C, fl_winisvalid, "fl_winisvalid");
    pragma Import(C, fl_winposition, "fl_winposition");
    pragma Import(C, fl_winminsize, "fl_winminsize");
    pragma Import(C, fl_winmaxsize, "fl_winmaxsize");
    pragma Import(C, fl_winaspect, "fl_winaspect");
    pragma Import(C, fl_reset_winconstraints, "fl_reset_winconstraints");

    pragma Import(C, fl_winsize, "fl_winsize");
    pragma Import(C, fl_initial_winsize, "fl_initial_winsize");
    pragma Import(C, fl_initial_winstate, "fl_initial_winstate");

    pragma Import(C, fl_create_colormap, "fl_create_colormap");
    pragma Import(C, fl_wingeometry, "fl_wingeometry");
    pragma Import(C, fl_initial_wingeometry, "fl_initial_wingeometry");

    pragma Import(C, fl_noborder_c0, "fl_noborder");
    pragma Import(C, fl_transient_c0, "fl_transient");
    pragma Import(C, fl_get_winsize, "fl_get_winsize");
    pragma Import(C, fl_get_winorigin, "fl_get_winorigin");
    pragma Import(C, fl_get_wingeometry, "fl_get_wingeometry");
    pragma Import(C, fl_XNextEvent, "fl_XNextEvent");
    pragma Import(C, fl_XPeekEvent, "fl_XPeekEvent");
    pragma Import(C, fl_XEventsQueued, "fl_XEventsQueued");
    pragma Import(C, fl_XPutBackEvent, "fl_XPutBackEvent");
    pragma Import(C, fl_last_event, "fl_last_event");
    pragma Import(C, fl_set_event_callback, "fl_set_event_callback");

    pragma Import(C, fl_set_idle_callback, "fl_set_idle_callback");

    pragma Import(C, fl_addto_selected_xevent, "fl_addto_selected_xevent");

    pragma Import(C, fl_remove_selected_xevent, "fl_remove_selected_xevent");

    pragma Import(C, fl_add_event_callback, "fl_add_event_callback");

    pragma Import(C, fl_remove_event_callback, "fl_remove_event_callback");

    pragma Import(C, fl_activate_event_callbacks, "fl_activate_event_callbacks");

    pragma Import(C, fl_finish, "fl_finish");
    pragma Import(C, fl_get_app_resources, "fl_get_app_resources");

    pragma Import(C, fl_set_graphics_mode, "fl_set_graphics_mode");
    pragma Import(C, fl_set_visualID, "fl_set_visualID");

    pragma Import(C, fl_keysym_pressed, "fl_keysym_pressed");
    pragma Import(C, fl_set_defaults, "fl_set_defaults");
    pragma Import(C, fl_get_defaults, "fl_get_defaults");
    pragma Import(C, fl_get_visual_depth, "fl_get_visual_depth");

    pragma Import(C, fl_vclass_name, "fl_vclass_name");
    pragma Import(C, fl_set_ul_property, "fl_set_ul_property");
    pragma Import(C, fl_set_clipping, "fl_set_clipping");
    pragma Import(C, fl_set_gc_clipping, "fl_set_gc_clipping");
    pragma Import(C, fl_unset_gc_clipping, "fl_unset_gc_clipping");

    pragma Import(C, fl_set_clippings, "fl_set_clippings");
    pragma Import(C, fl_unset_clipping, "fl_unset_clipping");
    pragma Import(C, fl_set_bitmap_data, "fl_set_bitmap_data");
    pragma Import(C, fl_set_pixmap_data, "fl_set_pixmap_data");
    pragma Import(C, fl_set_pixmap_align, "fl_set_pixmap_align");

    pragma Import(C, fl_set_pixmap_pixmap, "fl_set_pixmap_pixmap");

    pragma Import(C, fl_set_pixmap_colorcloseness, "fl_set_pixmap_colorcloseness");

    pragma Import(C, fl_free_pixmap_pixmap, "fl_free_pixmap_pixmap");

    pragma Import(C, fl_get_pixmap_pixmap, "fl_get_pixmap_pixmap");

    pragma Import(C, fl_create_from_pixmapdata, "fl_create_from_pixmapdata");

    pragma Import(C, fl_clear_browser, "fl_clear_browser");
    pragma Import(C, fl_delete_browser_line, "fl_delete_browser_line");

    pragma Import(C, fl_get_browser_line, "fl_get_browser_line");

    pragma Import(C, fl_select_browser_line, "fl_select_browser_line");

    pragma Import(C, fl_deselect_browser_line, "fl_deselect_browser_line");

    pragma Import(C, fl_deselect_browser, "fl_deselect_browser");

    pragma Import(C, fl_isselected_browser_line, "fl_isselected_browser_line");

    pragma Import(C, fl_get_browser_topline, "fl_get_browser_topline");

    pragma Import(C, fl_get_browser, "fl_get_browser");
    pragma Import(C, fl_get_browser_maxline, "fl_get_browser_maxline");

    pragma Import(C, fl_get_browser_screenlines, "fl_get_browser_screenlines");

    pragma Import(C, fl_set_browser_topline, "fl_set_browser_topline");

    pragma Import(C, fl_set_browser_fontsize, "fl_set_browser_fontsize");

    pragma Import(C, fl_set_browser_fontstyle, "fl_set_browser_fontstyle");

    pragma Import(C, fl_set_browser_specialkey, "fl_set_browser_specialkey");

    pragma Import(C, fl_set_browser_vscrollbar, "fl_set_browser_vscrollbar");
    pragma Import(C, fl_set_browser_hscrollbar, "fl_set_browser_hscrollbar");

    pragma Import(C, fl_set_browser_leftslider, "fl_set_browser_leftslider");

    pragma Import(C, fl_set_browser_line_selectable, "fl_set_browser_line_selectable");

    pragma Import(C, fl_get_browser_dimension, "fl_get_browser_dimension");

    pragma Import(C, fl_set_browser_dblclick_callback, "fl_set_browser_dblclick_callback");

    pragma Import(C, fl_set_browser_xoffset, "fl_set_browser_xoffset");
    pragma Import(C, fl_set_browser_scrollbarsize, "fl_set_browser_scrollbarsize");

    pragma Import(C, fl_set_bitmapbutton_data, "fl_set_bitmapbutton_data");

    pragma Import(C, fl_set_pixmapbutton_focus_outline, "fl_set_pixmapbutton_focus_outline");
    pragma Import(C, fl_get_button, "fl_get_button");
    pragma Import(C, fl_set_button, "fl_set_button");
    pragma Import(C, fl_get_button_numb, "fl_get_button_numb");
    pragma Import(C, fl_add_button_class, "fl_add_button_class");

    pragma Import(C, fl_set_canvas_decoration, "fl_set_canvas_decoration");

    pragma Import(C, fl_set_canvas_colormap, "fl_set_canvas_colormap");

    pragma Import(C, fl_set_canvas_visual, "fl_set_canvas_visual");

    pragma Import(C, fl_set_canvas_depth, "fl_set_canvas_depth");

    pragma Import(C, fl_set_canvas_attributes, "fl_set_canvas_attributes");

    pragma Import(C, fl_add_canvas_handler, "fl_add_canvas_handler");

    pragma Import(C, fl_get_canvas_id, "fl_get_canvas_id");
    pragma Import(C, fl_get_canvas_colormap, "fl_get_canvas_colormap");

    pragma Import(C, fl_get_canvas_depth, "fl_get_canvas_depth");

    pragma Import(C, fl_remove_canvas_handler, "fl_remove_canvas_handler");

    pragma Import(C, fl_hide_canvas, "fl_hide_canvas");
    pragma Import(C, fl_canvas_yield_to_shortcut, "fl_canvas_yield_to_shortcut");

    pragma Import(C, fl_modify_canvas_prop_c0, "fl_modify_canvas_prop");

    pragma Import(C, fl_set_glcanvas_defaults, "fl_set_glcanvas_defaults");

    pragma Import(C, fl_get_glcanvas_defaults, "fl_get_glcanvas_defaults");

    pragma Import(C, fl_set_glcanvas_attributes, "fl_set_glcanvas_attributes");

    pragma Import(C, fl_get_glcanvas_attributes, "fl_get_glcanvas_attributes");

    pragma Import(C, fl_set_glcanvas_direct, "fl_set_glcanvas_direct");

    pragma Import(C, fl_get_glcanvas_xvisualinfo, "fl_get_glcanvas_xvisualinfo");

    pragma Import(C, fl_clear_chart, "fl_clear_chart");
    pragma Import(C, fl_set_chart_bounds, "fl_set_chart_bounds");

    pragma Import(C, fl_set_chart_maxnumb, "fl_set_chart_maxnumb");

    pragma Import(C, fl_set_chart_autosize, "fl_set_chart_autosize");

    pragma Import(C, fl_set_chart_lstyle, "fl_set_chart_lstyle");
                                                                -- forms.h:1846
    pragma Import(C, fl_set_chart_lsize, "fl_set_chart_lsize"); -- forms.h:1847
    pragma Import(C, fl_set_chart_lcolor, "fl_set_chart_lcolor");
    pragma Import(C, fl_clear_choice, "fl_clear_choice");
    pragma Import(C, fl_delete_choice, "fl_delete_choice");
    pragma Import(C, fl_set_choice, "fl_set_choice");
    pragma Import(C, fl_get_choice, "fl_get_choice");
    pragma Import(C, fl_get_choice_item_text, "fl_get_choice_item_text");
    pragma Import(C, fl_get_choice_maxitems, "fl_get_choice_maxitems");

    pragma Import(C, fl_get_choice_text, "fl_get_choice_text");
    pragma Import(C, fl_set_choice_fontsize, "fl_set_choice_fontsize");

    pragma Import(C, fl_set_choice_fontstyle, "fl_set_choice_fontstyle");

    pragma Import(C, fl_set_choice_align, "fl_set_choice_align");

    pragma Import(C, fl_set_choice_item_mode, "fl_set_choice_item_mode");

    pragma Import(C, fl_get_clock, "fl_get_clock");
    pragma Import(C, fl_set_counter_value, "fl_set_counter_value");

    pragma Import(C, fl_set_counter_bounds, "fl_set_counter_bounds");
    pragma Import(C, fl_get_counter_bounds, "fl_get_counter_bounds");

    pragma Import(C, fl_set_counter_step, "fl_set_counter_step");

    pragma Import(C, fl_set_counter_precision, "fl_set_counter_precision");

    pragma Import(C, fl_get_counter_value, "fl_get_counter_value");

    pragma Import(C, fl_set_counter_return, "fl_set_counter_return");

    pragma Import(C, fl_set_counter_filter, "fl_set_counter_filter");

    pragma Import(C, fl_set_cursor, "fl_set_cursor");
    pragma Import(C, fl_set_cursor_color, "fl_set_cursor_color");

    pragma Import(C, fl_get_cursor_byname, "fl_get_cursor_byname");

    pragma Import(C, fl_set_dial_value, "fl_set_dial_value");
    pragma Import(C, fl_get_dial_value, "fl_get_dial_value");
    pragma Import(C, fl_set_dial_bounds, "fl_set_dial_bounds");
    pragma Import(C, fl_get_dial_bounds, "fl_get_dial_bounds");
    pragma Import(C, fl_set_dial_step, "fl_set_dial_step");
    pragma Import(C, fl_set_dial_return, "fl_set_dial_return");
    pragma Import(C, fl_set_dial_angles, "fl_set_dial_angles");
    pragma Import(C, fl_set_dial_cross, "fl_set_dial_cross");
    pragma Import(C, fl_set_dial_direction, "fl_set_dial_direction");
    pragma Import(C, fl_set_dirlist_filter, "fl_set_dirlist_filter");
    pragma Import(C, fl_set_dirlist_sort, "fl_set_dirlist_sort");

    pragma Import(C, fl_free_dirlist, "fl_free_dirlist");
    pragma Import(C, fl_free_all_dirlist, "fl_free_all_dirlist");

    pragma Import(C, fl_set_goodies_font, "fl_set_goodies_font");

    pragma Import(C, fl_show_colormap, "fl_show_colormap");
    pragma Import(C, fl_hide_oneliner, "fl_hide_oneliner");
    pragma Import(C, fl_set_oneliner_font, "fl_set_oneliner_font");

    pragma Import(C, fl_set_oneliner_color, "fl_set_oneliner_color");
    pragma Import(C, fl_exe_command, "fl_exe_command" );
    pragma Import(C, fl_end_command, "fl_end_command" );
    pragma Import(C, fl_end_all_command, "fl_end_all_command" );
    pragma Import(C, fl_show_command_log, "fl_show_command_log" );
    pragma Import(C, fl_hide_command_log, "fl_hide_command_log" );
    pragma Import(C, fl_clear_command_log, "fl_clear_command_log" );
    pragma Import(C, fl_addto_command_log, "fl_addto_command_log" );
    pragma Import(C, fl_set_command_log_position, "fl_set_command_log_position" );
    pragma Import(C, fl_get_command_log_fdstruct, "fl_get_command_log_fdstruct" );
    pragma Import(C, fl_use_fselector, "fl_use_fselector");
    pragma Import(C, fl_set_fselector_fontsize, "fl_set_fselector_fontsize");
                                                                -- forms.h:2267
    pragma Import(C, fl_set_fselector_fontstyle, "fl_set_fselector_fontstyle");
    pragma Import(C, fl_set_fselector_placement, "fl_set_fselector_placement");

    pragma Import(C, fl_set_fselector_border, "fl_set_fselector_border");

    pragma Import(C, fl_set_fselector_callback, "fl_set_fselector_callback");

    pragma Import(C, fl_get_directory, "fl_get_directory");
    pragma Import(C, fl_get_pattern, "fl_get_pattern");
    pragma Import(C, fl_get_filename, "fl_get_filename");
    pragma Import(C, fl_refresh_fselector, "fl_refresh_fselector");

    pragma Import(C, fl_disable_fselector_cache, "fl_disable_fselector_cache");

    pragma Import(C, fl_invalidate_fselector_cache, "fl_invalidate_fselector_cache");

    pragma Import(C, fl_get_fselector_form, "fl_get_fselector_form");

    pragma Import(C, fl_get_fselector_fdstruct, "fl_get_fselector_fdstruct");
    pragma Import(C, fl_hide_fselector, "fl_hide_fselector");
    pragma Import(C, fl_set_fselector_filetype_marker, "fl_set_fselector_filetype_marker");
    pragma Import(C, fl_set_input_color, "fl_set_input_color");
    pragma Import(C, fl_get_input, "fl_get_input");
    pragma Import(C, fl_set_input_return, "fl_set_input_return");

    pragma Import(C, fl_set_input_scroll, "fl_set_input_scroll");

    pragma Import(C, fl_set_input_cursorpos, "fl_set_input_cursorpos");

    pragma Import(C, fl_get_input_cursorpos, "fl_get_input_cursorpos");

    pragma Import(C, fl_set_input_selected, "fl_set_input_selected");

    pragma Import(C, fl_set_input_selected_range, "fl_set_input_selected_range");

    pragma Import(C, fl_set_input_maxchars, "fl_set_input_maxchars");
    pragma Import(C, fl_set_input_format, "fl_set_input_format" );
    pragma Import(C, fl_set_input_hscrollbar, "fl_set_input_hscrollbar" );
    pragma Import(C, fl_set_input_vscrollbar, "fl_set_input_vscrollbar" );
    pragma Import(C, fl_set_input_xoffset, "fl_set_input_xoffset" );
    pragma Import(C, fl_set_input_topline, "fl_set_input_topline" );
    pragma Import(C, fl_set_input_scrollbarsize, "fl_set_input_scrollbarsize" );
    pragma Import(C, fl_get_input_topline, "fl_get_input_topline" );
    pragma Import(C, fl_get_input_screenlines, "fl_get_input_screenlines" );
    pragma Import(C, fl_get_input_numberoflines, "fl_get_input_numberoflines" );
    pragma Import(C, fl_get_input_format, "fl_get_input_format" );
    pragma Import(C, fl_set_input_filter, "fl_set_input_filter");

    pragma Import(C, fl_clear_menu, "fl_clear_menu");
    pragma Import(C, fl_delete_menu_item, "fl_delete_menu_item");

    pragma Import(C, fl_set_menu_item_mode, "fl_set_menu_item_mode");

    pragma Import(C, fl_show_menu_symbol, "fl_show_menu_symbol");

    pragma Import(C, fl_set_menu_popup, "fl_set_menu_popup");
    pragma Import(C, fl_get_menu, "fl_get_menu");
    pragma Import(C, fl_get_menu_item_text, "fl_get_menu_item_text");
    pragma Import(C, fl_get_menu_maxitems, "fl_get_menu_maxitems");

    pragma Import(C, fl_get_menu_item_mode, "fl_get_menu_item_mode");

    pragma Import(C, fl_get_menu_text, "fl_get_menu_text");
    pragma Import(C, fl_newpup, "fl_newpup");
    pragma Import(C, fl_setpup_mode, "fl_setpup_mode");
    pragma Import(C, fl_freepup, "fl_freepup");
    pragma Import(C, fl_dopup, "fl_dopup");
    pragma Import(C, fl_setpup_position, "fl_setpup_position");
    pragma Import(C, fl_setpup_selection, "fl_setpup_selection");

    pragma Import(C, fl_setpup_fontsize, "fl_setpup_fontsize");
    pragma Import(C, fl_setpup_fontstyle, "fl_setpup_fontstyle");

    pragma Import(C, fl_setpup_shadow, "fl_setpup_shadow");
    pragma Import(C, fl_setpup_softedge, "fl_setpup_softedge");
    pragma Import(C, fl_setpup_color, "fl_setpup_color");
    pragma Import(C, fl_setpup_checkcolor, "fl_setpup_checkcolor");
    pragma Import(C, fl_setpup_bw, "fl_setpup_bw");
    pragma Import(C, fl_setpup_pad, "fl_setpup_pad");
    pragma Import(C, fl_setpup_cursor, "fl_setpup_cursor");
    pragma Import(C, fl_setpup_default_cursor, "fl_setpup_default_cursor");

    pragma Import(C, fl_setpup_maxpup, "fl_setpup_maxpup");
    pragma Import(C, fl_getpup_mode, "fl_getpup_mode");
    pragma Import(C, fl_getpup_text, "fl_getpup_text");
    pragma Import(C, fl_showpup, "fl_showpup");
    pragma Import(C, fl_hidepup, "fl_hidepup");
    pragma Import(C, fl_setpup_itemcb, "fl_setpup_itemcb");
    pragma Import(C, fl_setpup_menucb, "fl_setpup_menucb");
    pragma Import(C, fl_setpup_submenu, "fl_setpup_submenu");
    pragma Import(C, fl_set_positioner_xvalue, "fl_set_positioner_xvalue");

    pragma Import(C, fl_get_positioner_xvalue, "fl_get_positioner_xvalue");

    pragma Import(C, fl_set_positioner_xbounds, "fl_set_positioner_xbounds");

    pragma Import(C, fl_get_positioner_xbounds, "fl_get_positioner_xbounds");

    pragma Import(C, fl_set_positioner_yvalue, "fl_set_positioner_yvalue");

    pragma Import(C, fl_get_positioner_yvalue, "fl_get_positioner_yvalue");

    pragma Import(C, fl_set_positioner_ybounds, "fl_set_positioner_ybounds");

    pragma Import(C, fl_get_positioner_ybounds, "fl_get_positioner_ybounds");

    pragma Import(C, fl_set_positioner_xstep, "fl_set_positioner_xstep");

    pragma Import(C, fl_set_positioner_ystep, "fl_set_positioner_ystep");

    pragma Import(C, fl_set_positioner_return, "fl_set_positioner_return");

    pragma Import(C, fl_set_slider_value, "fl_set_slider_value");

    pragma Import(C, fl_get_slider_value, "fl_get_slider_value");

    pragma Import(C, fl_set_slider_bounds, "fl_set_slider_bounds");

    pragma Import(C, fl_get_slider_bounds, "fl_get_slider_bounds");

    pragma Import(C, fl_set_slider_return, "fl_set_slider_return");

    pragma Import(C, fl_set_slider_step, "fl_set_slider_step");
    pragma Import(C, fl_set_slider_increment, "fl_set_slider_increment");
    pragma Import(C, fl_set_slider_size, "fl_set_slider_size");
    pragma Import(C, fl_set_slider_precision, "fl_set_slider_precision");

    pragma Import(C, fl_set_slider_filter, "fl_set_slider_filter");

    pragma Import(C, fl_clear_textbox, "fl_clear_textbox");     -- forms.h:2699
    pragma Import(C, fl_set_textbox_topline, "fl_set_textbox_topline");
                                                                -- forms.h:2700
    pragma Import(C, fl_set_textbox_xoffset, "fl_set_textbox_xoffset");
                                                                -- forms.h:2701
    pragma Import(C, fl_get_textbox_longestline, "fl_get_textbox_longestline");
                                                                -- forms.h:2702
    pragma Import(C, fl_set_timer, "fl_set_timer");
    pragma Import(C, fl_get_timer, "fl_get_timer");
    pragma Import(C, fl_set_timer_countup, "fl_set_timer_countup");
                                                                -- forms.h:2748
    pragma Import(C, fl_set_timer_filter, "fl_set_timer_filter");
                                                                -- forms.h:2749
    pragma Import(C, fl_suspend_timer, "fl_suspend_timer");     -- forms.h:2750
    pragma Import(C, fl_resume_timer, "fl_resume_timer");       -- forms.h:2751
    pragma Import(C, fl_set_xyplot_return, "fl_set_xyplot_return");

    pragma Import(C, fl_set_xyplot_xtics, "fl_set_xyplot_xtics");

    pragma Import(C, fl_set_xyplot_ytics, "fl_set_xyplot_ytics");

    pragma Import(C, fl_set_xyplot_xbounds, "fl_set_xyplot_xbounds");

    pragma Import(C, fl_set_xyplot_ybounds, "fl_set_xyplot_ybounds");

    pragma Import(C, fl_get_xyplot_xbounds, "fl_get_xyplot_xbounds");

    pragma Import(C, fl_get_xyplot_ybounds, "fl_get_xyplot_ybounds");

    pragma Import(C, fl_get_xyplot, "fl_get_xyplot");
    pragma Import(C, fl_get_xyplot_data, "fl_get_xyplot_data");
    pragma Import(C, fl_set_xyplot_maxoverlays, "fl_set_xyplot_maxoverlays");
    pragma Import(C, fl_add_xyplot_overlay, "fl_add_xyplot_overlay");

    pragma Import(C, fl_set_xyplot_overlay_type, "fl_set_xyplot_overlay_type");

    pragma Import(C, fl_delete_xyplot_overlay, "fl_delete_xyplot_overlay");

    pragma Import(C, fl_set_xyplot_interpolate, "fl_set_xyplot_interpolate");

    pragma Import(C, fl_set_xyplot_fontsize, "fl_set_xyplot_fontsize");

    pragma Import(C, fl_set_xyplot_fontstyle, "fl_set_xyplot_fontstyle");

    pragma Import(C, fl_set_xyplot_inspect, "fl_set_xyplot_inspect");

    pragma Import(C, fl_set_xyplot_symbolsize, "fl_set_xyplot_symbolsize");

    pragma Import(C, fl_set_xyplot_xscale, "fl_set_xyplot_xscale");

    pragma Import(C, fl_set_xyplot_yscale, "fl_set_xyplot_yscale");

    pragma Import(C, fl_replace_xyplot_point, "fl_replace_xyplot_point");

    pragma Import(C, fl_get_xyplot_xmapping, "fl_get_xyplot_xmapping");

    pragma Import(C, fl_get_xyplot_ymapping, "fl_get_xyplot_ymapping");

    pragma Import(C, fl_clear_xyplot, "fl_clear_xyplot");       -- forms.h:2851
    pragma Import(C, fl_set_xyplot_linewidth, "fl_set_xyplot_linewidth");
                                                                -- forms.h:2852
    pragma Import(C, fl_set_xyplot_xgrid, "fl_set_xyplot_xgrid");
                                                                -- forms.h:2853
    pragma Import(C, fl_set_xyplot_ygrid, "fl_set_xyplot_ygrid");
    pragma Import(C, fl_interpolate, "fl_interpolate");
    pragma Import(C, fl_xyplot_s2w, "fl_xyplot_s2w");
    pragma Import(C, fl_xyplot_w2s, "fl_xyplot_w2s");

    pragma Import(C, fl_ringbell, "fl_ringbell");                -- forms.h:867
    pragma Import(C, fl_gettime, "fl_gettime" );
    pragma Import(C, fl_mouse_button, "fl_mouse_button" );
    pragma Import(C, fl_get_linewidth, "fl_get_linewidth" );
    pragma Import(C, fl_get_linestyle, "fl_get_linestyle" );
    pragma Import(C, fl_get_drawmode, "fl_get_drawmode" );
    pragma Import(C, fl_set_idle_delta, "fl_set_idle_delta" );
    pragma Import(C, fl_activate_glcanvas, "fl_activate_glcanvas" );

end forms;
