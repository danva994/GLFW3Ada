package Glfw3.Windows.Context is

   function Get_Current_Context return access Window'Class;

   procedure Swap_Interval (Interval : Integer);

   function Extension_Supported (Extension : String) return Boolean;

   generic
      type Proc_Access is private;
      Null_Proc_Access : Proc_Access;
   function Get_Proc_Address (Proc_Name : String) return Proc_Access;

end Glfw3.Windows.Context;
