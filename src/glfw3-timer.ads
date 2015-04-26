with Interfaces.C;

package Glfw3.Timer is

   type Seconds is new Interfaces.C.double;

   function Get_Time return Seconds;

   procedure Set_Time (Time : Seconds);

end Glfw3.Timer;
