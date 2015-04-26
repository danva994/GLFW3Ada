with Glfw3.C_API;  use Glfw3.C_API;

package body Glfw3.Hints is

   use Interfaces.C;
   use Conversions;

   function To_Int (Val : Boolean) return int is
   begin
      if Val then
         return 1;
      else
         return 0;
      end if;
   end To_Int;

   procedure Default_Window_Hints is
   begin
      glfwDefaultWindowHints;
   end Default_Window_Hints;

   procedure Window_Hint (Target : Hint_Target; Value : Integer) is
   begin
      glfwWindowHint (To_Int (Target), int (Value));
   end Window_Hint;

   procedure Window_Hint (Target : Hint_Target; Value : Boolean) is
   begin
      glfwWindowHint (To_Int (Target), To_Int (Value));
   end Window_Hint;

   procedure Window_Hint (Target : Hint_Target; Value : Opengl_Api_Kind) is
   begin
      glfwWindowHint (To_Int (Target), To_Int (Value));
   end Window_Hint;

   procedure Window_Hint
     (Target : Hint_Target;
      Value  : Context_Robustness_Kind) is
   begin
      glfwWindowHint (To_Int (Target), To_Int (Value));
   end Window_Hint;

   procedure Window_Hint (Target : Hint_Target; Value : Opengl_Profile_Kind) is
   begin
      glfwWindowHint (To_Int (Target), To_Int (Value));
   end Window_Hint;

   procedure Window_Hint
     (Target : Hint_Target;
      Value  : Context_Release_Behavior_Kind) is
   begin
      glfwWindowHint (To_Int (Target), To_Int (Value));
   end Window_Hint;

end Glfw3.Hints;
