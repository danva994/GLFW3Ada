with Interfaces.C;
with Ada.Unchecked_Conversion;

package Glfw3.Input.Mouse is

   type Mouse_Button is
     (Mouse_Button_1,
      Mouse_Button_2,
      Mouse_Button_3,
      Mouse_Button_4,
      Mouse_Button_5,
      Mouse_Button_6,
      Mouse_Button_7,
      Mouse_Button_8);

   pragma Convention (C, Mouse_Button);
   for Mouse_Button'Size use Interfaces.C.int'Size;
   for Mouse_Button use
   (Mouse_Button_1 => 0,
    Mouse_Button_2 => 1,
    Mouse_Button_3 => 2,
    Mouse_Button_4 => 3,
    Mouse_Button_5 => 4,
    Mouse_Button_6 => 5,
    Mouse_Button_7 => 6,
    Mouse_Button_8 => 7);

   Mouse_Button_Last   : constant Mouse_Button := Mouse_Button_8;
   Mouse_Button_Left   : constant Mouse_Button := Mouse_Button_1;
   Mouse_Button_Right  : constant Mouse_Button := Mouse_Button_2;
   Mouse_Button_Middle : constant Mouse_Button := Mouse_Button_3;

   ---------------------------------------------------------------------------
   -- Utility functions to convert from and to the enum types to enable
   -- cooperation with a thin binding.

   package Conversions is

      function To_Int is new Ada.Unchecked_Conversion
        (Mouse_Button,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Interfaces.C.int,
         Mouse_Button);

   end Conversions;

end Glfw3.Input.Mouse;
