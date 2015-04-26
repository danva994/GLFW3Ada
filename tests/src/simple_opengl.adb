-- This tests shows how to draw quads with opengl legacy and handle
-- the resize event from a window to change the viewport.

with Glfw3.Main;
with Glfw3.Windows;
with Glfw3.Events;
with Glfw3.Monitors;
with Glfw3.Hints;
with Ada.Text_IO;
with Ada.Exceptions;

with GL; use GL;

procedure Simple_Opengl is

   procedure On_FB_Resize
     (The_Window : not null access Glfw3.Windows.Window'Class;
      Width      : Natural;
      Height     : Natural)
   is
      pragma Unreferenced (The_Window);
   begin
      glViewport (0, 0, GLsizei (Width), GLsizei (Height));
   end On_FB_Resize;

   procedure Draw_Quad (X, Y, Width, Height : GLint) is
   begin
      glBegin (GL_QUADS);
      glVertex2i (X, Y);
      glVertex2i (X + Width, Y);
      glVertex2i (X + Width, Y + Height);
      glVertex2i (X, Y + Height);
      glEnd;
   end Draw_Quad;

   Main_Window  : aliased Glfw3.Windows.Window;
   Main_Monitor : Glfw3.Monitors.Monitor;
   Desktop_Mode : Glfw3.Monitors.Video_Mode;

   Start_Width        : constant := 640;
   Start_Height       : constant := 480;
   Center_X, Center_Y : Integer  := 0;

begin

   Glfw3.Main.Init;

   Main_Monitor := Glfw3.Monitors.Get_Primary_Monitor;
   Desktop_Mode := Main_Monitor.Get_Video_Mode;
   Center_X     := (Desktop_Mode.Width - Start_Width) / 2;
   Center_Y     := (Desktop_Mode.Height - Start_Height) / 2;

   Glfw3.Hints.Default_Window_Hints;
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Visible, False);
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Resizable, True);
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Context_Version_Major, 1);
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Context_Version_Minor, 0);

   Main_Window.Create (Start_Width, Start_Height, "simple_opengl.adb");
   Main_Window.Set_Framebuffer_Size_Callback (On_FB_Resize'Unrestricted_Access);
   Main_Window.Make_Context_Current;

   Main_Window.Set_Position (Center_X, Center_Y);
   Main_Window.Show;

   declare
      FB_Width, FB_Height : Natural;
   begin
      Main_Window.Get_Framebuffer_Size (FB_Width, FB_Height);
      glViewport (0, 0, GLsizei (FB_Width), GLsizei (FB_Height));
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      glOrtho (0.0, GLdouble (FB_Width), GLdouble (FB_Height), 0.0, 0.0, -1.0);
      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
   end;

   while not Main_Window.Should_Close loop

      Glfw3.Events.Poll_Events;

      glClearColor (0.0, 0.0, 0.0, 1.0);
      glClear (GL_COLOR_BUFFER_BIT);

      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;

      glColor4f (1.0, 0.0, 0.0, 1.0);
      Draw_Quad (100, 100, 100, 100);
      glColor4f (0.0, 1.0, 0.0, 1.0);
      Draw_Quad (200, 200, 100, 100);
      glColor4f (0.0, 1.0, 1.0, 1.0);
      Draw_Quad (300, 300, 100, 100);

      Main_Window.Swap_Buffers;

      delay 0.01;

   end loop;

   Main_Window.Destroy;
   Glfw3.Main.Quit;

exception
   when E : Glfw3.Main.Init_Failed_Exception =>
      Ada.Text_IO.Put_Line ("Oh well failed to init GLFW");
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
   when E : Glfw3.Windows.Window_Creation_Exception =>
      Ada.Text_IO.Put_Line ("Wow window creation failed!");
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      Glfw3.Main.Quit;
   when E : others =>
      Ada.Text_IO.Put_Line ("I have no idea what happened!");
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      Glfw3.Main.Quit;

end Simple_Opengl;
