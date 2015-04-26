with Glfw3.C_API; use Glfw3.C_API;

package body Glfw3.Timer is

   function Get_Time return Seconds is
   begin
      return Seconds (glfwGetTime);
   end Get_Time;

   procedure Set_Time (Time : Seconds) is
   begin
      glfwSetTime (Interfaces.C.double (Time));
   end Set_Time;

end Glfw3.Timer;
