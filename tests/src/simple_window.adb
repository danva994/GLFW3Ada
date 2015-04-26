with Glfw3.Main;
with Glfw3.Windows;
with Glfw3.Events;
with Ada.Text_IO;
with Ada.Exceptions;

procedure Simple_Window is

   Main_Window : aliased Glfw3.Windows.Window;

begin

   Glfw3.Main.Init;

   Main_Window.Create (640, 480, "Simple_Window.adb");
   Main_Window.Make_Context_Current;

   while not Main_Window.Should_Close loop
      Glfw3.Events.Wait_Events;
      Main_Window.Swap_Buffers;
   end loop;

   Main_Window.Destroy;
   Glfw3.Main.Quit;

exception
   when E : Glfw3.Main.Init_Failed_Exception =>
      Ada.Text_IO.Put_Line ("How can this happen!");
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
   when E : others =>
      Ada.Text_IO.Put_Line ("Well this is strange!");
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      Main_Window.Destroy;
      Glfw3.Main.Quit;

end Simple_Window;
