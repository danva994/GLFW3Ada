with Ada.Finalization;
with System;
with Interfaces.C;
with Ada.Unchecked_Conversion;

package Glfw3.Monitors is

   subtype Gamma_Ramp_Value is Interfaces.C.unsigned_short;
   type Gamma_Ramp (Size : Natural) is record
      Red, Green, Blue : access Gamma_Ramp_Value := null;
   end record;

   type Video_Mode is record
      Width, Height                   : Natural := 0;
      Red_Bits, Green_Bits, Blue_Bits : Natural := 0;
      Refresh_Rate                    : Natural := 0;
   end record;
   type Video_Mode_Array is array (Positive range <>) of Video_Mode;

   -- This type is NOT reference counted and it doesnt need to
   -- be it only wraps a GLFWmonitor handle that is handled
   -- internally by GLFW.
   type Monitor is new Ada.Finalization.Controlled with private;
   type Monitor_Array is array (Positive range <>) of Monitor;
   Null_Monitor : constant Monitor;

   function Get_Monitors return Monitor_Array;

   function Get_Primary_Monitor return Monitor;

   procedure Get_Position
     (Object :     Monitor;
      X_Pos  : out Integer;
      Y_Pos  : out Integer);

   procedure Get_Physical_Size
     (Object    :     Monitor;
      Width_Mm  : out Natural;
      Height_Mm : out Natural);

   function Get_Name (Object : Monitor) return String;

   function Get_Video_Modes (Object : Monitor) return Video_Mode_Array;

   function Get_Video_Mode (Object : Monitor) return Video_Mode;
   procedure Set_Gamma (Object : Monitor; Gamma : Float);

   -- function Get_Gamma_Ramp (Object : Monitor) return access Gamma_Ramp;

   procedure Set_Gamma_Ramp (Object : Monitor; Ramp : access Gamma_Ramp);

   -- The handle (GLFWmonitor*) of the object.
   function Get_Handle (Object : Monitor) return System.Address;

   type Monitor_Event is
     (Connected,
      Disconnected);

   pragma Convention (C, Monitor_Event);
   for Monitor_Event'Size use Interfaces.C.int'Size;
   for Monitor_Event use
   (Connected    => 16#00040001#,
    Disconnected => 16#00040002#);

   type Monitor_Fun is access procedure
     (Object : Monitor;
      Event  : Monitor_Event);

   procedure Set_Monitor_Callback (Cb_Fun : Monitor_Fun);

   ---------------------------------------------------------------------------
   -- Utility functions to convert from and to the enum types to enable
   -- cooperation with a thin binding.

   package Conversions is

      function To_Int is new Ada.Unchecked_Conversion
        (Monitor_Event,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Interfaces.C.int,
         Monitor_Event);

   end Conversions;

private

   type Monitor is new Ada.Finalization.Controlled with record
      Handle : System.Address := System.Null_Address;
   end record;

   Null_Monitor : constant Monitor :=
     Monitor'(Ada.Finalization.Controlled with Handle => System.Null_Address);

end Glfw3.Monitors;
