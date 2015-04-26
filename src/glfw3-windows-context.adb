with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Glfw3.C_API;          use Glfw3.C_API;
with Ada.Unchecked_Conversion;

package body Glfw3.Windows.Context is

   use type System.Address;

   function glfwGetWindowUserPointer
     (the_window : System.Address) return not null access Window'Class;
   pragma Import (C, glfwGetWindowUserPointer, "glfwGetWindowUserPointer");
   pragma Warnings (Off, glfwGetWindowUserPointer);

   function Get_Current_Context return access Window'Class is
      Handle : constant System.Address := glfwGetCurrentContext;
   begin
      if Handle = System.Null_Address then
         return null;
      else
         return glfwGetWindowUserPointer (Handle);
      end if;
   end Get_Current_Context;

   procedure Swap_Interval (Interval : Integer) is
   begin
      glfwSwapInterval (int (Interval));
   end Swap_Interval;

   function Extension_Supported (Extension : String) return Boolean is
      Str       : chars_ptr        := New_String (Extension);
      Supported : constant Boolean := glfwExtensionSupported (Str) = 1;
   begin
      Free (Str);
      return Supported;
   end Extension_Supported;

   function Get_Proc_Address (Proc_Name : String) return Proc_Access is

      function To_Proc_Access is new Ada.Unchecked_Conversion
        (Source => System.Address,
         Target => Proc_Access);

      Str  : chars_ptr               := New_String (Proc_Name);
      Addr : constant System.Address := glfwGetProcAddress (Str);
   begin
      Free (Str);
      if Addr = System.Null_Address then
         return Null_Proc_Access;
      else
         return To_Proc_Access (Addr);
      end if;
   end Get_Proc_Address;

end Glfw3.Windows.Context;
