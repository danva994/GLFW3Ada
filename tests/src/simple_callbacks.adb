-- This test shows how to add callbacks to a window and handle events
-- in that way (mouse and key events).

with Glfw3.Main;
with Glfw3.Windows;
with Glfw3.Events;
with Glfw3.Input;
with Glfw3.Input.Keys;
with Glfw3.Input.Mouse;
with Ada.Text_IO;
with Ada.Exceptions;

procedure Simple_Callbacks is

   procedure On_Mouse_Button
     (Source : not null access Glfw3.Windows.Window'Class;
      Button : Glfw3.Input.Mouse.Mouse_Button;
      Action : Glfw3.Input.Action;
      Mods   : Glfw3.Input.Keys.Key_Modifier)
   is
      pragma Unreferenced (Mods);
   begin
      Source.Set_Title
      ("Mouse Button " &
       Glfw3.Input.Mouse.Mouse_Button'Image (Button) &
       " " &
       Glfw3.Input.Action'Image (Action));
   end On_Mouse_Button;

   procedure On_Key
     (Source   : not null access Glfw3.Windows.Window'Class;
      Key      : Glfw3.Input.Keys.Key;
      Scancode : Integer;
      Action   : Glfw3.Input.Action;
      Mods     : Glfw3.Input.Keys.Key_Modifier)
   is
      pragma Unreferenced (Scancode, Mods);
   begin
      Source.Set_Title
      ("Key " &
       Glfw3.Input.Keys.Key'Image (Key) &
       " " &
       Glfw3.Input.Action'Image (Action));
   end On_Key;

   Main_Window : aliased Glfw3.Windows.Window;

begin

   Glfw3.Main.Init;

   Main_Window.Create (640, 480, "simple_callbacks.adb");
   Main_Window.Make_Context_Current;

   Main_Window.Set_Mouse_Button_Callback (On_Mouse_Button'Unrestricted_Access);
   Main_Window.Set_Key_Callback (On_Key'Unrestricted_Access);

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

end Simple_Callbacks;
