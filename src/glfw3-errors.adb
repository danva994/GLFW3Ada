with Interfaces.C.Strings; use Interfaces.C.Strings;
with Glfw3.C_API;          use Glfw3.C_API;

package body Glfw3.Errors is

   use Interfaces.C;
   use Conversions;

   Current_Error_Fun : Error_Fun := null;

   procedure Error_Fun_Proxy (The_Error : int; Description : chars_ptr);
   pragma Convention (C, Error_Fun_Proxy);

   procedure Error_Fun_Proxy (The_Error : int; Description : chars_ptr) is
   begin
      if Current_Error_Fun /= null then
         if Description /= Null_Ptr then
            Current_Error_Fun.all (To_Enum (The_Error), Value (Description));
         else
            Current_Error_Fun.all (To_Enum (The_Error), "");
         end if;
      end if;
   end Error_Fun_Proxy;

   procedure Set_Error_Callback (Cb_Fun : Error_Fun) is
   begin
      Current_Error_Fun := Cb_Fun;
      glfwSetErrorCallback (Error_Fun_Proxy'Access);
   end Set_Error_Callback;

end Glfw3.Errors;
