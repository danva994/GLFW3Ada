with System;
with Ada.Finalization;
with Ada.Strings.Unbounded;
with Glfw3.Input;         use Glfw3.Input;
with Glfw3.Input.Cursors; use Glfw3.Input.Cursors;
with Glfw3.Input.Mouse;   use Glfw3.Input.Mouse;
with Glfw3.Input.Keys;    use Glfw3.Input.Keys;
with Glfw3.Hints;         use Glfw3.Hints;
with Glfw3.Monitors;      use Glfw3.Monitors;

package Glfw3.Windows is

   Null_Window_Exception : exception;
   Window_Creation_Exception : exception;

   -- Reference counted type with auto-destruction when the object
   -- goes out of scope. Windows must be declared aliased or be
   -- allocated on the heap.
   type Window is new Ada.Finalization.Controlled with private;
   type Window_Class_Access is access all Window'Class;
   Null_Window : constant Window;

   -- Overriding from the Controlled class to support reference counting.
   overriding procedure Adjust (The_Window : in out Window);
   overriding procedure Finalize (The_Window : in out Window);

   -- If the window was already created then it is destroyed and recreated from
   -- the given params. If it fails Window_Creation_Exception is raised.
   procedure Create
     (The_Window         : not null access Window;
      Width              : Natural;
      Height             : Natural;
      Title              : String               := "";
      Fullscreen_Monitor : access Monitor'Class := null;
      Share              : access Window'Class  := null);

   function Is_Created (The_Window : not null access Window) return Boolean;

   procedure Destroy (The_Window : not null access Window);

   -- Returns true if the window is flaged to be closed. You can change the
   -- flag with Set_Should_Close.
   function Should_Close (The_Window : not null access Window) return Boolean;

   procedure Set_Should_Close
     (The_Window : not null access Window;
      Value      : Boolean);

   procedure Set_Title (The_Window : not null access Window; Title : String);

   procedure Get_Position
     (The_Window :     not null access Window;
      X_Pos      : out Integer;
      Y_Pos      : out Integer);

   procedure Set_Position
     (The_Window : not null access Window;
      X_Pos      : Integer;
      Y_Pos      : Integer);

   procedure Get_Size
     (The_Window :     not null access Window;
      Width      : out Natural;
      Height     : out Natural);

   procedure Set_Size
     (The_Window : not null access Window;
      Width      : Natural;
      Height     : Natural);

   procedure Get_Framebuffer_Size
     (The_Window :     not null access Window;
      Width      : out Natural;
      Height     : out Natural);

   procedure Get_Frame_Size
     (The_Window :     not null access Window;
      Left       : out Integer;
      Top        : out Integer;
      Right      : out Integer;
      Bottom     : out Integer);

   procedure Iconify (The_Window : not null access Window);

   procedure Restore (The_Window : not null access Window);

   procedure Show (The_Window : not null access Window);

   procedure Hide (The_Window : not null access Window);

   function Get_Monitor
     (The_Window : not null access Window) return access Monitor'Class;

   function Get_Attribute
     (The_Window : not null access Window;
      Attribute  : Hint_Target) return Integer;

   -- Context handling

   procedure Make_Context_Current (The_Window : not null access Window);

   procedure Swap_Buffers (The_Window : not null access Window);

   -- Clipboard handling

   procedure Set_Clipboard_String
     (The_Window : not null access Window;
      Text       : String);

   function Get_Clipboard_String
     (The_Window : not null access Window) return String;

   -- Cursor handling

   procedure Set_Cursor
     (The_Window : not null access Window;
      The_Cursor : Cursor);

   procedure Get_Cursor_Position
     (The_Window :     not null access Window;
      X_Pos      : out Long_Float;
      Y_Pos      : out Long_Float);

   procedure Set_Cursor_Position
     (The_Window : not null access Window;
      X_Pos      : Long_Float;
      Y_Pos      : Long_Float);

   -- Input handling

   -- Implements the functionality from the glfwInputMode functions.

   function Get_Cursor_Mode
     (The_Window : not null access Window) return Cursor_Mode;

   procedure Set_Cursor_Mode
     (The_Window : not null access Window;
      Mode       : Cursor_Mode);

   function Get_Sticky_Keys
     (The_Window : not null access Window) return Boolean;

   procedure Set_Sticky_Keys
     (The_Window : not null access Window;
      Enable     : Boolean);

   function Get_Sticky_Mouse_Buttons
     (The_Window : not null access Window) return Boolean;

   procedure Set_Sticky_Mouse_Buttons
     (The_Window : not null access Window;
      Enable     : Boolean);

   function Get_Key
     (The_Window : not null access Window;
      The_Key    : Key) return Action;

   function Get_Mouse_Button
     (The_Window : not null access Window;
      Button     : Mouse_Button) return Action;

   -- User pointer handling. User pointers are stored in the window
   -- object and NOT the underlying GLFW window. This is so because
   -- this window class uses the GLFW user pointer internally.

   procedure Set_User_Pointer
     (The_Window : not null access Window;
      Pointer    : System.Address);

   function Get_User_Pointer
     (The_Window : not null access Window) return System.Address;

   -- The internal handle (GLFWwindow*) of the object.
   function Get_Handle
     (The_Window : not null access Window) return System.Address;

   ---------------------------------------------------------------------------
   -- Callback functionality to handle events. Calling Poll_Events
   -- or Wait_Events in Glfw3.Events will call this functions if they are set.

   type Window_Pos_Fun is access procedure
     (The_Window : not null access Window'Class;
      X_Pos      : Integer;
      Y_Pos      : Integer);

   type Window_Size_Fun is access procedure
     (The_Window : not null access Window'Class;
      Width      : Natural;
      Height     : Natural);

   type Window_Close_Fun is access procedure
     (The_Window : not null access Window'Class);

   type Window_Refresh_Fun is access procedure
     (The_Window : not null access Window'Class);

   type Window_Focus_Fun is access procedure
     (The_Window : not null access Window'Class;
      Focused    : Boolean);

   type Window_Iconify_Fun is access procedure
     (The_Window : not null access Window'Class;
      Iconified  : Boolean);

   type Framebuffer_Size_Fun is access procedure
     (The_Window : not null access Window'Class;
      Width      : Natural;
      Height     : Natural);

   type Mouse_Button_Fun is access procedure
     (The_Window : not null access Window'Class;
      Button     : Mouse_Button;
      The_Action : Action;
      Mods       : Key_Modifier);

   type Cursor_Pos_Fun is access procedure
     (The_Window : not null access Window'Class;
      X_Pos      : Long_Float;
      Y_Pos      : Long_Float);

   type Cursor_Enter_Fun is access procedure
     (The_Window : not null access Window'Class;
      Entered    : Boolean);

   type Scroll_Fun is access procedure
     (The_Window : not null access Window'Class;
      X_Offset   : Long_Float;
      Y_Offset   : Long_Float);

   type Key_Fun is access procedure
     (The_Window : not null access Window'Class;
      The_Key    : Key;
      Scancode   : Integer;
      The_Action : Action;
      Mods       : Key_Modifier);

   type Char_Fun is access procedure
     (The_Window : not null access Window'Class;
      Codepoint  : Natural);

   type Char_Mods_Fun is access procedure
     (The_Window : not null access Window'Class;
      Codepoint  : Natural;
      Mods       : Key_Modifier);

   type File_Name_Array is
     array (Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;

   type Drop_Fun is access procedure
     (The_Window : not null access Window'Class;
      File_Names : File_Name_Array);

   procedure Set_Pos_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Pos_Fun);

   procedure Set_Size_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Size_Fun);

   procedure Set_Close_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Close_Fun);

   procedure Set_Refresh_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Refresh_Fun);

   procedure Set_Focus_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Focus_Fun);

   procedure Set_Iconify_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Iconify_Fun);

   procedure Set_Framebuffer_Size_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Framebuffer_Size_Fun);

   procedure Set_Key_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Key_Fun);

   procedure Set_Char_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Char_Fun);

   procedure Set_Char_Mods_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Char_Mods_Fun);

   procedure Set_Mouse_Button_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Mouse_Button_Fun);

   procedure Set_Cursor_Pos_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Cursor_Pos_Fun);

   procedure Set_Cursor_Enter_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Cursor_Enter_Fun);

   procedure Set_Scroll_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Scroll_Fun);

   procedure Set_Drop_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Drop_Fun);

private

   type Window_Data is record
      Count              : Natural              := 1;
      Handle             : System.Address       := System.Null_Address;
      User_Pointer       : System.Address       := System.Null_Address;
      Fullscreen_Monitor : access Monitor'Class := null;
      -- Callback funs.
      My_Window_Pos_Fun       : Window_Pos_Fun       := null;
      My_Window_Size_Fun      : Window_Size_Fun      := null;
      My_Window_Close_Fun     : Window_Close_Fun     := null;
      My_Window_Refresh_Fun   : Window_Refresh_Fun   := null;
      My_Window_Focus_Fun     : Window_Focus_Fun     := null;
      My_Window_Iconify_Fun   : Window_Iconify_Fun   := null;
      My_Framebuffer_Size_Fun : Framebuffer_Size_Fun := null;
      My_Mouse_Button_Fun     : Mouse_Button_Fun     := null;
      My_Cursor_Pos_Fun       : Cursor_Pos_Fun       := null;
      My_Cursor_Enter_Fun     : Cursor_Enter_Fun     := null;
      My_Scroll_Fun           : Scroll_Fun           := null;
      My_Key_Fun              : Key_Fun              := null;
      My_Char_Fun             : Char_Fun             := null;
      My_Char_Mods_Fun        : Char_Mods_Fun        := null;
      My_Drop_Fun             : Drop_Fun             := null;
   end record;
   type Window_Data_Access is access all Window_Data;

   type Window is new Ada.Finalization.Controlled with record
      Data : Window_Data_Access := null;
   end record;

   Null_Window : constant Window :=
     Window'(Ada.Finalization.Controlled with Data => null);

end Glfw3.Windows;
