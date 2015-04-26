with Interfaces.C;
with Ada.Unchecked_Conversion;

package Glfw3.Errors is

   type Error is
     (Not_Initialized,
      No_Current_Context,
      Invalid_Enum,
      Invalid_Value,
      Out_Of_Memory,
      Api_Unavailable,
      Version_Unavailable,
      Platform_Error,
      Format_Unavailable);

   pragma Convention (C, Error);
   for Error'Size use Interfaces.C.int'Size;
   for Error use
   (Not_Initialized     => 16#00010001#,
    No_Current_Context  => 16#00010002#,
    Invalid_Enum        => 16#00010003#,
    Invalid_Value       => 16#00010004#,
    Out_Of_Memory       => 16#00010005#,
    Api_Unavailable     => 16#00010006#,
    Version_Unavailable => 16#00010007#,
    Platform_Error      => 16#00010008#,
    Format_Unavailable  => 16#00010009#);

   type Error_Fun is access procedure
     (The_Error   : Error;
      Description : String);

   procedure Set_Error_Callback (Cb_Fun : Error_Fun);

   ---------------------------------------------------------------------------
   -- Utility functions to convert from and to the enum types to enable
   -- cooperation with a thin binding.

   package Conversions is

      function To_Int is new Ada.Unchecked_Conversion
        (Error,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Interfaces.C.int,
         Error);

   end Conversions;

end Glfw3.Errors;
