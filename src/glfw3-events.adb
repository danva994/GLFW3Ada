with Glfw3.C_API; use Glfw3.C_API;

package body Glfw3.Events is

   procedure Poll_Events is
   begin
      glfwPollEvents;
   end Poll_Events;

   procedure Wait_Events is
   begin
      glfwWaitEvents;
   end Wait_Events;

   procedure Post_Empty_Event is
   begin
      glfwPostEmptyEvent;
   end Post_Empty_Event;

end Glfw3.Events;
