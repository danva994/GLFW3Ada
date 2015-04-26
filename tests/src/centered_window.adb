with Glfw3.Main;
with Glfw3.Windows;
with Glfw3.Events;
with Glfw3.Monitors;
with Glfw3.Hints;
with Ada.Text_IO;
with Ada.Exceptions;

procedure Centered_Window is

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
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Resizable, False);

   Main_Window.Create (Start_Width, Start_Height, "Centered_Window.adb");
   Main_Window.Make_Context_Current;

   Main_Window.Set_Position (Center_X, Center_Y);
   Main_Window.Show;

   while not Main_Window.Should_Close loop
      Glfw3.Events.Wait_Events;
      Main_Window.Swap_Buffers;
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

end Centered_Window;
