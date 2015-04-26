with Interfaces.C;
with Ada.Unchecked_Conversion;

package Glfw3.Input is

   type Action is
     (Release,
      Press,
      Repeat);

   pragma Convention (C, Action);
   for Action'Size use Interfaces.C.int'Size;
   for Action use (Release => 0, Press => 1, Repeat => 2);

   ---------------------------------------------------------------------------
   -- Utility functions to convert from and to the enum types to enable
   -- cooperation with a thin binding.

   package Conversions is

      function To_Int is new Ada.Unchecked_Conversion
        (Action,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Interfaces.C.int,
         Action);

   end Conversions;

end Glfw3.Input;
