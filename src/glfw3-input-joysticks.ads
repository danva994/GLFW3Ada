with Interfaces.C;
with Ada.Unchecked_Conversion;

package Glfw3.Input.Joysticks is

   type Joystick is
     (Joystick_1,
      Joystick_2,
      Joystick_3,
      Joystick_4,
      Joystick_5,
      Joystick_6,
      Joystick_7,
      Joystick_8,
      Joystick_9,
      Joystick_10,
      Joystick_11,
      Joystick_12,
      Joystick_13,
      Joystick_14,
      Joystick_15,
      Joystick_16);

   pragma Convention (C, Joystick);
   for Joystick'Size use Interfaces.C.int'Size;
   for Joystick use
   (Joystick_1  => 0,
    Joystick_2  => 1,
    Joystick_3  => 2,
    Joystick_4  => 3,
    Joystick_5  => 4,
    Joystick_6  => 5,
    Joystick_7  => 6,
    Joystick_8  => 7,
    Joystick_9  => 8,
    Joystick_10 => 9,
    Joystick_11 => 10,
    Joystick_12 => 11,
    Joystick_13 => 12,
    Joystick_14 => 13,
    Joystick_15 => 14,
    Joystick_16 => 15);

   type Joystick_Axis_Value is new Interfaces.C.C_float;

   type Joystick_Axis_Value_Array is
     array (Positive range <>) of Joystick_Axis_Value;

   type Joystick_Button_State_Array is array (Positive range <>) of Action;

   function Joystick_Present (Joy : Joystick) return Boolean;

   function Get_Joystick_Name (Joy : Joystick) return String;

   function Get_Joystick_Axes
     (Joy : Joystick) return Joystick_Axis_Value_Array;

   function glfwGetJoystickButtons
     (Joy : Joystick) return Joystick_Button_State_Array;

   ---------------------------------------------------------------------------
   -- Utility functions to convert from and to the enum types to enable
   -- cooperation with a thin binding.

   package Conversions is

      function To_Int is new Ada.Unchecked_Conversion
        (Joystick,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Interfaces.C.int,
         Joystick);

   end Conversions;

end Glfw3.Input.Joysticks;
