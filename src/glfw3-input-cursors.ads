with System;
with Interfaces.C;
with Ada.Finalization;
with Ada.Unchecked_Conversion;

package Glfw3.Input.Cursors is

   type Cursor_Mode is
     (Cursor_Normal,
      Cursor_Hidden,
      Cursor_Disabled);

   pragma Convention (C, Cursor_Mode);
   for Cursor_Mode'Size use Interfaces.C.int'Size;
   for Cursor_Mode use
   (Cursor_Normal   => 16#00034001#,
    Cursor_Hidden   => 16#00034002#,
    Cursor_Disabled => 16#00034003#);

   type Standard_Cursor is
     (Arrow_Cursor,
      Ibeam_Cursor,
      Crosshair_Cursor,
      Hand_Cursor,
      Hresize_Cursor,
      Vresize_Cursor);

   pragma Convention (C, Standard_Cursor);
   for Standard_Cursor'Size use Interfaces.C.int'Size;
   for Standard_Cursor use
   (Arrow_Cursor     => 16#00036001#,
    Ibeam_Cursor     => 16#00036002#,
    Crosshair_Cursor => 16#00036003#,
    Hand_Cursor      => 16#00036004#,
    Hresize_Cursor   => 16#00036005#,
    Vresize_Cursor   => 16#00036006#);

   subtype Pixel is Interfaces.C.unsigned_char;
   type Image (Pixel_Count : Natural) is record
      Width  : Natural;
      Height : Natural;
      Pixels : access Pixel;
   end record;

   type Cursor is new Ada.Finalization.Controlled with private;
   Null_Cursor : constant Cursor;

   function Create_Cursor
     (The_Image : not null access Image;
      X_Hot     : Integer;
      Y_Hot     : Integer) return Cursor;

   function Create_Standard_Cursor (Shape : Standard_Cursor) return Cursor;

   procedure Destroy (Object : in out Cursor);

   -- The handle (GLFWcursor*) of the object.
   function Get_Handle (Object : Cursor) return System.Address;

   ---------------------------------------------------------------------------
   -- Utility functions to convert from and to the enum types to enable
   -- cooperation with a thin binding.

   package Conversions is

      function To_Int is new Ada.Unchecked_Conversion
        (Cursor_Mode,
         Interfaces.C.int);

      function To_Int is new Ada.Unchecked_Conversion
        (Standard_Cursor,
         Interfaces.C.int);

      function To_Enum is new Ada.Unchecked_Conversion
        (Interfaces.C.int,
         Cursor_Mode);

      function To_Enum is new Ada.Unchecked_Conversion
        (Interfaces.C.int,
         Standard_Cursor);

   end Conversions;

private

   type Cursor is new Ada.Finalization.Controlled with record
      Handle : System.Address := System.Null_Address;
   end record;

   Null_Cursor : constant Cursor :=
     Cursor'(Ada.Finalization.Controlled with Handle => System.Null_Address);

end Glfw3.Input.Cursors;
