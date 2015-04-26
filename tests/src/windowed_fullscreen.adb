-- This test shows how to create a "windowed fullscreen" window.

with Glfw3.Main;
with Glfw3.Hints;
with Glfw3.Windows;
with Glfw3.Monitors;
with Glfw3.Events;
with Glfw3.Input;
with Glfw3.Input.Keys;
with Ada.Text_IO;
with Ada.Exceptions;

with GL; use GL;

procedure Windowed_Fullscreen is

   use type Glfw3.Input.Action;
   use type Glfw3.Input.Keys.Key;

   -- Press Escape to exit fullscreen mode.
   procedure On_Key
     (Source   : not null access Glfw3.Windows.Window'Class;
      Key      : Glfw3.Input.Keys.Key;
      Scancode : Integer;
      Action   : Glfw3.Input.Action;
      Mods     : Glfw3.Input.Keys.Key_Modifier)
   is
      pragma Unreferenced (Scancode, Mods);
   begin
      if (Key = Glfw3.Input.Keys.Key_Escape)
        and then (Action = Glfw3.Input.Release)
      then
         Source.Set_Should_Close (True);
      end if;
   end On_Key;

   Main_Window     : aliased Glfw3.Windows.Window;
   Main_Monitor    : Glfw3.Monitors.Monitor;
   Main_Video_Mode : Glfw3.Monitors.Video_Mode;

begin

   Glfw3.Main.Init;

   Main_Monitor    := Glfw3.Monitors.Get_Primary_Monitor;
   Main_Video_Mode := Main_Monitor.Get_Video_Mode;

   Glfw3.Hints.Window_Hint (Glfw3.Hints.Decorated, False);
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Red_Bits, Main_Video_Mode.Red_Bits);
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Green_Bits, Main_Video_Mode.Green_Bits);
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Blue_Bits, Main_Video_Mode.Blue_Bits);
   Glfw3.Hints.Window_Hint (Glfw3.Hints.Refresh_Rate, Main_Video_Mode.Refresh_Rate);

   Main_Window.Create (Main_Video_Mode.Width, Main_Video_Mode.Height);
   Main_Window.Set_Key_Callback (On_Key'Unrestricted_Access);
   Main_Window.Make_Context_Current;

   while not Main_Window.Should_Close loop
      Glfw3.Events.Wait_Events;
      glClearColor (0.0, 0.0, 0.0, 1.0);
      glClear (GL_COLOR_BUFFER_BIT);
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

end Windowed_Fullscreen;
