with Interfaces.C.Strings; use Interfaces.C.Strings;
with Glfw3.C_API;          use Glfw3.C_API;

package body Glfw3.Monitors is

   use Interfaces.C;
   use type System.Address;
   use Conversions;

   function Get_Monitors return Monitor_Array is
      use GLFWmonitor_Pointers;
      Empty : constant Monitor_Array (1 .. 0) := (others => Null_Monitor);
      Count : aliased int                           := 0;
      Ptr   : constant GLFWmonitor_Pointers.Pointer :=
        glfwGetMonitors (Count'Access);
   begin
      if Ptr = null then
         return Empty;
      else
         declare
            Val : constant GLFWmonitor_Array := Value (Ptr, ptrdiff_t (Count));
            Ret : Monitor_Array (1 .. Positive (Count));
         begin
            for I in Ret'Range loop
               Ret (I) :=
                 Monitor'
                   (Ada.Finalization.Controlled with
                    Handle => Val (size_t (I - 1)));
            end loop;
            return Ret;
         end;
      end if;
   end Get_Monitors;

   function Get_Primary_Monitor return Monitor is
      Ptr : constant System.Address := glfwGetPrimaryMonitor;
   begin
      return Monitor'(Ada.Finalization.Controlled with Handle => Ptr);
   end Get_Primary_Monitor;

   procedure Get_Position
     (Object :     Monitor;
      X_Pos  : out Integer;
      Y_Pos  : out Integer) is
      A, B : aliased int := 0;
   begin
      glfwGetMonitorPos (Object.Handle, A'Access, B'Access);
      X_Pos := Integer (A);
      Y_Pos := Integer (B);
   end Get_Position;

   procedure Get_Physical_Size
     (Object    :     Monitor;
      Width_Mm  : out Natural;
      Height_Mm : out Natural) is
      A, B : aliased int := 0;
   begin
      glfwGetMonitorPhysicalSize (Object.Handle, A'Access, B'Access);
      Width_Mm  := Integer (A);
      Height_Mm := Integer (B);
   end Get_Physical_Size;

   function Get_Name (Object : Monitor) return String is
      Ptr : constant chars_ptr := glfwGetMonitorName (Object.Handle);
   begin
      if Ptr = Null_Ptr then
         return "";
      else
         return Value (Ptr);
      end if;
   end Get_Name;

   function Get_Video_Modes (Object : Monitor) return Video_Mode_Array is
      use GLFWvidmode_Pointers;
      Empty : constant Video_Mode_Array (1 .. 0)    := (others => <>);
      Count : aliased int                           := 0;
      Ptr   : constant GLFWvidmode_Pointers.Pointer :=
        glfwGetVideoModes (Object.Handle, Count'Access);
   begin
      if Ptr = null then
         return Empty;
      else
         declare
            Val : constant GLFWvidmode_Array := Value (Ptr, ptrdiff_t (Count));
            Ret : Video_Mode_Array (1 .. Positive (Count));
         begin
            for I in Ret'Range loop
               Ret (I) :=
                 Video_Mode'
                   (Width        => Natural (Val (size_t (I - 1)).width),
                    Height       => Natural (Val (size_t (I - 1)).height),
                    Red_Bits     => Natural (Val (size_t (I - 1)).redBits),
                    Green_Bits   => Natural (Val (size_t (I - 1)).greenBits),
                    Blue_Bits    => Natural (Val (size_t (I - 1)).blueBits),
                    Refresh_Rate =>
                      Natural (Val (size_t (I - 1)).refreshRate));
            end loop;
            return Ret;
         end;
      end if;
   end Get_Video_Modes;

   function Get_Video_Mode (Object : Monitor) return Video_Mode is
      Ptr : constant access GLFWvidmode := glfwGetVideoMode (Object.Handle);
   begin
      if Ptr = null then
         return (others => <>);
      else
         return Video_Mode'
             (Width        => Natural (Ptr.width),
              Height       => Natural (Ptr.height),
              Red_Bits     => Natural (Ptr.redBits),
              Green_Bits   => Natural (Ptr.greenBits),
              Blue_Bits    => Natural (Ptr.blueBits),
              Refresh_Rate => Natural (Ptr.refreshRate));
      end if;
   end Get_Video_Mode;

   procedure Set_Gamma (Object : Monitor; Gamma : Float) is
   begin
      glfwSetGamma (Object.Handle, C_float (Gamma));
   end Set_Gamma;

   procedure Set_Gamma_Ramp (Object : Monitor; Ramp : access Gamma_Ramp) is
      R : aliased GLFWgammaramp :=
        GLFWgammaramp'
          (red   => Ramp.Red,
           green => Ramp.Green,
           blue  => Ramp.Blue,
           size  => unsigned (Ramp.Size));
   begin
      glfwSetGammaRamp (Object.Handle, R'Access);
   end Set_Gamma_Ramp;

   function Get_Handle (Object : Monitor) return System.Address is
   begin
      return Object.Handle;
   end Get_Handle;

   Current_Monitor_Fun : Monitor_Fun := null;

   procedure Monitor_Fun_Proxy (Arg1 : System.Address; Arg2 : int);
   pragma Convention (C, Monitor_Fun_Proxy);

   procedure Monitor_Fun_Proxy (Arg1 : System.Address; Arg2 : int) is
   begin
      if Current_Monitor_Fun /= null then
         Current_Monitor_Fun.all
           (Monitor'(Ada.Finalization.Controlled with Handle => Arg1),
            To_Enum (Arg2));
      end if;
   end Monitor_Fun_Proxy;

   procedure Set_Monitor_Callback (Cb_Fun : Monitor_Fun) is
   begin
      Current_Monitor_Fun := Cb_Fun;
      if Current_Monitor_Fun = null then
         glfwSetMonitorCallback (null);
      else
         glfwSetMonitorCallback (Monitor_Fun_Proxy'Access);
      end if;
   end Set_Monitor_Callback;

end Glfw3.Monitors;
