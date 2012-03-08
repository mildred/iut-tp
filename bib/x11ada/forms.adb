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

package body forms is
   
    use type X11.Unsigned_Long;
    use type X11.Pixmap;
    use type X11.Window;
   
    function FL_IS_UPBOX( T: in FL_BOX_TYPE ) return Boolean is
    begin
       return 
         T = FL_UP_BOX or
         T = FL_OVAL3D_UPBOX or
         T = FL_ROUNDED3D_UPBOX;
    end FL_IS_UPBOX;
    
    function FL_TO_DOWNBOX( T: in FL_BOX_TYPE ) return FL_BOX_TYPE is
    begin
       if T = FL_UP_BOX then
          return FL_DOWN_BOX;
       elsif T = FL_ROUNDED3D_UPBOX then
          return FL_ROUNDED3D_DOWNBOX;
       elsif T = FL_OVAL3D_UPBOX then
          return FL_OVAL3D_DOWNBOX;
       else
          return T;
       end if;
    end FL_TO_DOWNBOX;
    
    procedure fl_diagline(
                x: FL_Coord;
                y: FL_Coord;
                w: FL_Coord;
                h: FL_Coord;
                c: FL_COLOR) is
    begin
        fl_line( x,y,(x)+(w)-1,(y)+(h)-1,c) ;
    end fl_diagline;

    procedure fl_circf(
                x  : FL_Coord;
                y  : FL_Coord;
                r  : FL_Coord;
                col: FL_COLOR) is
    begin
        fl_oval(1,(x)-(r),(y)-(r),2*(r),2*(r),col);
    end fl_circf;



    procedure fl_circ(
                x  : FL_Coord;
                y  : FL_Coord;
                r  : FL_Coord;
                col: FL_COLOR) is
    begin
        fl_oval(0,(x)-(r),(y)-(r),2*(r),2*(r),col);
    end fl_circ;

    procedure fl_arcf(
                x : FL_Coord;
                y : FL_Coord;
                r : FL_Coord;
                a1: X11.Int;
                a2: X11.Int;
                c : FL_COLOR) is
    begin
        fl_pieslice(1,(x)-(r),(y)-(r), (2*r),(2*r),a1,a2,c);
    end fl_arcf;

    procedure fl_arc(
                x : FL_Coord;
                y : FL_Coord;
                r : FL_Coord;
                a1: X11.Int;
                a2: X11.Int;
                c : FL_COLOR) is
    begin
        fl_pieslice(0,(x)-(r),(y)-(r), (2*r),(2*r),a1,a2,c);
    end fl_arc;

    procedure fl_v2s(
                v: FL_Coord_array) is
    begin
        -- fl_add_vertex( v(0), v(1) );
       null; 
    end fl_v2s;

    procedure fl_v2i(
                v: FL_Coord_array) is
    begin
        -- fl_add_vertex( v(0), v(1) );
       null; 
    end fl_v2i;

    procedure fl_v2f(
                v: float_array) is
    begin
        -- fl_add_float_vertex( v(0), v(1) );
       null; 
    end fl_v2f;

    procedure fl_v2d(
                v: float_array) is
    begin
        -- fl_add_float_vertex( v(0), v(1) );
       null; 
    end fl_v2d;

    function fl_set_foreground(
                gc: X11.Xlib.GC;
                c : FL_COLOR)
               return X11.Int is
    begin
         X11.Xlib.XSetForeground(fl_display,gc,X11.unsigned_long(fl_get_pixel(c)));
         return 0;
    end fl_set_foreground;

    function fl_set_background(
                gc: X11.Xlib.GC;
                c : FL_COLOR)
               return X11.Int is
    begin
        X11.Xlib.XSetBackground(fl_display,gc,X11.unsigned_long(fl_get_pixel(c)));
         return 0;
    end fl_set_background;

--    procedure fl_set_text_clipping(
--                a: FL_Coord;
--                b: FL_Coord;
--                c: FL_Coord;
--                d: FL_Coord) is
--    begin
--        fl_set_gc_clipping(fl_textgc,a,b,c,d);
--    end fl_set_text_clipping;

--    procedure fl_unset_text_clipping is
--    begin
--        fl_unset_gc_clipping(fl_textgc);
--    end fl_unset_text_clipping;

    function fl_create_from_bitmapdata(
                win : X11.Drawable;
                data: X11.Strings.const_charp;
                w   : X11.unsigned_int;
                h   : X11.unsigned_int)
               return X11.Pixmap is
    begin
        return X11.Xlib.XCreateBitmapFromData(fl_get_display, win, data, w, h);
    end fl_create_from_bitmapdata;


    procedure fl_set_fselector_transient(
                b: Boolean) is
    begin
       if b then
          fl_set_fselector_border(FL_TRANSIENT);
       else
          fl_set_fselector_border(FL_FULLBORDER);
       end if;
    end fl_set_fselector_transient;

    procedure fl_set_fselector_title(
                s: X11.Strings.const_charp) is
    begin
        fl_set_form_title(fl_get_fselector_form,s);
    end fl_set_fselector_title;

    procedure Fl_Raise_Form (F: FL_FORM_Access )is
    begin
       if F.Window /= 0 then
          X.Xlib.XRaiseWindow(fl_display,F.window);
       end if;
    end Fl_Raise_Form;
    
    procedure Fl_Lower_Form (F: FL_FORM_Access ) is
    begin
       if F.Window /= 0 then
          X.Xlib.XLowerWindow(fl_display,F.window);
       end if;
    end Fl_Lower_Form;
    
    procedure fl_free_pixmap( Id: X11.Pixmap ) is
    begin
       if Id /= X11.None then
          X11.Xlib.XFreePixmap( Fl_Display, Id );
       end if;
    end fl_free_pixmap;
    
    procedure fl_reset_cursor( Win: X11.Window ) is
    begin
       fl_set_cursor( Win, FL_DEFAULT_CURSOR);
    end fl_reset_cursor;
    
    
--     function ringbell return X11.Int is
--     begin
--         X11.Xlib.XBell(fl_display, 0);
--         return 0;
--     end ringbell;

end forms;
