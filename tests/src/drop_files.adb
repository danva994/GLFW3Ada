-- This test shows how to to handle file drops into a window.

with Glfw3.Main;
with Glfw3.Windows;
with Glfw3.Events;
with Glfw3.Monitors;
with Glfw3.Hints;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Exceptions;

procedure Drop_Files is

   procedure On_Drop_Files
     (The_Window : not null access Glfw3.Windows.Window'Class;
      File_Names : Glfw3.Windows.File_Name_Array)
   is
      pragma Unreferenced (The_Window);
      use Ada.Text_IO;
      use Ada.Strings.Unbounded.Text_IO;
   begin
      Put_Line ("--|| File drop event ||--");
      Put_Line ("File count:" & Integer'Image (File_Names'Length));
      Put_Line ("File names:");
      for N in File_Names'Range loop
         Put_Line (File_Names (N));
      end loop;
   end On_Drop_Files;

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

   Main_Window.Create (Start_Width, Start_Height, "drop_files.adb");
   Main_Window.Set_Drop_Callback (On_Drop_Files'Unrestricted_Access);
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

end Drop_Files;
