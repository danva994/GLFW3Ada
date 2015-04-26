with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Glfw3.C_API;          use Glfw3.C_API;
with Ada.Unchecked_Deallocation;

package body Glfw3.Windows is

   use type System.Address;
   use Glfw3.Hints.Conversions;
   use Glfw3.Input.Conversions;
   use Glfw3.Input.Keys.Conversions;
   use Glfw3.Input.Mouse.Conversions;
   use Glfw3.Input.Cursors.Conversions;

   function To_Int (Val : Boolean) return int is
   begin
      if Val then
         return 1;
      else
         return 0;
      end if;
   end To_Int;

   function To_Boolean (Val : int) return Boolean is
   begin
      if Val = 1 then
         return True;
      else
         return False;
      end if;
   end To_Boolean;

   -- Get rid of anoying warning because of the class wide pointer.
   pragma Warnings (Off);

   procedure glfwSetWindowUserPointer
     (the_window : System.Address;
      pointer    : not null access Window'Class);
   pragma Import (C, glfwSetWindowUserPointer, "glfwSetWindowUserPointer");

   function glfwGetWindowUserPointer
     (the_window : System.Address) return not null access Window'Class;
   pragma Import (C, glfwGetWindowUserPointer, "glfwGetWindowUserPointer");

   pragma Warnings (On);

   procedure Free is new Ada.Unchecked_Deallocation
     (Window_Data,
      Window_Data_Access);

   ---------------------------------------------------------------------------

   overriding procedure Adjust (The_Window : in out Window) is
   begin
      if The_Window.Data /= null then
         The_Window.Data.Count := The_Window.Data.Count + 1;
      end if;
   end Adjust;

   overriding procedure Finalize (The_Window : in out Window) is
   begin
      if The_Window.Data /= null then
         The_Window.Data.Count := The_Window.Data.Count - 1;
         if The_Window.Data.Count = 0 then
            if The_Window.Data.Handle /= System.Null_Address then
               glfwDestroyWindow (The_Window.Data.Handle);
            end if;
            Free (The_Window.Data);
            The_Window.Data := null;
         end if;
      end if;
   end Finalize;

   procedure Create
     (The_Window         : not null access Window;
      Width              : Natural;
      Height             : Natural;
      Title              : String               := "";
      Fullscreen_Monitor : access Monitor'Class := null;
      Share              : access Window'Class  := null) is

      Monitor_Handle : System.Address := System.Null_Address;
      Share_Handle   : System.Address := System.Null_Address;
      C_Title        : chars_ptr;

   begin

      if The_Window.Data /= null then
         The_Window.Destroy;
      end if;

      if Fullscreen_Monitor /= null then
         Monitor_Handle := Fullscreen_Monitor.Get_Handle;
      end if;

      if (Share /= null) and then (Share.Data /= null) then
         Share_Handle := Share.Data.Handle;
      end if;

      The_Window.Data := new Window_Data'((others => <>));

      C_Title := New_String (Title);

      The_Window.Data.Handle :=
        glfwCreateWindow
          (width   => int (Width),
           height  => int (Height),
           title   => C_Title,
           monitor => Monitor_Handle,
           share   => Share_Handle);

      Free (C_Title);

      -- Creation failed.
      if The_Window.Data.Handle = System.Null_Address then
         Free (The_Window.Data);
         The_Window.Data := null;
         raise Window_Creation_Exception;
      end if;

      The_Window.Data.Fullscreen_Monitor := Fullscreen_Monitor;
      glfwSetWindowUserPointer (The_Window.Data.Handle, The_Window);

   end Create;

   function Is_Created (The_Window : not null access Window) return Boolean is
   begin
      return The_Window.Data /= null;
   end Is_Created;

   procedure Destroy (The_Window : not null access Window) is
   begin
      if The_Window.Data /= null then
         if The_Window.Data.Handle /= System.Null_Address then
            glfwDestroyWindow (The_Window.Data.Handle);
         end if;
         Free (The_Window.Data);
         The_Window.Data := null;
      end if;
   end Destroy;

   function Should_Close
     (The_Window : not null access Window) return Boolean is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return glfwWindowShouldClose (The_Window.Data.Handle) = 1;
   end Should_Close;

   procedure Set_Should_Close
     (The_Window : not null access Window;
      Value      : Boolean) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetWindowShouldClose (The_Window.Data.Handle, To_Int (Value));
   end Set_Should_Close;

   procedure Set_Title (The_Window : not null access Window; Title : String) is
      Local : chars_ptr;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      Local := New_String (Title);
      glfwSetWindowTitle (The_Window.Data.Handle, Local);
      Free (Local);
   end Set_Title;

   procedure Get_Position
     (The_Window :     not null access Window;
      X_Pos      : out Integer;
      Y_Pos      : out Integer) is
      A, B : aliased int := 0;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwGetWindowPos (The_Window.Data.Handle, A'Access, B'Access);
      X_Pos := Integer (A);
      Y_Pos := Integer (B);
   end Get_Position;

   procedure Set_Position
     (The_Window : not null access Window;
      X_Pos      : Integer;
      Y_Pos      : Integer) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetWindowPos (The_Window.Data.Handle, int (X_Pos), int (Y_Pos));
   end Set_Position;

   procedure Get_Size
     (The_Window :     not null access Window;
      Width      : out Natural;
      Height     : out Natural) is
      A, B : aliased int := 0;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwGetWindowSize (The_Window.Data.Handle, A'Access, B'Access);
      Width  := Natural (A);
      Height := Natural (B);
   end Get_Size;

   procedure Set_Size
     (The_Window : not null access Window;
      Width      : Natural;
      Height     : Natural) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetWindowSize (The_Window.Data.Handle, int (Width), int (Height));
   end Set_Size;

   procedure Get_Framebuffer_Size
     (The_Window :     not null access Window;
      Width      : out Natural;
      Height     : out Natural) is
      A, B : aliased int := 0;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwGetFramebufferSize (The_Window.Data.Handle, A'Access, B'Access);
      Width  := Natural (A);
      Height := Natural (B);
   end Get_Framebuffer_Size;

   procedure Get_Frame_Size
     (The_Window :     not null access Window;
      Left       : out Integer;
      Top        : out Integer;
      Right      : out Integer;
      Bottom     : out Integer) is
      A, B, C, D : aliased int := 0;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwGetWindowFrameSize
        (The_Window.Data.Handle,
         A'Access,
         B'Access,
         C'Access,
         D'Access);
      Left   := Integer (A);
      Top    := Integer (B);
      Right  := Integer (C);
      Bottom := Integer (D);
   end Get_Frame_Size;

   procedure Iconify (The_Window : not null access Window) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwIconifyWindow (The_Window.Data.Handle);
   end Iconify;

   procedure Restore (The_Window : not null access Window) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwRestoreWindow (The_Window.Data.Handle);
   end Restore;

   procedure Show (The_Window : not null access Window) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwShowWindow (The_Window.Data.Handle);
   end Show;

   procedure Hide (The_Window : not null access Window) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwHideWindow (The_Window.Data.Handle);
   end Hide;

   function Get_Monitor
     (The_Window : not null access Window) return access Monitor'Class is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return The_Window.Data.Fullscreen_Monitor;
   end Get_Monitor;

   function Get_Attribute
     (The_Window : not null access Window;
      Attribute  : Hint_Target) return Integer is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return Integer
          (glfwGetWindowAttrib (The_Window.Data.Handle, To_Int (Attribute)));
   end Get_Attribute;

   procedure Make_Context_Current (The_Window : not null access Window) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwMakeContextCurrent (The_Window.Data.Handle);
   end Make_Context_Current;

   procedure Swap_Buffers (The_Window : not null access Window) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSwapBuffers (The_Window.Data.Handle);
   end Swap_Buffers;

   procedure Set_Clipboard_String
     (The_Window : not null access Window;
      Text       : String) is
      Local : chars_ptr;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      Local := New_String (Text);
      glfwSetClipboardString (The_Window.Data.Handle, Local);
      Free (Local);
   end Set_Clipboard_String;

   function Get_Clipboard_String
     (The_Window : not null access Window) return String is
      Ptr : chars_ptr;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      Ptr := glfwGetClipboardString (The_Window.Data.Handle);
      if Ptr = Null_Ptr then
         return "";
      else
         return Value (Ptr);
      end if;
   end Get_Clipboard_String;

   procedure Set_Cursor
     (The_Window : not null access Window;
      The_Cursor : Cursor) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetCursor (The_Window.Data.Handle, The_Cursor.Get_Handle);
   end Set_Cursor;

   procedure Get_Cursor_Position
     (The_Window :     not null access Window;
      X_Pos      : out Long_Float;
      Y_Pos      : out Long_Float) is
      A, B : aliased double := 0.0;
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwGetCursorPos (The_Window.Data.Handle, A'Access, B'Access);
      X_Pos := Long_Float (A);
      Y_Pos := Long_Float (B);
   end Get_Cursor_Position;

   procedure Set_Cursor_Position
     (The_Window : not null access Window;
      X_Pos      : Long_Float;
      Y_Pos      : Long_Float) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetCursorPos
        (The_Window.Data.Handle,
         double (X_Pos),
         double (Y_Pos));
   end Set_Cursor_Position;

   function Get_Cursor_Mode
     (The_Window : not null access Window) return Cursor_Mode is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return To_Enum (glfwGetInputMode (The_Window.Data.Handle, GLFW_CURSOR));
   end Get_Cursor_Mode;

   procedure Set_Cursor_Mode
     (The_Window : not null access Window;
      Mode       : Cursor_Mode) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetInputMode (The_Window.Data.Handle, GLFW_CURSOR, To_Int (Mode));
   end Set_Cursor_Mode;

   function Get_Sticky_Keys
     (The_Window : not null access Window) return Boolean is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return glfwGetInputMode (The_Window.Data.Handle, GLFW_STICKY_KEYS) = 1;
   end Get_Sticky_Keys;

   procedure Set_Sticky_Keys
     (The_Window : not null access Window;
      Enable     : Boolean) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetInputMode
        (The_Window.Data.Handle,
         GLFW_STICKY_KEYS,
         To_Int (Enable));
   end Set_Sticky_Keys;

   function Get_Sticky_Mouse_Buttons
     (The_Window : not null access Window) return Boolean is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return glfwGetInputMode
          (The_Window.Data.Handle,
           GLFW_STICKY_MOUSE_BUTTONS) =
        1;
   end Get_Sticky_Mouse_Buttons;

   procedure Set_Sticky_Mouse_Buttons
     (The_Window : not null access Window;
      Enable     : Boolean) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      glfwSetInputMode
        (The_Window.Data.Handle,
         GLFW_STICKY_MOUSE_BUTTONS,
         To_Int (Enable));
   end Set_Sticky_Mouse_Buttons;

   function Get_Key
     (The_Window : not null access Window;
      The_Key    : Key) return Action is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return To_Enum (glfwGetKey (The_Window.Data.Handle, To_Int (The_Key)));
   end Get_Key;

   function Get_Mouse_Button
     (The_Window : not null access Window;
      Button     : Mouse_Button) return Action is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      return To_Enum
          (glfwGetMouseButton (The_Window.Data.Handle, To_Int (Button)));
   end Get_Mouse_Button;

   procedure Set_User_Pointer
     (The_Window : not null access Window;
      Pointer    : System.Address) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      else
         The_Window.Data.User_Pointer := Pointer;
      end if;
   end Set_User_Pointer;

   function Get_User_Pointer
     (The_Window : not null access Window) return System.Address is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      else
         return The_Window.Data.User_Pointer;
      end if;
   end Get_User_Pointer;

   function Get_Handle
     (The_Window : not null access Window) return System.Address is
   begin
      if The_Window.Data = null then
         return System.Null_Address;
      else
         return The_Window.Data.Handle;
      end if;
   end Get_Handle;

   ---------------------------------------------------------------------------
   -- PROXY CALLBACK FUNCTIONS
   ---------------------------------------------------------------------------

   procedure Window_Pos_Fun_proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int);
   pragma Convention (C, Window_Pos_Fun_proxy);

   procedure Window_Size_fun_proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int);
   pragma Convention (C, Window_Size_fun_proxy);

   procedure Window_Close_Fun_Proxy (arg1 : System.Address);
   pragma Convention (C, Window_Close_Fun_Proxy);

   procedure Window_Refresh_Fun_Proxy (arg1 : System.Address);
   pragma Convention (C, Window_Refresh_Fun_Proxy);

   procedure Window_Focus_Fun_Proxy (arg1 : System.Address; arg2 : int);
   pragma Convention (C, Window_Focus_Fun_Proxy);

   procedure Window_Iconify_Fun_Proxy (arg1 : System.Address; arg2 : int);
   pragma Convention (C, Window_Iconify_Fun_Proxy);

   procedure Framebuffer_Size_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int);
   pragma Convention (C, Framebuffer_Size_Fun_Proxy);

   procedure Mouse_Button_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int;
      arg4 : int);
   pragma Convention (C, Mouse_Button_Fun_Proxy);

   procedure Cursor_Pos_Fun_Proxy
     (arg1 : System.Address;
      arg2 : double;
      arg3 : double);
   pragma Convention (C, Cursor_Pos_Fun_Proxy);

   procedure Cursor_Enter_Fun_Proxy (arg1 : System.Address; arg2 : int);
   pragma Convention (C, Cursor_Enter_Fun_Proxy);

   procedure Scroll_Fun_Proxy
     (arg1 : System.Address;
      arg2 : double;
      arg3 : double);
   pragma Convention (C, Scroll_Fun_Proxy);

   procedure Key_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : int);
   pragma Convention (C, Key_Fun_Proxy);

   procedure Char_Fun_Proxy (arg1 : System.Address; arg2 : unsigned);
   pragma Convention (C, Char_Fun_Proxy);

   procedure Char_Mods_Fun_Proxy
     (arg1 : System.Address;
      arg2 : unsigned;
      arg3 : int);
   pragma Convention (C, Char_Mods_Fun_Proxy);

   procedure Drop_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : chars_ptr_pointers.Pointer);
   pragma Convention (C, Drop_Fun_Proxy);

   ---------------------------------------------------------------------------
   -- Proxy fun implementation

   procedure Window_Pos_Fun_proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Window_Pos_Fun /= null then
         Source.Data.My_Window_Pos_Fun.all
           (Source,
            Integer (arg2),
            Integer (arg3));
      end if;
   end Window_Pos_Fun_proxy;

   procedure Window_Size_fun_proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Window_Size_Fun /= null then
         Source.Data.My_Window_Size_Fun.all
           (Source,
            Natural (arg2),
            Natural (arg3));
      end if;
   end Window_Size_fun_proxy;

   procedure Window_Close_Fun_Proxy (arg1 : System.Address) is
      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Window_Close_Fun /= null then
         Source.Data.My_Window_Close_Fun.all (Source);
      end if;
   end Window_Close_Fun_Proxy;

   procedure Window_Refresh_Fun_Proxy (arg1 : System.Address) is
      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Window_Refresh_Fun /= null then
         Source.Data.My_Window_Refresh_Fun.all (Source);
      end if;
   end Window_Refresh_Fun_Proxy;

   procedure Window_Focus_Fun_Proxy (arg1 : System.Address; arg2 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Window_Focus_Fun /= null then
         Source.Data.My_Window_Focus_Fun.all (Source, To_Boolean (arg2));
      end if;
   end Window_Focus_Fun_Proxy;

   procedure Window_Iconify_Fun_Proxy (arg1 : System.Address; arg2 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Window_Iconify_Fun /= null then
         Source.Data.My_Window_Iconify_Fun.all (Source, To_Boolean (arg2));
      end if;
   end Window_Iconify_Fun_Proxy;

   procedure Framebuffer_Size_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Framebuffer_Size_Fun /= null then
         Source.Data.My_Framebuffer_Size_Fun.all
           (Source,
            Natural (arg2),
            Natural (arg3));
      end if;
   end Framebuffer_Size_Fun_Proxy;

   procedure Mouse_Button_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int;
      arg4 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Mouse_Button_Fun /= null then
         Source.Data.My_Mouse_Button_Fun.all
           (Source,
            To_Enum (arg2),
            To_Enum (arg3),
            Key_Modifier (arg4));
      end if;
   end Mouse_Button_Fun_Proxy;

   procedure Cursor_Pos_Fun_Proxy
     (arg1 : System.Address;
      arg2 : double;
      arg3 : double) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Cursor_Pos_Fun /= null then
         Source.Data.My_Cursor_Pos_Fun.all
           (Source,
            Long_Float (arg2),
            Long_Float (arg3));
      end if;
   end Cursor_Pos_Fun_Proxy;

   procedure Cursor_Enter_Fun_Proxy (arg1 : System.Address; arg2 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Cursor_Enter_Fun /= null then
         Source.Data.My_Cursor_Enter_Fun.all (Source, To_Boolean (arg2));
      end if;
   end Cursor_Enter_Fun_Proxy;

   procedure Scroll_Fun_Proxy
     (arg1 : System.Address;
      arg2 : double;
      arg3 : double) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Scroll_Fun /= null then
         Source.Data.My_Scroll_Fun.all
           (Source,
            Long_Float (arg2),
            Long_Float (arg3));
      end if;
   end Scroll_Fun_Proxy;

   procedure Key_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Key_Fun /= null then
         Source.Data.My_Key_Fun.all
           (Source,
            To_Enum (arg2),
            Integer (arg3),
            To_Enum (arg4),
            Key_Modifier (arg5));
      end if;
   end Key_Fun_Proxy;

   procedure Char_Fun_Proxy (arg1 : System.Address; arg2 : unsigned) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Char_Fun /= null then
         Source.Data.My_Char_Fun.all (Source, Natural (arg2));
      end if;
   end Char_Fun_Proxy;

   procedure Char_Mods_Fun_Proxy
     (arg1 : System.Address;
      arg2 : unsigned;
      arg3 : int) is

      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if Source.Data.My_Char_Mods_Fun /= null then
         Source.Data.My_Char_Mods_Fun.all
           (Source,
            Natural (arg2),
            Key_Modifier (arg3));
      end if;
   end Char_Mods_Fun_Proxy;

   procedure Drop_Fun_Proxy
     (arg1 : System.Address;
      arg2 : int;
      arg3 : chars_ptr_pointers.Pointer) is

      use chars_ptr_pointers;
      Source : constant not null access Window'Class :=
        glfwGetWindowUserPointer (arg1);
   begin
      if (Source.Data.My_Drop_Fun /= null)
        and then (arg2 > 0)
        and then (arg3 /= null) then
         declare
            Val   : constant chars_ptr_array := Value (arg3);
            Files : File_Name_Array (1 .. Positive (arg2));
         begin
            for I in Files'Range loop
               Files (I) :=
                 Ada.Strings.Unbounded.To_Unbounded_String
                   (Value (Val (size_t (I - 1))));
            end loop;
            Source.Data.My_Drop_Fun.all (Source, Files);
         end;
      end if;
   end Drop_Fun_Proxy;

   ---------------------------------------------------------------------------
   -- SET THE CALLBACKS

   procedure Set_Pos_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Pos_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Window_Pos_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetWindowPosCallback (The_Window.Data.Handle, null);
      else
         glfwSetWindowPosCallback
           (The_Window.Data.Handle,
            Window_Pos_Fun_proxy'Access);
      end if;
   end Set_Pos_Callback;

   procedure Set_Size_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Size_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Window_Size_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetWindowSizeCallback (The_Window.Data.Handle, null);
      else
         glfwSetWindowSizeCallback
           (The_Window.Data.Handle,
            Window_Size_fun_proxy'Access);
      end if;
   end Set_Size_Callback;

   procedure Set_Close_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Close_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Window_Close_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetWindowCloseCallback (The_Window.Data.Handle, null);
      else
         glfwSetWindowCloseCallback
           (The_Window.Data.Handle,
            Window_Close_Fun_Proxy'Access);
      end if;
   end Set_Close_Callback;

   procedure Set_Refresh_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Refresh_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Window_Refresh_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetWindowRefreshCallback (The_Window.Data.Handle, null);
      else
         glfwSetWindowRefreshCallback
           (The_Window.Data.Handle,
            Window_Refresh_Fun_Proxy'Access);
      end if;
   end Set_Refresh_Callback;

   procedure Set_Focus_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Focus_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Window_Focus_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetWindowFocusCallback (The_Window.Data.Handle, null);
      else
         glfwSetWindowFocusCallback
           (The_Window.Data.Handle,
            Window_Focus_Fun_Proxy'Access);
      end if;
   end Set_Focus_Callback;

   procedure Set_Iconify_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Window_Iconify_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Window_Iconify_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetWindowIconifyCallback (The_Window.Data.Handle, null);
      else
         glfwSetWindowIconifyCallback
           (The_Window.Data.Handle,
            Window_Iconify_Fun_Proxy'Access);
      end if;
   end Set_Iconify_Callback;

   procedure Set_Framebuffer_Size_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Framebuffer_Size_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Framebuffer_Size_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetFramebufferSizeCallback (The_Window.Data.Handle, null);
      else
         glfwSetFramebufferSizeCallback
           (The_Window.Data.Handle,
            Framebuffer_Size_Fun_Proxy'Access);
      end if;
   end Set_Framebuffer_Size_Callback;

   procedure Set_Key_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Key_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Key_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetKeyCallback (The_Window.Data.Handle, null);
      else
         glfwSetKeyCallback (The_Window.Data.Handle, Key_Fun_Proxy'Access);
      end if;
   end Set_Key_Callback;

   procedure Set_Char_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Char_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Char_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetCharCallback (The_Window.Data.Handle, null);
      else
         glfwSetCharCallback (The_Window.Data.Handle, Char_Fun_Proxy'Access);
      end if;
   end Set_Char_Callback;

   procedure Set_Char_Mods_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Char_Mods_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Char_Mods_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetCharModsCallback (The_Window.Data.Handle, null);
      else
         glfwSetCharModsCallback
           (The_Window.Data.Handle,
            Char_Mods_Fun_Proxy'Access);
      end if;
   end Set_Char_Mods_Callback;

   procedure Set_Mouse_Button_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Mouse_Button_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Mouse_Button_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetMouseButtonCallback (The_Window.Data.Handle, null);
      else
         glfwSetMouseButtonCallback
           (The_Window.Data.Handle,
            Mouse_Button_Fun_Proxy'Access);
      end if;
   end Set_Mouse_Button_Callback;

   procedure Set_Cursor_Pos_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Cursor_Pos_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Cursor_Pos_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetCursorPosCallback (The_Window.Data.Handle, null);
      else
         glfwSetCursorPosCallback
           (The_Window.Data.Handle,
            Cursor_Pos_Fun_Proxy'Access);
      end if;
   end Set_Cursor_Pos_Callback;

   procedure Set_Cursor_Enter_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Cursor_Enter_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Cursor_Enter_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetCursorEnterCallback (The_Window.Data.Handle, null);
      else
         glfwSetCursorEnterCallback
           (The_Window.Data.Handle,
            Cursor_Enter_Fun_Proxy'Access);
      end if;
   end Set_Cursor_Enter_Callback;

   procedure Set_Scroll_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Scroll_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Scroll_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetScrollCallback (The_Window.Data.Handle, null);
      else
         glfwSetScrollCallback
           (The_Window.Data.Handle,
            Scroll_Fun_Proxy'Access);
      end if;
   end Set_Scroll_Callback;

   procedure Set_Drop_Callback
     (The_Window : not null access Window;
      Cb_Fun     : Drop_Fun) is
   begin
      if The_Window.Data = null then
         raise Null_Window_Exception;
      end if;
      The_Window.Data.My_Drop_Fun := Cb_Fun;
      if Cb_Fun = null then
         glfwSetDropCallback (The_Window.Data.Handle, null);
      else
         glfwSetDropCallback (The_Window.Data.Handle, Drop_Fun_Proxy'Access);
      end if;
   end Set_Drop_Callback;

end Glfw3.Windows;
