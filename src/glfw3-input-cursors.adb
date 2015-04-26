with Glfw3.C_API; use Glfw3.C_API;

package body Glfw3.Input.Cursors is

   use type System.Address;
   use Interfaces.C;
   use Conversions;

   function Create_Cursor
     (The_Image : not null access Image;
      X_Hot     : Integer;
      Y_Hot     : Integer) return Cursor is
      Local : aliased GLFWimage :=
        GLFWimage'
          (width  => int (The_Image.Width),
           height => int (The_Image.Height),
           pixels => The_Image.Pixels);
      Ptr : constant System.Address :=
        glfwCreateCursor (Local'Access, int (X_Hot), int (Y_Hot));
   begin
      if Ptr = System.Null_Address then
         return Null_Cursor;
      else
         return Cursor'(Ada.Finalization.Controlled with Handle => Ptr);
      end if;
   end Create_Cursor;

   function Create_Standard_Cursor (Shape : Standard_Cursor) return Cursor is
      Ptr : constant System.Address :=
        glfwCreateStandardCursor (To_Int (Shape));
   begin
      if Ptr = System.Null_Address then
         return Null_Cursor;
      else
         return Cursor'(Ada.Finalization.Controlled with Handle => Ptr);
      end if;
   end Create_Standard_Cursor;

   procedure Destroy (Object : in out Cursor) is
   begin
      if Object.Handle /= System.Null_Address then
         glfwDestroyCursor (Object.Handle);
         Object.Handle := System.Null_Address;
      end if;
   end Destroy;

   function Get_Handle (Object : Cursor) return System.Address is
   begin
      return Object.Handle;
   end Get_Handle;

end Glfw3.Input.Cursors;
