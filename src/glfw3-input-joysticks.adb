with Interfaces.C.Strings; use Interfaces.C.Strings;
with Glfw3.C_API;          use Glfw3.C_API;

package body Glfw3.Input.Joysticks is

   use Interfaces.C;
   use Conversions;
   use Glfw3.Input.Conversions;

   function Joystick_Present (Joy : Joystick) return Boolean is
   begin
      return glfwJoystickPresent (To_Int (Joy)) = 1;
   end Joystick_Present;

   function Get_Joystick_Name (Joy : Joystick) return String is
      Ptr : constant chars_ptr := glfwGetJoystickName (To_Int (Joy));
   begin
      if Ptr = Null_Ptr then
         return "";
      else
         return Value (Ptr);
      end if;
   end Get_Joystick_Name;

   function Get_Joystick_Axes
     (Joy : Joystick) return Joystick_Axis_Value_Array is
      use c_float_pointers;
      Empty : constant Joystick_Axis_Value_Array (1 .. 0) := (others => 0.0);
      Count : aliased int                                 := 0;
      Ptr   : constant c_float_pointers.Pointer           :=
        glfwGetJoystickAxes (To_Int (Joy), Count'Access);
   begin
      if Ptr = null or Count = 0 then
         return Empty;
      else
         declare
            Val : constant c_float_array := Value (Ptr, ptrdiff_t (Count));
            Ret : Joystick_Axis_Value_Array (1 .. Positive (Count));
         begin
            for I in Ret'Range loop
               Ret (I) := Joystick_Axis_Value (Val (size_t (I - 1)));
            end loop;
            return Ret;
         end;
      end if;
   end Get_Joystick_Axes;

   function glfwGetJoystickButtons
     (Joy : Joystick) return Joystick_Button_State_Array is
      use unsigned_char_pointers;
      Empty : constant Joystick_Button_State_Array (1 .. 0) :=
        (others => Release);
      Count : aliased int                             := 0;
      Ptr   : constant unsigned_char_pointers.Pointer :=
        glfwGetJoystickButtons (To_Int (Joy), Count'Access);
   begin
      if Ptr = null or Count = 0 then
         return Empty;
      else
         declare
            Val : constant unsigned_char_array :=
              Value (Ptr, ptrdiff_t (Count));
            Ret : Joystick_Button_State_Array (1 .. Positive (Count));
         begin
            for I in Ret'Range loop
               Ret (I) := To_Enum (int (Val (size_t (I - 1))));
            end loop;
            return Ret;
         end;
      end if;
   end glfwGetJoystickButtons;

end Glfw3.Input.Joysticks;
