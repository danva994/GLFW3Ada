package Glfw3.Versions is

   Version_Major    : constant := 3;
   Version_Minor    : constant := 1;
   Version_Revision : constant := 1;

   procedure Get_Version
     (Major    : out Integer;
      Minor    : out Integer;
      Revision : out Integer);

   function Get_Version_String return String;

end Glfw3.Versions;
