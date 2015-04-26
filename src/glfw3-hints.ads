with Interfaces.C;
with Ada.Unchecked_Conversion;

package Glfw3.Hints is

   type Hint_Target is
     (Focused,
      Iconified,
      Resizable,
      Visible,
      Decorated,
      Auto_Iconify,
      Floating,
      Red_Bits,
      Green_Bits,
      Blue_Bits,
      Alpha_Bits,
      Depth_Bits,
      Stencil_Bits,
      Accum_Red_Bits,
      Accum_Green_Bits,
      Accum_Blue_Bits,
      Accum_Alpha_Bits,
      Aux_Buffers,
      Stereo,
      Samples,
      Srgb_Capable,
      Refresh_Rate,
      Doublebuffer,
      Client_Api,
      Context_Version_Major,
      Context_Version_Minor,
      Context_Revision,
      Context_Robustness,
      Opengl_Forward_Compat,
      Opengl_Debug_Context,
      Opengl_Profile,
      Context_Release_Behavior);

   pragma Convention (C, Hint_Target);
   for Hint_Target'Size use Interfaces.C.int'Size;
   for Hint_Target use
   (Focused                  => 16#00020001#,
    Iconified                => 16#00020002#,
    Resizable                => 16#00020003#,
    Visible                  => 16#00020004#,
    Decorated                => 16#00020005#,
    Auto_Iconify             => 16#00020006#,
    Floating                 => 16#00020007#,
    Red_Bits                 => 16#00021001#,
    Green_Bits               => 16#00021002#,
    Blue_Bits                => 16#00021003#,
    Alpha_Bits               => 16#00021004#,
    Depth_Bits               => 16#00021005#,
    Stencil_Bits             => 16#00021006#,
    Accum_Red_Bits           => 16#00021007#,
    Accum_Green_Bits         => 16#00021008#,
    Accum_Blue_Bits          => 16#00021009#,
    Accum_Alpha_Bits         => 16#0002100A#,
    Aux_Buffers              => 16#0002100B#,
    Stereo                   => 16#0002100C#,
    Samples                  => 16#0002100D#,
    Srgb_Capable             => 16#0002100E#,
    Refresh_Rate             => 16#0002100F#,
    Doublebuffer             => 16#00021010#,
    Client_Api               => 16#00022001#,
    Context_Version_Major    => 16#00022002#,
    Context_Version_Minor    => 16#00022003#,
    Context_Revision         => 16#00022004#,
    Context_Robustness       => 16#00022005#,
    Opengl_Forward_Compat    => 16#00022006#,
    Opengl_Debug_Context     => 16#00022007#,
    Opengl_Profile           => 16#00022008#,
    Context_Release_Behavior => 16#00022009#);

   type Opengl_Api_Kind is
     (Opengl_Api,
      Opengl_Es_Api);

   pragma Convention (C, Opengl_Api_Kind);
   for Opengl_Api_Kind'Size use Interfaces.C.int'Size;
   for Opengl_Api_Kind use
   (Opengl_Api    => 16#00030001#,
    Opengl_Es_Api => 16#00030002#);

   type Context_Robustness_Kind is
     (No_Robustness,
      No_Reset_Notification,
      Lose_Context_On_Reset);

   pragma Convention (C, Context_Robustness_Kind);
   for Context_Robustness_Kind'Size use Interfaces.C.int'Size;
   for Context_Robustness_Kind use
   (No_Robustness         => 0,
    No_Reset_Notification => 16#00031001#,
    Lose_Context_On_Reset => 16#00031002#);

   type Opengl_Profile_Kind is
     (Opengl_Any_Profile,
      Opengl_Core_Profile,
      Opengl_Compat_Profile);

   pragma Convention (C, Opengl_Profile_Kind);
   for Opengl_Profile_Kind'Size use Interfaces.C.int'Size;
   for Opengl_Profile_Kind use
   (Opengl_Any_Profile    => 0,
    Opengl_Core_Profile   => 16#00032001#,
    Opengl_Compat_Profile => 16#00032002#);

   type Context_Release_Behavior_Kind is
     (Any_Release_Behavior,
      Release_Behavior_Flush,
      Release_Behavior_None);

   pragma Convention (C, Context_Release_Behavior_Kind);
   for Context_Release_Behavior_Kind'Size use Interfaces.C.int'Size;
   for Context_Release_Behavior_Kind use
   (Any_Release_Behavior   => 0,
    Release_Behavior_Flush => 16#00035001#,
    Release_Behavior_None  => 16#00035002#);

   procedure Default_Window_Hints;

   procedure Window_Hint (Target : Hint_Target; Value : Integer);

   procedure Window_Hint (Target : Hint_Target; Value : Boolean);

   procedure Window_Hint (Target : Hint_Target; Value : Opengl_Api_Kind);

   procedure Window_Hint
     (Target : Hint_Target;
      Value  : Context_Robustness_Kind);

   procedure Window_Hint (Target : Hint_Target; Value : Opengl_Profile_Kind);

   procedure Window_Hint
     (Target : Hint_Target;
      Value  : Context_Release_Behavior_Kind);

   ---------------------------------------------------------------------------
   -- Utility functions to convert from and to the enum types to enable
   -- cooperation with a thin binding.

   package Conversions is

      function To_Int is new Ada.Unchecked_Conversion
        (Hint_Target,
         Interfaces.C.int);

      function To_Int is new Ada.Unchecked_Conversion
        (Opengl_Api_Kind,
         Interfaces.C.int);

      function To_Int is new Ada.Unchecked_Conversion
        (Context_Robustness_Kind,
         Interfaces.C.int);

      function To_Int is new Ada.Unchecked_Conversion
        (Opengl_Profile_Kind,
         Interfaces.C.int);

      function To_Int is new Ada.Unchecked_Conversion
        (Context_Release_Behavior_Kind,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Hint_Target,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Opengl_Api_Kind,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Context_Robustness_Kind,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Opengl_Profile_Kind,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Context_Release_Behavior_Kind,
         Interfaces.C.int);

   end Conversions;

end Glfw3.Hints;
