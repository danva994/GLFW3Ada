with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Glfw3.C_API;          use Glfw3.C_API;

package body Glfw3.Versions is

   procedure Get_Version
     (Major    : out Integer;
      Minor    : out Integer;
      Revision : out Integer) is
      A, B, C : aliased int := 0;
   begin
      glfwGetVersion (A'Access, B'Access, C'Access);
      Major    := Integer (A);
      Minor    := Integer (B);
      Revision := Integer (C);
   end Get_Version;

   function Get_Version_String return String is
      Ptr : constant chars_ptr := glfwGetVersionString;
   begin
      if Ptr = Null_Ptr then
         return "";
      else
         return Value (Ptr);
      end if;
   end Get_Version_String;

end Glfw3.Versions;
