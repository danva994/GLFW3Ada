with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces.C.Pointers;
with System;

package Glfw3.C_API is

   ---------------------------------------------------------------------------
   -- CONSTANTS
   ---------------------------------------------------------------------------

   GLFW_CURSOR               : constant := 16#00033001#;
   GLFW_STICKY_KEYS          : constant := 16#00033002#;
   GLFW_STICKY_MOUSE_BUTTONS : constant := 16#00033003#;

   ---------------------------------------------------------------------------
   -- STRUCT TYPES
   ---------------------------------------------------------------------------

   type GLFWvidmode is record
      width       : aliased int;
      height      : aliased int;
      redBits     : aliased int;
      greenBits   : aliased int;
      blueBits    : aliased int;
      refreshRate : aliased int;
   end record;
   pragma Convention (C_Pass_By_Copy, GLFWvidmode);

   type GLFWgammaramp is record
      red   : access unsigned_short;
      green : access unsigned_short;
      blue  : access unsigned_short;
      size  : aliased unsigned;
   end record;
   pragma Convention (C_Pass_By_Copy, GLFWgammaramp);

   type GLFWmonitor_Array is array (size_t range <>) of aliased System.Address;
   pragma Convention (C, GLFWmonitor_Array);

   package GLFWmonitor_Pointers is new Interfaces.C.Pointers
     (Index              => size_t,
      Element            => System.Address,
      Element_Array      => GLFWmonitor_Array,
      Default_Terminator => System.Null_Address);

   type GLFWimage is record
      width  : aliased int;
      height : aliased int;
      pixels : access unsigned_char;
   end record;
   pragma Convention (C_Pass_By_Copy, GLFWimage);

   type GLFWvidmode_Array is array (size_t range <>) of aliased GLFWvidmode;
   pragma Convention (C, GLFWvidmode_Array);

   package GLFWvidmode_Pointers is new Interfaces.C.Pointers
     (Index              => size_t,
      Element            => GLFWvidmode,
      Element_Array      => GLFWvidmode_Array,
      Default_Terminator => (others => <>));

   type unsigned_char_array is
     array (size_t range <>) of aliased unsigned_char;
   pragma Convention (C, unsigned_char_array);

   package unsigned_char_pointers is new Interfaces.C.Pointers
     (Index              => size_t,
      Element            => unsigned_char,
      Element_Array      => unsigned_char_array,
      Default_Terminator => 0);

   type c_float_array is array (size_t range <>) of aliased C_float;
   pragma Convention (C, c_float_array);

   package c_float_pointers is new Interfaces.C.Pointers
     (Index              => size_t,
      Element            => C_float,
      Element_Array      => c_float_array,
      Default_Terminator => 0.0);

   ---------------------------------------------------------------------------
   -- FUNCTIONS
   ---------------------------------------------------------------------------

   function glfwInit return int;
   pragma Import (C, glfwInit, "glfwInit");

   procedure glfwTerminate;
   pragma Import (C, glfwTerminate, "glfwTerminate");

   procedure glfwGetVersion
     (major : access int;
      minor : access int;
      rev   : access int);
   pragma Import (C, glfwGetVersion, "glfwGetVersion");

   function glfwGetVersionString return chars_ptr;
   pragma Import (C, glfwGetVersionString, "glfwGetVersionString");

   function glfwGetMonitors
     (count : access int) return GLFWmonitor_Pointers.Pointer;
   pragma Import (C, glfwGetMonitors, "glfwGetMonitors");

   function glfwGetPrimaryMonitor return System.Address;
   pragma Import (C, glfwGetPrimaryMonitor, "glfwGetPrimaryMonitor");

   procedure glfwGetMonitorPos
     (monitor : System.Address;
      xpos    : access int;
      ypos    : access int);
   pragma Import (C, glfwGetMonitorPos, "glfwGetMonitorPos");

   procedure glfwGetMonitorPhysicalSize
     (monitor  : System.Address;
      widthMM  : access int;
      heightMM : access int);
   pragma Import (C, glfwGetMonitorPhysicalSize, "glfwGetMonitorPhysicalSize");

   function glfwGetMonitorName (monitor : System.Address) return chars_ptr;
   pragma Import (C, glfwGetMonitorName, "glfwGetMonitorName");

   function glfwGetVideoModes
     (monitor : System.Address;
      count   : access int) return GLFWvidmode_Pointers.Pointer;
   pragma Import (C, glfwGetVideoModes, "glfwGetVideoModes");

   function glfwGetVideoMode
     (monitor : System.Address) return access GLFWvidmode;
   pragma Import (C, glfwGetVideoMode, "glfwGetVideoMode");

   procedure glfwSetGamma (monitor : System.Address; gamma : C_float);
   pragma Import (C, glfwSetGamma, "glfwSetGamma");

   function glfwGetGammaRamp
     (monitor : System.Address) return access GLFWgammaramp;
   pragma Import (C, glfwGetGammaRamp, "glfwGetGammaRamp");

   procedure glfwSetGammaRamp
     (monitor : System.Address;
      ramp    : access GLFWgammaramp);
   pragma Import (C, glfwSetGammaRamp, "glfwSetGammaRamp");

   procedure glfwDefaultWindowHints;
   pragma Import (C, glfwDefaultWindowHints, "glfwDefaultWindowHints");

   procedure glfwWindowHint (target : int; hint : int);
   pragma Import (C, glfwWindowHint, "glfwWindowHint");

   function glfwCreateWindow
     (width   : int;
      height  : int;
      title   : chars_ptr;
      monitor : System.Address;
      share   : System.Address) return System.Address;
   pragma Import (C, glfwCreateWindow, "glfwCreateWindow");

   procedure glfwDestroyWindow (window : System.Address);
   pragma Import (C, glfwDestroyWindow, "glfwDestroyWindow");

   function glfwWindowShouldClose (window : System.Address) return int;
   pragma Import (C, glfwWindowShouldClose, "glfwWindowShouldClose");

   procedure glfwSetWindowShouldClose (window : System.Address; value : int);
   pragma Import (C, glfwSetWindowShouldClose, "glfwSetWindowShouldClose");

   procedure glfwSetWindowTitle (window : System.Address; title : chars_ptr);
   pragma Import (C, glfwSetWindowTitle, "glfwSetWindowTitle");

   procedure glfwGetWindowPos
     (window : System.Address;
      xpos   : access int;
      ypos   : access int);
   pragma Import (C, glfwGetWindowPos, "glfwGetWindowPos");

   procedure glfwSetWindowPos
     (window : System.Address;
      xpos   : int;
      ypos   : int);
   pragma Import (C, glfwSetWindowPos, "glfwSetWindowPos");

   procedure glfwGetWindowSize
     (window : System.Address;
      width  : access int;
      height : access int);
   pragma Import (C, glfwGetWindowSize, "glfwGetWindowSize");

   procedure glfwSetWindowSize
     (window : System.Address;
      width  : int;
      height : int);
   pragma Import (C, glfwSetWindowSize, "glfwSetWindowSize");

   procedure glfwGetFramebufferSize
     (window : System.Address;
      width  : access int;
      height : access int);
   pragma Import (C, glfwGetFramebufferSize, "glfwGetFramebufferSize");

   procedure glfwGetWindowFrameSize
     (window : System.Address;
      left   : access int;
      top    : access int;
      right  : access int;
      bottom : access int);
   pragma Import (C, glfwGetWindowFrameSize, "glfwGetWindowFrameSize");

   procedure glfwIconifyWindow (window : System.Address);
   pragma Import (C, glfwIconifyWindow, "glfwIconifyWindow");

   procedure glfwRestoreWindow (window : System.Address);
   pragma Import (C, glfwRestoreWindow, "glfwRestoreWindow");

   procedure glfwShowWindow (window : System.Address);
   pragma Import (C, glfwShowWindow, "glfwShowWindow");

   procedure glfwHideWindow (window : System.Address);
   pragma Import (C, glfwHideWindow, "glfwHideWindow");

   function glfwGetWindowMonitor
     (window : System.Address) return System.Address;
   pragma Import (C, glfwGetWindowMonitor, "glfwGetWindowMonitor");

   function glfwGetWindowAttrib
     (window : System.Address;
      attrib : int) return int;
   pragma Import (C, glfwGetWindowAttrib, "glfwGetWindowAttrib");

   procedure glfwSetWindowUserPointer
     (window  : System.Address;
      pointer : System.Address);
   pragma Import (C, glfwSetWindowUserPointer, "glfwSetWindowUserPointer");

   function glfwGetWindowUserPointer
     (window : System.Address) return System.Address;
   pragma Import (C, glfwGetWindowUserPointer, "glfwGetWindowUserPointer");

   procedure glfwSetClipboardString
     (window : System.Address;
      string : chars_ptr);
   pragma Import (C, glfwSetClipboardString, "glfwSetClipboardString");

   function glfwGetClipboardString (window : System.Address) return chars_ptr;
   pragma Import (C, glfwGetClipboardString, "glfwGetClipboardString");

   function glfwCreateCursor
     (image : access GLFWimage;
      xhot  : int;
      yhot  : int) return System.Address;
   pragma Import (C, glfwCreateCursor, "glfwCreateCursor");

   function glfwCreateStandardCursor (shape : int) return System.Address;
   pragma Import (C, glfwCreateStandardCursor, "glfwCreateStandardCursor");

   procedure glfwDestroyCursor (cursor : System.Address);
   pragma Import (C, glfwDestroyCursor, "glfwDestroyCursor");

   procedure glfwGetCursorPos
     (window : System.Address;
      xpos   : access double;
      ypos   : access double);
   pragma Import (C, glfwGetCursorPos, "glfwGetCursorPos");

   procedure glfwSetCursorPos
     (window : System.Address;
      xpos   : double;
      ypos   : double);
   pragma Import (C, glfwSetCursorPos, "glfwSetCursorPos");

   procedure glfwSetCursor (window : System.Address; cursor : System.Address);
   pragma Import (C, glfwSetCursor, "glfwSetCursor");

   function glfwGetInputMode (window : System.Address; mode : int) return int;
   pragma Import (C, glfwGetInputMode, "glfwGetInputMode");

   procedure glfwSetInputMode
     (window : System.Address;
      mode   : int;
      value  : int);
   pragma Import (C, glfwSetInputMode, "glfwSetInputMode");

   function glfwGetKey (window : System.Address; key : int) return int;
   pragma Import (C, glfwGetKey, "glfwGetKey");

   function glfwGetMouseButton
     (window : System.Address;
      button : int) return int;
   pragma Import (C, glfwGetMouseButton, "glfwGetMouseButton");

   function glfwGetTime return double;
   pragma Import (C, glfwGetTime, "glfwGetTime");

   procedure glfwSetTime (time : double);
   pragma Import (C, glfwSetTime, "glfwSetTime");

   procedure glfwMakeContextCurrent (window : System.Address);
   pragma Import (C, glfwMakeContextCurrent, "glfwMakeContextCurrent");

   function glfwGetCurrentContext return System.Address;
   pragma Import (C, glfwGetCurrentContext, "glfwGetCurrentContext");

   procedure glfwSwapBuffers (window : System.Address);
   pragma Import (C, glfwSwapBuffers, "glfwSwapBuffers");

   procedure glfwSwapInterval (interval : int);
   pragma Import (C, glfwSwapInterval, "glfwSwapInterval");

   function glfwExtensionSupported (extension : chars_ptr) return int;
   pragma Import (C, glfwExtensionSupported, "glfwExtensionSupported");

   function glfwGetProcAddress (procname : chars_ptr) return System.Address;
   pragma Import (C, glfwGetProcAddress, "glfwGetProcAddress");

   function glfwJoystickPresent (joy : int) return int;
   pragma Import (C, glfwJoystickPresent, "glfwJoystickPresent");

   function glfwGetJoystickAxes
     (joy   : int;
      count : access int) return c_float_pointers.Pointer;
   pragma Import (C, glfwGetJoystickAxes, "glfwGetJoystickAxes");

   function glfwGetJoystickButtons
     (joy   : int;
      count : access int) return unsigned_char_pointers.Pointer;
   pragma Import (C, glfwGetJoystickButtons, "glfwGetJoystickButtons");

   function glfwGetJoystickName (joy : int) return chars_ptr;
   pragma Import (C, glfwGetJoystickName, "glfwGetJoystickName");

   procedure glfwPollEvents;
   pragma Import (C, glfwPollEvents, "glfwPollEvents");

   procedure glfwWaitEvents;
   pragma Import (C, glfwWaitEvents, "glfwWaitEvents");

   procedure glfwPostEmptyEvent;
   pragma Import (C, glfwPostEmptyEvent, "glfwPostEmptyEvent");

   ---------------------------------------------------------------------------
   -- CALLBACKS TYPES
   ---------------------------------------------------------------------------

   type GLFWerrorfun is access procedure (arg1 : int; arg2 : chars_ptr);
   pragma Convention (C, GLFWerrorfun);

   type GLFWwindowposfun is access procedure
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int);
   pragma Convention (C, GLFWwindowposfun);

   type GLFWwindowsizefun is access procedure
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int);
   pragma Convention (C, GLFWwindowsizefun);

   type GLFWwindowclosefun is access procedure (arg1 : System.Address);
   pragma Convention (C, GLFWwindowclosefun);

   type GLFWwindowrefreshfun is access procedure (arg1 : System.Address);
   pragma Convention (C, GLFWwindowrefreshfun);

   type GLFWwindowfocusfun is access procedure
     (arg1 : System.Address;
      arg2 : int);
   pragma Convention (C, GLFWwindowfocusfun);

   type GLFWwindowiconifyfun is access procedure
     (arg1 : System.Address;
      arg2 : int);
   pragma Convention (C, GLFWwindowiconifyfun);

   type GLFWframebuffersizefun is access procedure
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int);
   pragma Convention (C, GLFWframebuffersizefun);

   type GLFWmousebuttonfun is access procedure
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int;
      arg4 : int);
   pragma Convention (C, GLFWmousebuttonfun);

   type GLFWcursorposfun is access procedure
     (arg1 : System.Address;
      arg2 : double;
      arg3 : double);
   pragma Convention (C, GLFWcursorposfun);

   type GLFWcursorenterfun is access procedure
     (arg1 : System.Address;
      arg2 : int);
   pragma Convention (C, GLFWcursorenterfun);

   type GLFWscrollfun is access procedure
     (arg1 : System.Address;
      arg2 : double;
      arg3 : double);
   pragma Convention (C, GLFWscrollfun);

   type GLFWkeyfun is access procedure
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : int);
   pragma Convention (C, GLFWkeyfun);

   type GLFWcharfun is access procedure
     (arg1 : System.Address;
      arg2 : unsigned);
   pragma Convention (C, GLFWcharfun);

   type GLFWcharmodsfun is access procedure
     (arg1 : System.Address;
      arg2 : unsigned;
      arg3 : int);
   pragma Convention (C, GLFWcharmodsfun);

   package chars_ptr_pointers is new Interfaces.C.Pointers
     (Index              => size_t,
      Element            => chars_ptr,
      Element_Array      => chars_ptr_array,
      Default_Terminator => Null_Ptr);

   type GLFWdropfun is access procedure
     (arg1 : System.Address;
      arg2 : int;
      arg3 : chars_ptr_pointers.Pointer);
   pragma Convention (C, GLFWdropfun);

   type GLFWmonitorfun is access procedure (arg1 : System.Address; arg2 : int);
   pragma Convention (C, GLFWmonitorfun);

   ---------------------------------------------------------------------------
   -- SETTING CALLBACKS
   ---------------------------------------------------------------------------

   procedure glfwSetErrorCallback (cbfun : GLFWerrorfun);
   pragma Import (C, glfwSetErrorCallback, "glfwSetErrorCallback");

   procedure glfwSetMonitorCallback (cbfun : GLFWmonitorfun);
   pragma Import (C, glfwSetMonitorCallback, "glfwSetMonitorCallback");

   procedure glfwSetWindowPosCallback
     (window : System.Address;
      cbfun  : GLFWwindowposfun);
   pragma Import (C, glfwSetWindowPosCallback, "glfwSetWindowPosCallback");

   procedure glfwSetWindowSizeCallback
     (window : System.Address;
      cbfun  : GLFWwindowsizefun);
   pragma Import (C, glfwSetWindowSizeCallback, "glfwSetWindowSizeCallback");

   procedure glfwSetWindowCloseCallback
     (window : System.Address;
      cbfun  : GLFWwindowclosefun);
   pragma Import (C, glfwSetWindowCloseCallback, "glfwSetWindowCloseCallback");

   procedure glfwSetWindowRefreshCallback
     (window : System.Address;
      cbfun  : GLFWwindowrefreshfun);
   pragma Import
     (C,
      glfwSetWindowRefreshCallback,
      "glfwSetWindowRefreshCallback");

   procedure glfwSetWindowFocusCallback
     (window : System.Address;
      cbfun  : GLFWwindowfocusfun);
   pragma Import (C, glfwSetWindowFocusCallback, "glfwSetWindowFocusCallback");

   procedure glfwSetWindowIconifyCallback
     (window : System.Address;
      cbfun  : GLFWwindowiconifyfun);
   pragma Import
     (C,
      glfwSetWindowIconifyCallback,
      "glfwSetWindowIconifyCallback");

   procedure glfwSetFramebufferSizeCallback
     (window : System.Address;
      cbfun  : GLFWframebuffersizefun);
   pragma Import
     (C,
      glfwSetFramebufferSizeCallback,
      "glfwSetFramebufferSizeCallback");

   procedure glfwSetKeyCallback (window : System.Address; cbfun : GLFWkeyfun);
   pragma Import (C, glfwSetKeyCallback, "glfwSetKeyCallback");

   procedure glfwSetCharCallback
     (window : System.Address;
      cbfun  : GLFWcharfun);
   pragma Import (C, glfwSetCharCallback, "glfwSetCharCallback");

   procedure glfwSetCharModsCallback
     (window : System.Address;
      cbfun  : GLFWcharmodsfun);
   pragma Import (C, glfwSetCharModsCallback, "glfwSetCharModsCallback");

   procedure glfwSetMouseButtonCallback
     (window : System.Address;
      cbfun  : GLFWmousebuttonfun);
   pragma Import (C, glfwSetMouseButtonCallback, "glfwSetMouseButtonCallback");

   procedure glfwSetCursorPosCallback
     (window : System.Address;
      cbfun  : GLFWcursorposfun);
   pragma Import (C, glfwSetCursorPosCallback, "glfwSetCursorPosCallback");

   procedure glfwSetCursorEnterCallback
     (window : System.Address;
      cbfun  : GLFWcursorenterfun);
   pragma Import (C, glfwSetCursorEnterCallback, "glfwSetCursorEnterCallback");

   procedure glfwSetScrollCallback
     (window : System.Address;
      cbfun  : GLFWscrollfun);
   pragma Import (C, glfwSetScrollCallback, "glfwSetScrollCallback");

   procedure glfwSetDropCallback
     (window : System.Address;
      cbfun  : GLFWdropfun);
   pragma Import (C, glfwSetDropCallback, "glfwSetDropCallback");

end Glfw3.C_API;
