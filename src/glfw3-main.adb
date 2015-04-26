with Interfaces.C; use Interfaces.C;
with Glfw3.C_API;  use Glfw3.C_API;

package body Glfw3.Main is

   procedure Init is
   begin
      if glfwInit /= 1 then
         raise Init_Failed_Exception;
      end if;
   end Init;

   procedure Quit is
   begin
      glfwTerminate;
   end Quit;

end Glfw3.Main;
