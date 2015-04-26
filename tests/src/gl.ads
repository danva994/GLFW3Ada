-- Generated from Mingw 4.8 gl.h
-- OpenGL version 1.1

with System;
with Interfaces.C;

package GL is

   ---------------------------------------------------------------------------
   -- CONSTANTS
   ---------------------------------------------------------------------------

   GL_FALSE : constant := 16#0#;
   GL_TRUE  : constant := 16#1#;

   GL_BYTE           : constant := 16#1400#;
   GL_UNSIGNED_BYTE  : constant := 16#1401#;
   GL_SHORT          : constant := 16#1402#;
   GL_UNSIGNED_SHORT : constant := 16#1403#;
   GL_INT            : constant := 16#1404#;
   GL_UNSIGNED_INT   : constant := 16#1405#;
   GL_FLOAT          : constant := 16#1406#;
   GL_DOUBLE         : constant := 16#140A#;
   GL_2_BYTES        : constant := 16#1407#;
   GL_3_BYTES        : constant := 16#1408#;
   GL_4_BYTES        : constant := 16#1409#;

   GL_POINTS         : constant := 16#0000#;
   GL_LINES          : constant := 16#0001#;
   GL_LINE_LOOP      : constant := 16#0002#;
   GL_LINE_STRIP     : constant := 16#0003#;
   GL_TRIANGLES      : constant := 16#0004#;
   GL_TRIANGLE_STRIP : constant := 16#0005#;
   GL_TRIANGLE_FAN   : constant := 16#0006#;
   GL_QUADS          : constant := 16#0007#;
   GL_QUAD_STRIP     : constant := 16#0008#;
   GL_POLYGON        : constant := 16#0009#;

   GL_VERTEX_ARRAY                : constant := 16#8074#;
   GL_NORMAL_ARRAY                : constant := 16#8075#;
   GL_COLOR_ARRAY                 : constant := 16#8076#;
   GL_INDEX_ARRAY                 : constant := 16#8077#;
   GL_TEXTURE_COORD_ARRAY         : constant := 16#8078#;
   GL_EDGE_FLAG_ARRAY             : constant := 16#8079#;
   GL_VERTEX_ARRAY_SIZE           : constant := 16#807A#;
   GL_VERTEX_ARRAY_TYPE           : constant := 16#807B#;
   GL_VERTEX_ARRAY_STRIDE         : constant := 16#807C#;
   GL_NORMAL_ARRAY_TYPE           : constant := 16#807E#;
   GL_NORMAL_ARRAY_STRIDE         : constant := 16#807F#;
   GL_COLOR_ARRAY_SIZE            : constant := 16#8081#;
   GL_COLOR_ARRAY_TYPE            : constant := 16#8082#;
   GL_COLOR_ARRAY_STRIDE          : constant := 16#8083#;
   GL_INDEX_ARRAY_TYPE            : constant := 16#8085#;
   GL_INDEX_ARRAY_STRIDE          : constant := 16#8086#;
   GL_TEXTURE_COORD_ARRAY_SIZE    : constant := 16#8088#;
   GL_TEXTURE_COORD_ARRAY_TYPE    : constant := 16#8089#;
   GL_TEXTURE_COORD_ARRAY_STRIDE  : constant := 16#808A#;
   GL_EDGE_FLAG_ARRAY_STRIDE      : constant := 16#808C#;
   GL_VERTEX_ARRAY_POINTER        : constant := 16#808E#;
   GL_NORMAL_ARRAY_POINTER        : constant := 16#808F#;
   GL_COLOR_ARRAY_POINTER         : constant := 16#8090#;
   GL_INDEX_ARRAY_POINTER         : constant := 16#8091#;
   GL_TEXTURE_COORD_ARRAY_POINTER : constant := 16#8092#;
   GL_EDGE_FLAG_ARRAY_POINTER     : constant := 16#8093#;
   GL_V2F                         : constant := 16#2A20#;
   GL_V3F                         : constant := 16#2A21#;
   GL_C4UB_V2F                    : constant := 16#2A22#;
   GL_C4UB_V3F                    : constant := 16#2A23#;
   GL_C3F_V3F                     : constant := 16#2A24#;
   GL_N3F_V3F                     : constant := 16#2A25#;
   GL_C4F_N3F_V3F                 : constant := 16#2A26#;
   GL_T2F_V3F                     : constant := 16#2A27#;
   GL_T4F_V4F                     : constant := 16#2A28#;
   GL_T2F_C4UB_V3F                : constant := 16#2A29#;
   GL_T2F_C3F_V3F                 : constant := 16#2A2A#;
   GL_T2F_N3F_V3F                 : constant := 16#2A2B#;
   GL_T2F_C4F_N3F_V3F             : constant := 16#2A2C#;
   GL_T4F_C4F_N3F_V4F             : constant := 16#2A2D#;

   GL_MATRIX_MODE : constant := 16#0BA0#;
   GL_MODELVIEW   : constant := 16#1700#;
   GL_PROJECTION  : constant := 16#1701#;
   GL_TEXTURE     : constant := 16#1702#;

   GL_POINT_SMOOTH           : constant := 16#0B10#;
   GL_POINT_SIZE             : constant := 16#0B11#;
   GL_POINT_SIZE_GRANULARITY : constant := 16#0B13#;
   GL_POINT_SIZE_RANGE       : constant := 16#0B12#;

   GL_LINE_SMOOTH            : constant := 16#0B20#;
   GL_LINE_STIPPLE           : constant := 16#0B24#;
   GL_LINE_STIPPLE_PATTERN   : constant := 16#0B25#;
   GL_LINE_STIPPLE_REPEAT    : constant := 16#0B26#;
   GL_LINE_WIDTH             : constant := 16#0B21#;
   GL_LINE_WIDTH_GRANULARITY : constant := 16#0B23#;
   GL_LINE_WIDTH_RANGE       : constant := 16#0B22#;

   GL_POINT                 : constant := 16#1B00#;
   GL_LINE                  : constant := 16#1B01#;
   GL_FILL                  : constant := 16#1B02#;
   GL_CW                    : constant := 16#0900#;
   GL_CCW                   : constant := 16#0901#;
   GL_FRONT                 : constant := 16#0404#;
   GL_BACK                  : constant := 16#0405#;
   GL_POLYGON_MODE          : constant := 16#0B40#;
   GL_POLYGON_SMOOTH        : constant := 16#0B41#;
   GL_POLYGON_STIPPLE       : constant := 16#0B42#;
   GL_EDGE_FLAG             : constant := 16#0B43#;
   GL_CULL_FACE             : constant := 16#0B44#;
   GL_CULL_FACE_MODE        : constant := 16#0B45#;
   GL_FRONT_FACE            : constant := 16#0B46#;
   GL_POLYGON_OFFSET_FACTOR : constant := 16#8038#;
   GL_POLYGON_OFFSET_UNITS  : constant := 16#2A00#;
   GL_POLYGON_OFFSET_POINT  : constant := 16#2A01#;
   GL_POLYGON_OFFSET_LINE   : constant := 16#2A02#;
   GL_POLYGON_OFFSET_FILL   : constant := 16#8037#;

   GL_COMPILE             : constant := 16#1300#;
   GL_COMPILE_AND_EXECUTE : constant := 16#1301#;
   GL_LIST_BASE           : constant := 16#0B32#;
   GL_LIST_INDEX          : constant := 16#0B33#;
   GL_LIST_MODE           : constant := 16#0B30#;

   GL_NEVER             : constant := 16#0200#;
   GL_LESS              : constant := 16#0201#;
   GL_EQUAL             : constant := 16#0202#;
   GL_LEQUAL            : constant := 16#0203#;
   GL_GREATER           : constant := 16#0204#;
   GL_NOTEQUAL          : constant := 16#0205#;
   GL_GEQUAL            : constant := 16#0206#;
   GL_ALWAYS            : constant := 16#0207#;
   GL_DEPTH_TEST        : constant := 16#0B71#;
   GL_DEPTH_BITS        : constant := 16#0D56#;
   GL_DEPTH_CLEAR_VALUE : constant := 16#0B73#;
   GL_DEPTH_FUNC        : constant := 16#0B74#;
   GL_DEPTH_RANGE       : constant := 16#0B70#;
   GL_DEPTH_WRITEMASK   : constant := 16#0B72#;
   GL_DEPTH_COMPONENT   : constant := 16#1902#;

   GL_LIGHTING                 : constant := 16#0B50#;
   GL_LIGHT0                   : constant := 16#4000#;
   GL_LIGHT1                   : constant := 16#4001#;
   GL_LIGHT2                   : constant := 16#4002#;
   GL_LIGHT3                   : constant := 16#4003#;
   GL_LIGHT4                   : constant := 16#4004#;
   GL_LIGHT5                   : constant := 16#4005#;
   GL_LIGHT6                   : constant := 16#4006#;
   GL_LIGHT7                   : constant := 16#4007#;
   GL_SPOT_EXPONENT            : constant := 16#1205#;
   GL_SPOT_CUTOFF              : constant := 16#1206#;
   GL_CONSTANT_ATTENUATION     : constant := 16#1207#;
   GL_LINEAR_ATTENUATION       : constant := 16#1208#;
   GL_QUADRATIC_ATTENUATION    : constant := 16#1209#;
   GL_AMBIENT                  : constant := 16#1200#;
   GL_DIFFUSE                  : constant := 16#1201#;
   GL_SPECULAR                 : constant := 16#1202#;
   GL_SHININESS                : constant := 16#1601#;
   GL_EMISSION                 : constant := 16#1600#;
   GL_POSITION                 : constant := 16#1203#;
   GL_SPOT_DIRECTION           : constant := 16#1204#;
   GL_AMBIENT_AND_DIFFUSE      : constant := 16#1602#;
   GL_COLOR_INDEXES            : constant := 16#1603#;
   GL_LIGHT_MODEL_TWO_SIDE     : constant := 16#0B52#;
   GL_LIGHT_MODEL_LOCAL_VIEWER : constant := 16#0B51#;
   GL_LIGHT_MODEL_AMBIENT      : constant := 16#0B53#;
   GL_FRONT_AND_BACK           : constant := 16#0408#;
   GL_SHADE_MODEL              : constant := 16#0B54#;
   GL_FLAT                     : constant := 16#1D00#;
   GL_SMOOTH                   : constant := 16#1D01#;
   GL_COLOR_MATERIAL           : constant := 16#0B57#;
   GL_COLOR_MATERIAL_FACE      : constant := 16#0B55#;
   GL_COLOR_MATERIAL_PARAMETER : constant := 16#0B56#;
   GL_NORMALIZE                : constant := 16#0BA1#;

   GL_CLIP_PLANE0 : constant := 16#3000#;
   GL_CLIP_PLANE1 : constant := 16#3001#;
   GL_CLIP_PLANE2 : constant := 16#3002#;
   GL_CLIP_PLANE3 : constant := 16#3003#;
   GL_CLIP_PLANE4 : constant := 16#3004#;
   GL_CLIP_PLANE5 : constant := 16#3005#;

   GL_ACCUM_RED_BITS    : constant := 16#0D58#;
   GL_ACCUM_GREEN_BITS  : constant := 16#0D59#;
   GL_ACCUM_BLUE_BITS   : constant := 16#0D5A#;
   GL_ACCUM_ALPHA_BITS  : constant := 16#0D5B#;
   GL_ACCUM_CLEAR_VALUE : constant := 16#0B80#;
   GL_ACCUM             : constant := 16#0100#;
   GL_ADD               : constant := 16#0104#;
   GL_LOAD              : constant := 16#0101#;
   GL_MULT              : constant := 16#0103#;
   GL_RETURN            : constant := 16#0102#;

   GL_ALPHA_TEST      : constant := 16#0BC0#;
   GL_ALPHA_TEST_REF  : constant := 16#0BC2#;
   GL_ALPHA_TEST_FUNC : constant := 16#0BC1#;

   GL_BLEND                    : constant := 16#0BE2#;
   GL_BLEND_SRC                : constant := 16#0BE1#;
   GL_BLEND_DST                : constant := 16#0BE0#;
   GL_ZERO                     : constant := 16#0#;
   GL_ONE                      : constant := 16#1#;
   GL_SRC_COLOR                : constant := 16#0300#;
   GL_ONE_MINUS_SRC_COLOR      : constant := 16#0301#;
   GL_SRC_ALPHA                : constant := 16#0302#;
   GL_ONE_MINUS_SRC_ALPHA      : constant := 16#0303#;
   GL_DST_ALPHA                : constant := 16#0304#;
   GL_ONE_MINUS_DST_ALPHA      : constant := 16#0305#;
   GL_DST_COLOR                : constant := 16#0306#;
   GL_ONE_MINUS_DST_COLOR      : constant := 16#0307#;
   GL_SRC_ALPHA_SATURATE       : constant := 16#0308#;
   GL_CONSTANT_COLOR           : constant := 16#8001#;
   GL_ONE_MINUS_CONSTANT_COLOR : constant := 16#8002#;
   GL_CONSTANT_ALPHA           : constant := 16#8003#;
   GL_ONE_MINUS_CONSTANT_ALPHA : constant := 16#8004#;

   GL_FEEDBACK : constant := 16#1C01#;
   GL_RENDER   : constant := 16#1C00#;
   GL_SELECT   : constant := 16#1C02#;

   GL_2D                      : constant := 16#0600#;
   GL_3D                      : constant := 16#0601#;
   GL_3D_COLOR                : constant := 16#0602#;
   GL_3D_COLOR_TEXTURE        : constant := 16#0603#;
   GL_4D_COLOR_TEXTURE        : constant := 16#0604#;
   GL_POINT_TOKEN             : constant := 16#0701#;
   GL_LINE_TOKEN              : constant := 16#0702#;
   GL_LINE_RESET_TOKEN        : constant := 16#0707#;
   GL_POLYGON_TOKEN           : constant := 16#0703#;
   GL_BITMAP_TOKEN            : constant := 16#0704#;
   GL_DRAW_PIXEL_TOKEN        : constant := 16#0705#;
   GL_COPY_PIXEL_TOKEN        : constant := 16#0706#;
   GL_PASS_THROUGH_TOKEN      : constant := 16#0700#;
   GL_FEEDBACK_BUFFER_POINTER : constant := 16#0DF0#;
   GL_FEEDBACK_BUFFER_SIZE    : constant := 16#0DF1#;
   GL_FEEDBACK_BUFFER_TYPE    : constant := 16#0DF2#;

   GL_SELECTION_BUFFER_POINTER : constant := 16#0DF3#;
   GL_SELECTION_BUFFER_SIZE    : constant := 16#0DF4#;

   GL_FOG         : constant := 16#0B60#;
   GL_FOG_MODE    : constant := 16#0B65#;
   GL_FOG_DENSITY : constant := 16#0B62#;
   GL_FOG_COLOR   : constant := 16#0B66#;
   GL_FOG_INDEX   : constant := 16#0B61#;
   GL_FOG_START   : constant := 16#0B63#;
   GL_FOG_END     : constant := 16#0B64#;
   GL_LINEAR      : constant := 16#2601#;
   GL_EXP         : constant := 16#0800#;
   GL_EXP2        : constant := 16#0801#;

   GL_LOGIC_OP       : constant := 16#0BF1#;
   GL_INDEX_LOGIC_OP : constant := 16#0BF1#;
   GL_COLOR_LOGIC_OP : constant := 16#0BF2#;
   GL_LOGIC_OP_MODE  : constant := 16#0BF0#;
   GL_CLEAR          : constant := 16#1500#;
   GL_SET            : constant := 16#150F#;
   GL_COPY           : constant := 16#1503#;
   GL_COPY_INVERTED  : constant := 16#150C#;
   GL_NOOP           : constant := 16#1505#;
   GL_INVERT         : constant := 16#150A#;
   GL_AND            : constant := 16#1501#;
   GL_NAND           : constant := 16#150E#;
   GL_OR             : constant := 16#1507#;
   GL_NOR            : constant := 16#1508#;
   GL_XOR            : constant := 16#1506#;
   GL_EQUIV          : constant := 16#1509#;
   GL_AND_REVERSE    : constant := 16#1502#;
   GL_AND_INVERTED   : constant := 16#1504#;
   GL_OR_REVERSE     : constant := 16#150B#;
   GL_OR_INVERTED    : constant := 16#150D#;

   GL_STENCIL_TEST            : constant := 16#0B90#;
   GL_STENCIL_WRITEMASK       : constant := 16#0B98#;
   GL_STENCIL_BITS            : constant := 16#0D57#;
   GL_STENCIL_FUNC            : constant := 16#0B92#;
   GL_STENCIL_VALUE_MASK      : constant := 16#0B93#;
   GL_STENCIL_REF             : constant := 16#0B97#;
   GL_STENCIL_FAIL            : constant := 16#0B94#;
   GL_STENCIL_PASS_DEPTH_PASS : constant := 16#0B96#;
   GL_STENCIL_PASS_DEPTH_FAIL : constant := 16#0B95#;
   GL_STENCIL_CLEAR_VALUE     : constant := 16#0B91#;
   GL_STENCIL_INDEX           : constant := 16#1901#;
   GL_KEEP                    : constant := 16#1E00#;
   GL_REPLACE                 : constant := 16#1E01#;
   GL_INCR                    : constant := 16#1E02#;
   GL_DECR                    : constant := 16#1E03#;

   GL_NONE  : constant := 16#0#;
   GL_LEFT  : constant := 16#0406#;
   GL_RIGHT : constant := 16#0407#;

   GL_FRONT_LEFT      : constant := 16#0400#;
   GL_FRONT_RIGHT     : constant := 16#0401#;
   GL_BACK_LEFT       : constant := 16#0402#;
   GL_BACK_RIGHT      : constant := 16#0403#;
   GL_AUX0            : constant := 16#0409#;
   GL_AUX1            : constant := 16#040A#;
   GL_AUX2            : constant := 16#040B#;
   GL_AUX3            : constant := 16#040C#;
   GL_COLOR_INDEX     : constant := 16#1900#;
   GL_RED             : constant := 16#1903#;
   GL_GREEN           : constant := 16#1904#;
   GL_BLUE            : constant := 16#1905#;
   GL_ALPHA           : constant := 16#1906#;
   GL_LUMINANCE       : constant := 16#1909#;
   GL_LUMINANCE_ALPHA : constant := 16#190A#;
   GL_ALPHA_BITS      : constant := 16#0D55#;
   GL_RED_BITS        : constant := 16#0D52#;
   GL_GREEN_BITS      : constant := 16#0D53#;
   GL_BLUE_BITS       : constant := 16#0D54#;
   GL_INDEX_BITS      : constant := 16#0D51#;
   GL_SUBPIXEL_BITS   : constant := 16#0D50#;
   GL_AUX_BUFFERS     : constant := 16#0C00#;
   GL_READ_BUFFER     : constant := 16#0C02#;
   GL_DRAW_BUFFER     : constant := 16#0C01#;
   GL_DOUBLEBUFFER    : constant := 16#0C32#;
   GL_STEREO          : constant := 16#0C33#;
   GL_BITMAP          : constant := 16#1A00#;
   GL_COLOR           : constant := 16#1800#;
   GL_DEPTH           : constant := 16#1801#;
   GL_STENCIL         : constant := 16#1802#;
   GL_DITHER          : constant := 16#0BD0#;
   GL_RGB             : constant := 16#1907#;
   GL_RGBA            : constant := 16#1908#;

   GL_MAX_LIST_NESTING              : constant := 16#0B31#;
   GL_MAX_ATTRIB_STACK_DEPTH        : constant := 16#0D35#;
   GL_MAX_MODELVIEW_STACK_DEPTH     : constant := 16#0D36#;
   GL_MAX_NAME_STACK_DEPTH          : constant := 16#0D37#;
   GL_MAX_PROJECTION_STACK_DEPTH    : constant := 16#0D38#;
   GL_MAX_TEXTURE_STACK_DEPTH       : constant := 16#0D39#;
   GL_MAX_EVAL_ORDER                : constant := 16#0D30#;
   GL_MAX_LIGHTS                    : constant := 16#0D31#;
   GL_MAX_CLIP_PLANES               : constant := 16#0D32#;
   GL_MAX_TEXTURE_SIZE              : constant := 16#0D33#;
   GL_MAX_PIXEL_MAP_TABLE           : constant := 16#0D34#;
   GL_MAX_VIEWPORT_DIMS             : constant := 16#0D3A#;
   GL_MAX_CLIENT_ATTRIB_STACK_DEPTH : constant := 16#0D3B#;

   GL_ATTRIB_STACK_DEPTH            : constant := 16#0BB0#;
   GL_CLIENT_ATTRIB_STACK_DEPTH     : constant := 16#0BB1#;
   GL_COLOR_CLEAR_VALUE             : constant := 16#0C22#;
   GL_COLOR_WRITEMASK               : constant := 16#0C23#;
   GL_CURRENT_INDEX                 : constant := 16#0B01#;
   GL_CURRENT_COLOR                 : constant := 16#0B00#;
   GL_CURRENT_NORMAL                : constant := 16#0B02#;
   GL_CURRENT_RASTER_COLOR          : constant := 16#0B04#;
   GL_CURRENT_RASTER_DISTANCE       : constant := 16#0B09#;
   GL_CURRENT_RASTER_INDEX          : constant := 16#0B05#;
   GL_CURRENT_RASTER_POSITION       : constant := 16#0B07#;
   GL_CURRENT_RASTER_TEXTURE_COORDS : constant := 16#0B06#;
   GL_CURRENT_RASTER_POSITION_VALID : constant := 16#0B08#;
   GL_CURRENT_TEXTURE_COORDS        : constant := 16#0B03#;
   GL_INDEX_CLEAR_VALUE             : constant := 16#0C20#;
   GL_INDEX_MODE                    : constant := 16#0C30#;
   GL_INDEX_WRITEMASK               : constant := 16#0C21#;
   GL_MODELVIEW_MATRIX              : constant := 16#0BA6#;
   GL_MODELVIEW_STACK_DEPTH         : constant := 16#0BA3#;
   GL_NAME_STACK_DEPTH              : constant := 16#0D70#;
   GL_PROJECTION_MATRIX             : constant := 16#0BA7#;
   GL_PROJECTION_STACK_DEPTH        : constant := 16#0BA4#;
   GL_RENDER_MODE                   : constant := 16#0C40#;
   GL_RGBA_MODE                     : constant := 16#0C31#;
   GL_TEXTURE_MATRIX                : constant := 16#0BA8#;
   GL_TEXTURE_STACK_DEPTH           : constant := 16#0BA5#;
   GL_VIEWPORT                      : constant := 16#0BA2#;

   GL_AUTO_NORMAL          : constant := 16#0D80#;
   GL_MAP1_COLOR_4         : constant := 16#0D90#;
   GL_MAP1_GRID_DOMAIN     : constant := 16#0DD0#;
   GL_MAP1_GRID_SEGMENTS   : constant := 16#0DD1#;
   GL_MAP1_INDEX           : constant := 16#0D91#;
   GL_MAP1_NORMAL          : constant := 16#0D92#;
   GL_MAP1_TEXTURE_COORD_1 : constant := 16#0D93#;
   GL_MAP1_TEXTURE_COORD_2 : constant := 16#0D94#;
   GL_MAP1_TEXTURE_COORD_3 : constant := 16#0D95#;
   GL_MAP1_TEXTURE_COORD_4 : constant := 16#0D96#;
   GL_MAP1_VERTEX_3        : constant := 16#0D97#;
   GL_MAP1_VERTEX_4        : constant := 16#0D98#;
   GL_MAP2_COLOR_4         : constant := 16#0DB0#;
   GL_MAP2_GRID_DOMAIN     : constant := 16#0DD2#;
   GL_MAP2_GRID_SEGMENTS   : constant := 16#0DD3#;
   GL_MAP2_INDEX           : constant := 16#0DB1#;
   GL_MAP2_NORMAL          : constant := 16#0DB2#;
   GL_MAP2_TEXTURE_COORD_1 : constant := 16#0DB3#;
   GL_MAP2_TEXTURE_COORD_2 : constant := 16#0DB4#;
   GL_MAP2_TEXTURE_COORD_3 : constant := 16#0DB5#;
   GL_MAP2_TEXTURE_COORD_4 : constant := 16#0DB6#;
   GL_MAP2_VERTEX_3        : constant := 16#0DB7#;
   GL_MAP2_VERTEX_4        : constant := 16#0DB8#;
   GL_COEFF                : constant := 16#0A00#;
   GL_DOMAIN               : constant := 16#0A02#;
   GL_ORDER                : constant := 16#0A01#;

   GL_FOG_HINT                    : constant := 16#0C54#;
   GL_LINE_SMOOTH_HINT            : constant := 16#0C52#;
   GL_PERSPECTIVE_CORRECTION_HINT : constant := 16#0C50#;
   GL_POINT_SMOOTH_HINT           : constant := 16#0C51#;
   GL_POLYGON_SMOOTH_HINT         : constant := 16#0C53#;
   GL_DONT_CARE                   : constant := 16#1100#;
   GL_FASTEST                     : constant := 16#1101#;
   GL_NICEST                      : constant := 16#1102#;

   GL_SCISSOR_TEST : constant := 16#0C11#;
   GL_SCISSOR_BOX  : constant := 16#0C10#;

   GL_MAP_COLOR             : constant := 16#0D10#;
   GL_MAP_STENCIL           : constant := 16#0D11#;
   GL_INDEX_SHIFT           : constant := 16#0D12#;
   GL_INDEX_OFFSET          : constant := 16#0D13#;
   GL_RED_SCALE             : constant := 16#0D14#;
   GL_RED_BIAS              : constant := 16#0D15#;
   GL_GREEN_SCALE           : constant := 16#0D18#;
   GL_GREEN_BIAS            : constant := 16#0D19#;
   GL_BLUE_SCALE            : constant := 16#0D1A#;
   GL_BLUE_BIAS             : constant := 16#0D1B#;
   GL_ALPHA_SCALE           : constant := 16#0D1C#;
   GL_ALPHA_BIAS            : constant := 16#0D1D#;
   GL_DEPTH_SCALE           : constant := 16#0D1E#;
   GL_DEPTH_BIAS            : constant := 16#0D1F#;
   GL_PIXEL_MAP_S_TO_S_SIZE : constant := 16#0CB1#;
   GL_PIXEL_MAP_I_TO_I_SIZE : constant := 16#0CB0#;
   GL_PIXEL_MAP_I_TO_R_SIZE : constant := 16#0CB2#;
   GL_PIXEL_MAP_I_TO_G_SIZE : constant := 16#0CB3#;
   GL_PIXEL_MAP_I_TO_B_SIZE : constant := 16#0CB4#;
   GL_PIXEL_MAP_I_TO_A_SIZE : constant := 16#0CB5#;
   GL_PIXEL_MAP_R_TO_R_SIZE : constant := 16#0CB6#;
   GL_PIXEL_MAP_G_TO_G_SIZE : constant := 16#0CB7#;
   GL_PIXEL_MAP_B_TO_B_SIZE : constant := 16#0CB8#;
   GL_PIXEL_MAP_A_TO_A_SIZE : constant := 16#0CB9#;
   GL_PIXEL_MAP_S_TO_S      : constant := 16#0C71#;
   GL_PIXEL_MAP_I_TO_I      : constant := 16#0C70#;
   GL_PIXEL_MAP_I_TO_R      : constant := 16#0C72#;
   GL_PIXEL_MAP_I_TO_G      : constant := 16#0C73#;
   GL_PIXEL_MAP_I_TO_B      : constant := 16#0C74#;
   GL_PIXEL_MAP_I_TO_A      : constant := 16#0C75#;
   GL_PIXEL_MAP_R_TO_R      : constant := 16#0C76#;
   GL_PIXEL_MAP_G_TO_G      : constant := 16#0C77#;
   GL_PIXEL_MAP_B_TO_B      : constant := 16#0C78#;
   GL_PIXEL_MAP_A_TO_A      : constant := 16#0C79#;
   GL_PACK_ALIGNMENT        : constant := 16#0D05#;
   GL_PACK_LSB_FIRST        : constant := 16#0D01#;
   GL_PACK_ROW_LENGTH       : constant := 16#0D02#;
   GL_PACK_SKIP_PIXELS      : constant := 16#0D04#;
   GL_PACK_SKIP_ROWS        : constant := 16#0D03#;
   GL_PACK_SWAP_BYTES       : constant := 16#0D00#;
   GL_UNPACK_ALIGNMENT      : constant := 16#0CF5#;
   GL_UNPACK_LSB_FIRST      : constant := 16#0CF1#;
   GL_UNPACK_ROW_LENGTH     : constant := 16#0CF2#;
   GL_UNPACK_SKIP_PIXELS    : constant := 16#0CF4#;
   GL_UNPACK_SKIP_ROWS      : constant := 16#0CF3#;
   GL_UNPACK_SWAP_BYTES     : constant := 16#0CF0#;
   GL_ZOOM_X                : constant := 16#0D16#;
   GL_ZOOM_Y                : constant := 16#0D17#;

   GL_TEXTURE_ENV            : constant := 16#2300#;
   GL_TEXTURE_ENV_MODE       : constant := 16#2200#;
   GL_TEXTURE_1D             : constant := 16#0DE0#;
   GL_TEXTURE_2D             : constant := 16#0DE1#;
   GL_TEXTURE_WRAP_S         : constant := 16#2802#;
   GL_TEXTURE_WRAP_T         : constant := 16#2803#;
   GL_TEXTURE_MAG_FILTER     : constant := 16#2800#;
   GL_TEXTURE_MIN_FILTER     : constant := 16#2801#;
   GL_TEXTURE_ENV_COLOR      : constant := 16#2201#;
   GL_TEXTURE_GEN_S          : constant := 16#0C60#;
   GL_TEXTURE_GEN_T          : constant := 16#0C61#;
   GL_TEXTURE_GEN_MODE       : constant := 16#2500#;
   GL_TEXTURE_BORDER_COLOR   : constant := 16#1004#;
   GL_TEXTURE_WIDTH          : constant := 16#1000#;
   GL_TEXTURE_HEIGHT         : constant := 16#1001#;
   GL_TEXTURE_BORDER         : constant := 16#1005#;
   GL_TEXTURE_COMPONENTS     : constant := 16#1003#;
   GL_TEXTURE_RED_SIZE       : constant := 16#805C#;
   GL_TEXTURE_GREEN_SIZE     : constant := 16#805D#;
   GL_TEXTURE_BLUE_SIZE      : constant := 16#805E#;
   GL_TEXTURE_ALPHA_SIZE     : constant := 16#805F#;
   GL_TEXTURE_LUMINANCE_SIZE : constant := 16#8060#;
   GL_TEXTURE_INTENSITY_SIZE : constant := 16#8061#;
   GL_NEAREST_MIPMAP_NEAREST : constant := 16#2700#;
   GL_NEAREST_MIPMAP_LINEAR  : constant := 16#2702#;
   GL_LINEAR_MIPMAP_NEAREST  : constant := 16#2701#;
   GL_LINEAR_MIPMAP_LINEAR   : constant := 16#2703#;
   GL_OBJECT_LINEAR          : constant := 16#2401#;
   GL_OBJECT_PLANE           : constant := 16#2501#;
   GL_EYE_LINEAR             : constant := 16#2400#;
   GL_EYE_PLANE              : constant := 16#2502#;
   GL_SPHERE_MAP             : constant := 16#2402#;
   GL_DECAL                  : constant := 16#2101#;
   GL_MODULATE               : constant := 16#2100#;
   GL_NEAREST                : constant := 16#2600#;
   GL_REPEAT                 : constant := 16#2901#;
   GL_CLAMP                  : constant := 16#2900#;
   GL_S                      : constant := 16#2000#;
   GL_T                      : constant := 16#2001#;
   GL_R                      : constant := 16#2002#;
   GL_Q                      : constant := 16#2003#;
   GL_TEXTURE_GEN_R          : constant := 16#0C62#;
   GL_TEXTURE_GEN_Q          : constant := 16#0C63#;

   GL_VENDOR     : constant := 16#1F00#;
   GL_RENDERER   : constant := 16#1F01#;
   GL_VERSION    : constant := 16#1F02#;
   GL_EXTENSIONS : constant := 16#1F03#;

   GL_NO_ERROR          : constant := 16#0#;
   GL_INVALID_VALUE     : constant := 16#0501#;
   GL_INVALID_ENUM      : constant := 16#0500#;
   GL_INVALID_OPERATION : constant := 16#0502#;
   GL_STACK_OVERFLOW    : constant := 16#0503#;
   GL_STACK_UNDERFLOW   : constant := 16#0504#;
   GL_OUT_OF_MEMORY     : constant := 16#0505#;

   GL_CURRENT_BIT         : constant := 16#00000001#;
   GL_POINT_BIT           : constant := 16#00000002#;
   GL_LINE_BIT            : constant := 16#00000004#;
   GL_POLYGON_BIT         : constant := 16#00000008#;
   GL_POLYGON_STIPPLE_BIT : constant := 16#00000010#;
   GL_PIXEL_MODE_BIT      : constant := 16#00000020#;
   GL_LIGHTING_BIT        : constant := 16#00000040#;
   GL_FOG_BIT             : constant := 16#00000080#;
   GL_DEPTH_BUFFER_BIT    : constant := 16#00000100#;
   GL_ACCUM_BUFFER_BIT    : constant := 16#00000200#;
   GL_STENCIL_BUFFER_BIT  : constant := 16#00000400#;
   GL_VIEWPORT_BIT        : constant := 16#00000800#;
   GL_TRANSFORM_BIT       : constant := 16#00001000#;
   GL_ENABLE_BIT          : constant := 16#00002000#;
   GL_COLOR_BUFFER_BIT    : constant := 16#00004000#;
   GL_HINT_BIT            : constant := 16#00008000#;
   GL_EVAL_BIT            : constant := 16#00010000#;
   GL_LIST_BIT            : constant := 16#00020000#;
   GL_TEXTURE_BIT         : constant := 16#00040000#;
   GL_SCISSOR_BIT         : constant := 16#00080000#;
   GL_ALL_ATTRIB_BITS     : constant := 16#000FFFFF#;

   GL_PROXY_TEXTURE_1D        : constant := 16#8063#;
   GL_PROXY_TEXTURE_2D        : constant := 16#8064#;
   GL_TEXTURE_PRIORITY        : constant := 16#8066#;
   GL_TEXTURE_RESIDENT        : constant := 16#8067#;
   GL_TEXTURE_BINDING_1D      : constant := 16#8068#;
   GL_TEXTURE_BINDING_2D      : constant := 16#8069#;
   GL_TEXTURE_INTERNAL_FORMAT : constant := 16#1003#;
   GL_ALPHA4                  : constant := 16#803B#;
   GL_ALPHA8                  : constant := 16#803C#;
   GL_ALPHA12                 : constant := 16#803D#;
   GL_ALPHA16                 : constant := 16#803E#;
   GL_LUMINANCE4              : constant := 16#803F#;
   GL_LUMINANCE8              : constant := 16#8040#;
   GL_LUMINANCE12             : constant := 16#8041#;
   GL_LUMINANCE16             : constant := 16#8042#;
   GL_LUMINANCE4_ALPHA4       : constant := 16#8043#;
   GL_LUMINANCE6_ALPHA2       : constant := 16#8044#;
   GL_LUMINANCE8_ALPHA8       : constant := 16#8045#;
   GL_LUMINANCE12_ALPHA4      : constant := 16#8046#;
   GL_LUMINANCE12_ALPHA12     : constant := 16#8047#;
   GL_LUMINANCE16_ALPHA16     : constant := 16#8048#;
   GL_INTENSITY               : constant := 16#8049#;
   GL_INTENSITY4              : constant := 16#804A#;
   GL_INTENSITY8              : constant := 16#804B#;
   GL_INTENSITY12             : constant := 16#804C#;
   GL_INTENSITY16             : constant := 16#804D#;
   GL_R3_G3_B2                : constant := 16#2A10#;
   GL_RGB4                    : constant := 16#804F#;
   GL_RGB5                    : constant := 16#8050#;
   GL_RGB8                    : constant := 16#8051#;
   GL_RGB10                   : constant := 16#8052#;
   GL_RGB12                   : constant := 16#8053#;
   GL_RGB16                   : constant := 16#8054#;
   GL_RGBA2                   : constant := 16#8055#;
   GL_RGBA4                   : constant := 16#8056#;
   GL_RGB5_A1                 : constant := 16#8057#;
   GL_RGBA8                   : constant := 16#8058#;
   GL_RGB10_A2                : constant := 16#8059#;
   GL_RGBA12                  : constant := 16#805A#;
   GL_RGBA16                  : constant := 16#805B#;
   GL_CLIENT_PIXEL_STORE_BIT  : constant := 16#00000001#;
   GL_CLIENT_VERTEX_ARRAY_BIT : constant := 16#00000002#;
   GL_ALL_CLIENT_ATTRIB_BITS  : constant := 16#FFFFFFFF#;
   GL_CLIENT_ALL_ATTRIB_BITS  : constant := 16#FFFFFFFF#;

   ---------------------------------------------------------------------------
   -- TYPES
   ---------------------------------------------------------------------------

   type GLenum is new Interfaces.C.unsigned;
   type GLboolean is new Interfaces.C.unsigned_char;
   type GLbitfield is new Interfaces.C.unsigned;
   type GLvoid is new System.Address;
   type GLbyte is new Interfaces.C.signed_char;
   type GLshort is new Interfaces.C.short;
   type GLint is new Interfaces.C.int;
   type GLubyte is new Interfaces.C.unsigned_char;
   type GLushort is new Interfaces.C.unsigned_short;
   type GLuint is new Interfaces.C.unsigned;
   type GLsizei is new Interfaces.C.int;
   type GLfloat is new Interfaces.C.C_float;
   type GLclampf is new Interfaces.C.C_float;
   type GLdouble is new Interfaces.C.double;
   type GLclampd is new Interfaces.C.double;

   ---------------------------------------------------------------------------
   -- FUNCTION PROTOTYPES
   ---------------------------------------------------------------------------

   procedure glClearIndex (c : GLfloat);
   pragma Import (Stdcall, glClearIndex, "glClearIndex");

   procedure glClearColor
     (red   : GLclampf;
      green : GLclampf;
      blue  : GLclampf;
      alpha : GLclampf);
   pragma Import (Stdcall, glClearColor, "glClearColor");

   procedure glClear (mask : GLbitfield);
   pragma Import (Stdcall, glClear, "glClear");

   procedure glIndexMask (mask : GLuint);
   pragma Import (Stdcall, glIndexMask, "glIndexMask");

   procedure glColorMask
     (red   : GLboolean;
      green : GLboolean;
      blue  : GLboolean;
      alpha : GLboolean);
   pragma Import (Stdcall, glColorMask, "glColorMask");

   procedure glAlphaFunc (func : GLenum; ref : GLclampf);
   pragma Import (Stdcall, glAlphaFunc, "glAlphaFunc");

   procedure glBlendFunc (sfactor : GLenum; dfactor : GLenum);
   pragma Import (Stdcall, glBlendFunc, "glBlendFunc");

   procedure glLogicOp (opcode : GLenum);
   pragma Import (Stdcall, glLogicOp, "glLogicOp");

   procedure glCullFace (mode : GLenum);
   pragma Import (Stdcall, glCullFace, "glCullFace");

   procedure glFrontFace (mode : GLenum);
   pragma Import (Stdcall, glFrontFace, "glFrontFace");

   procedure glPointSize (size : GLfloat);
   pragma Import (Stdcall, glPointSize, "glPointSize");

   procedure glLineWidth (width : GLfloat);
   pragma Import (Stdcall, glLineWidth, "glLineWidth");

   procedure glLineStipple (factor : GLint; pattern : GLushort);
   pragma Import (Stdcall, glLineStipple, "glLineStipple");

   procedure glPolygonMode (face : GLenum; mode : GLenum);
   pragma Import (Stdcall, glPolygonMode, "glPolygonMode");

   procedure glPolygonOffset (factor : GLfloat; units : GLfloat);
   pragma Import (Stdcall, glPolygonOffset, "glPolygonOffset");

   procedure glPolygonStipple (mask : access GLubyte);
   pragma Import (Stdcall, glPolygonStipple, "glPolygonStipple");

   procedure glGetPolygonStipple (mask : access GLubyte);
   pragma Import (Stdcall, glGetPolygonStipple, "glGetPolygonStipple");

   procedure glEdgeFlag (flag : GLboolean);
   pragma Import (Stdcall, glEdgeFlag, "glEdgeFlag");

   procedure glEdgeFlagv (flag : access GLboolean);
   pragma Import (Stdcall, glEdgeFlagv, "glEdgeFlagv");

   procedure glScissor
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei);
   pragma Import (Stdcall, glScissor, "glScissor");

   procedure glClipPlane (plane : GLenum; equation : access GLdouble);
   pragma Import (Stdcall, glClipPlane, "glClipPlane");

   procedure glGetClipPlane (plane : GLenum; equation : access GLdouble);
   pragma Import (Stdcall, glGetClipPlane, "glGetClipPlane");

   procedure glDrawBuffer (mode : GLenum);
   pragma Import (Stdcall, glDrawBuffer, "glDrawBuffer");

   procedure glReadBuffer (mode : GLenum);
   pragma Import (Stdcall, glReadBuffer, "glReadBuffer");

   procedure glEnable (cap : GLenum);
   pragma Import (Stdcall, glEnable, "glEnable");

   procedure glDisable (cap : GLenum);
   pragma Import (Stdcall, glDisable, "glDisable");

   function glIsEnabled (cap : GLenum) return GLboolean;
   pragma Import (Stdcall, glIsEnabled, "glIsEnabled");

   procedure glEnableClientState (cap : GLenum);
   pragma Import (Stdcall, glEnableClientState, "glEnableClientState");

   procedure glDisableClientState (cap : GLenum);
   pragma Import (Stdcall, glDisableClientState, "glDisableClientState");

   procedure glGetBooleanv (pname : GLenum; params : access GLboolean);
   pragma Import (Stdcall, glGetBooleanv, "glGetBooleanv");

   procedure glGetDoublev (pname : GLenum; params : access GLdouble);
   pragma Import (Stdcall, glGetDoublev, "glGetDoublev");

   procedure glGetFloatv (pname : GLenum; params : access GLfloat);
   pragma Import (Stdcall, glGetFloatv, "glGetFloatv");

   procedure glGetIntegerv (pname : GLenum; params : access GLint);
   pragma Import (Stdcall, glGetIntegerv, "glGetIntegerv");

   procedure glPushAttrib (mask : GLbitfield);
   pragma Import (Stdcall, glPushAttrib, "glPushAttrib");

   procedure glPopAttrib;
   pragma Import (Stdcall, glPopAttrib, "glPopAttrib");

   procedure glPushClientAttrib (mask : GLbitfield);
   pragma Import (Stdcall, glPushClientAttrib, "glPushClientAttrib");

   procedure glPopClientAttrib;
   pragma Import (Stdcall, glPopClientAttrib, "glPopClientAttrib");

   function glRenderMode (mode : GLenum) return GLint;
   pragma Import (Stdcall, glRenderMode, "glRenderMode");

   function glGetError return GLenum;
   pragma Import (Stdcall, glGetError, "glGetError");

   function glGetString (name : GLenum) return access GLubyte;
   pragma Import (Stdcall, glGetString, "glGetString");

   procedure glFinish;
   pragma Import (Stdcall, glFinish, "glFinish");

   procedure glFlush;
   pragma Import (Stdcall, glFlush, "glFlush");

   procedure glHint (target : GLenum; mode : GLenum);
   pragma Import (Stdcall, glHint, "glHint");

   procedure glClearDepth (depth : GLclampd);
   pragma Import (Stdcall, glClearDepth, "glClearDepth");

   procedure glDepthFunc (func : GLenum);
   pragma Import (Stdcall, glDepthFunc, "glDepthFunc");

   procedure glDepthMask (flag : GLboolean);
   pragma Import (Stdcall, glDepthMask, "glDepthMask");

   procedure glDepthRange (near_val : GLclampd; far_val : GLclampd);
   pragma Import (Stdcall, glDepthRange, "glDepthRange");

   procedure glClearAccum
     (red   : GLfloat;
      green : GLfloat;
      blue  : GLfloat;
      alpha : GLfloat);
   pragma Import (Stdcall, glClearAccum, "glClearAccum");

   procedure glAccum (op : GLenum; value : GLfloat);
   pragma Import (Stdcall, glAccum, "glAccum");

   procedure glMatrixMode (mode : GLenum);
   pragma Import (Stdcall, glMatrixMode, "glMatrixMode");

   procedure glOrtho
     (left     : GLdouble;
      right    : GLdouble;
      bottom   : GLdouble;
      top      : GLdouble;
      near_val : GLdouble;
      far_val  : GLdouble);
   pragma Import (Stdcall, glOrtho, "glOrtho");

   procedure glFrustum
     (left     : GLdouble;
      right    : GLdouble;
      bottom   : GLdouble;
      top      : GLdouble;
      near_val : GLdouble;
      far_val  : GLdouble);
   pragma Import (Stdcall, glFrustum, "glFrustum");

   procedure glViewport
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei);
   pragma Import (Stdcall, glViewport, "glViewport");

   procedure glPushMatrix;
   pragma Import (Stdcall, glPushMatrix, "glPushMatrix");

   procedure glPopMatrix;
   pragma Import (Stdcall, glPopMatrix, "glPopMatrix");

   procedure glLoadIdentity;
   pragma Import (Stdcall, glLoadIdentity, "glLoadIdentity");

   procedure glLoadMatrixd (m : access GLdouble);
   pragma Import (Stdcall, glLoadMatrixd, "glLoadMatrixd");

   procedure glLoadMatrixf (m : access GLfloat);
   pragma Import (Stdcall, glLoadMatrixf, "glLoadMatrixf");

   procedure glMultMatrixd (m : access GLdouble);
   pragma Import (Stdcall, glMultMatrixd, "glMultMatrixd");

   procedure glMultMatrixf (m : access GLfloat);
   pragma Import (Stdcall, glMultMatrixf, "glMultMatrixf");

   procedure glRotated
     (angle : GLdouble;
      x     : GLdouble;
      y     : GLdouble;
      z     : GLdouble);
   pragma Import (Stdcall, glRotated, "glRotated");

   procedure glRotatef
     (angle : GLfloat;
      x     : GLfloat;
      y     : GLfloat;
      z     : GLfloat);
   pragma Import (Stdcall, glRotatef, "glRotatef");

   procedure glScaled (x : GLdouble; y : GLdouble; z : GLdouble);
   pragma Import (Stdcall, glScaled, "glScaled");

   procedure glScalef (x : GLfloat; y : GLfloat; z : GLfloat);
   pragma Import (Stdcall, glScalef, "glScalef");

   procedure glTranslated (x : GLdouble; y : GLdouble; z : GLdouble);
   pragma Import (Stdcall, glTranslated, "glTranslated");

   procedure glTranslatef (x : GLfloat; y : GLfloat; z : GLfloat);
   pragma Import (Stdcall, glTranslatef, "glTranslatef");

   function glIsList (list : GLuint) return GLboolean;
   pragma Import (Stdcall, glIsList, "glIsList");

   procedure glDeleteLists (list : GLuint; c_range : GLsizei);
   pragma Import (Stdcall, glDeleteLists, "glDeleteLists");

   function glGenLists (c_range : GLsizei) return GLuint;
   pragma Import (Stdcall, glGenLists, "glGenLists");

   procedure glNewList (list : GLuint; mode : GLenum);
   pragma Import (Stdcall, glNewList, "glNewList");

   procedure glEndList;
   pragma Import (Stdcall, glEndList, "glEndList");

   procedure glCallList (list : GLuint);
   pragma Import (Stdcall, glCallList, "glCallList");

   procedure glCallLists
     (n      : GLsizei;
      c_type : GLenum;
      lists  : System.Address);
   pragma Import (Stdcall, glCallLists, "glCallLists");

   procedure glListBase (base : GLuint);
   pragma Import (Stdcall, glListBase, "glListBase");

   procedure glBegin (mode : GLenum);
   pragma Import (Stdcall, glBegin, "glBegin");

   procedure glEnd;
   pragma Import (Stdcall, glEnd, "glEnd");

   procedure glVertex2d (x : GLdouble; y : GLdouble);
   pragma Import (Stdcall, glVertex2d, "glVertex2d");

   procedure glVertex2f (x : GLfloat; y : GLfloat);
   pragma Import (Stdcall, glVertex2f, "glVertex2f");

   procedure glVertex2i (x : GLint; y : GLint);
   pragma Import (Stdcall, glVertex2i, "glVertex2i");

   procedure glVertex2s (x : GLshort; y : GLshort);
   pragma Import (Stdcall, glVertex2s, "glVertex2s");

   procedure glVertex3d (x : GLdouble; y : GLdouble; z : GLdouble);
   pragma Import (Stdcall, glVertex3d, "glVertex3d");

   procedure glVertex3f (x : GLfloat; y : GLfloat; z : GLfloat);
   pragma Import (Stdcall, glVertex3f, "glVertex3f");

   procedure glVertex3i (x : GLint; y : GLint; z : GLint);
   pragma Import (Stdcall, glVertex3i, "glVertex3i");

   procedure glVertex3s (x : GLshort; y : GLshort; z : GLshort);
   pragma Import (Stdcall, glVertex3s, "glVertex3s");

   procedure glVertex4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble);
   pragma Import (Stdcall, glVertex4d, "glVertex4d");

   procedure glVertex4f (x : GLfloat; y : GLfloat; z : GLfloat; w : GLfloat);
   pragma Import (Stdcall, glVertex4f, "glVertex4f");

   procedure glVertex4i (x : GLint; y : GLint; z : GLint; w : GLint);
   pragma Import (Stdcall, glVertex4i, "glVertex4i");

   procedure glVertex4s (x : GLshort; y : GLshort; z : GLshort; w : GLshort);
   pragma Import (Stdcall, glVertex4s, "glVertex4s");

   procedure glVertex2dv (v : access GLdouble);
   pragma Import (Stdcall, glVertex2dv, "glVertex2dv");

   procedure glVertex2fv (v : access GLfloat);
   pragma Import (Stdcall, glVertex2fv, "glVertex2fv");

   procedure glVertex2iv (v : access GLint);
   pragma Import (Stdcall, glVertex2iv, "glVertex2iv");

   procedure glVertex2sv (v : access GLshort);
   pragma Import (Stdcall, glVertex2sv, "glVertex2sv");

   procedure glVertex3dv (v : access GLdouble);
   pragma Import (Stdcall, glVertex3dv, "glVertex3dv");

   procedure glVertex3fv (v : access GLfloat);
   pragma Import (Stdcall, glVertex3fv, "glVertex3fv");

   procedure glVertex3iv (v : access GLint);
   pragma Import (Stdcall, glVertex3iv, "glVertex3iv");

   procedure glVertex3sv (v : access GLshort);
   pragma Import (Stdcall, glVertex3sv, "glVertex3sv");

   procedure glVertex4dv (v : access GLdouble);
   pragma Import (Stdcall, glVertex4dv, "glVertex4dv");

   procedure glVertex4fv (v : access GLfloat);
   pragma Import (Stdcall, glVertex4fv, "glVertex4fv");

   procedure glVertex4iv (v : access GLint);
   pragma Import (Stdcall, glVertex4iv, "glVertex4iv");

   procedure glVertex4sv (v : access GLshort);
   pragma Import (Stdcall, glVertex4sv, "glVertex4sv");

   procedure glNormal3b (nx : GLbyte; ny : GLbyte; nz : GLbyte);
   pragma Import (Stdcall, glNormal3b, "glNormal3b");

   procedure glNormal3d (nx : GLdouble; ny : GLdouble; nz : GLdouble);
   pragma Import (Stdcall, glNormal3d, "glNormal3d");

   procedure glNormal3f (nx : GLfloat; ny : GLfloat; nz : GLfloat);
   pragma Import (Stdcall, glNormal3f, "glNormal3f");

   procedure glNormal3i (nx : GLint; ny : GLint; nz : GLint);
   pragma Import (Stdcall, glNormal3i, "glNormal3i");

   procedure glNormal3s (nx : GLshort; ny : GLshort; nz : GLshort);
   pragma Import (Stdcall, glNormal3s, "glNormal3s");

   procedure glNormal3bv (v : access GLbyte);
   pragma Import (Stdcall, glNormal3bv, "glNormal3bv");

   procedure glNormal3dv (v : access GLdouble);
   pragma Import (Stdcall, glNormal3dv, "glNormal3dv");

   procedure glNormal3fv (v : access GLfloat);
   pragma Import (Stdcall, glNormal3fv, "glNormal3fv");

   procedure glNormal3iv (v : access GLint);
   pragma Import (Stdcall, glNormal3iv, "glNormal3iv");

   procedure glNormal3sv (v : access GLshort);
   pragma Import (Stdcall, glNormal3sv, "glNormal3sv");

   procedure glIndexd (c : GLdouble);
   pragma Import (Stdcall, glIndexd, "glIndexd");

   procedure glIndexf (c : GLfloat);
   pragma Import (Stdcall, glIndexf, "glIndexf");

   procedure glIndexi (c : GLint);
   pragma Import (Stdcall, glIndexi, "glIndexi");

   procedure glIndexs (c : GLshort);
   pragma Import (Stdcall, glIndexs, "glIndexs");

   procedure glIndexub (c : GLubyte);
   pragma Import (Stdcall, glIndexub, "glIndexub");

   procedure glIndexdv (c : access GLdouble);
   pragma Import (Stdcall, glIndexdv, "glIndexdv");

   procedure glIndexfv (c : access GLfloat);
   pragma Import (Stdcall, glIndexfv, "glIndexfv");

   procedure glIndexiv (c : access GLint);
   pragma Import (Stdcall, glIndexiv, "glIndexiv");

   procedure glIndexsv (c : access GLshort);
   pragma Import (Stdcall, glIndexsv, "glIndexsv");

   procedure glIndexubv (c : access GLubyte);
   pragma Import (Stdcall, glIndexubv, "glIndexubv");

   procedure glColor3b (red : GLbyte; green : GLbyte; blue : GLbyte);
   pragma Import (Stdcall, glColor3b, "glColor3b");

   procedure glColor3d (red : GLdouble; green : GLdouble; blue : GLdouble);
   pragma Import (Stdcall, glColor3d, "glColor3d");

   procedure glColor3f (red : GLfloat; green : GLfloat; blue : GLfloat);
   pragma Import (Stdcall, glColor3f, "glColor3f");

   procedure glColor3i (red : GLint; green : GLint; blue : GLint);
   pragma Import (Stdcall, glColor3i, "glColor3i");

   procedure glColor3s (red : GLshort; green : GLshort; blue : GLshort);
   pragma Import (Stdcall, glColor3s, "glColor3s");

   procedure glColor3ub (red : GLubyte; green : GLubyte; blue : GLubyte);
   pragma Import (Stdcall, glColor3ub, "glColor3ub");

   procedure glColor3ui (red : GLuint; green : GLuint; blue : GLuint);
   pragma Import (Stdcall, glColor3ui, "glColor3ui");

   procedure glColor3us (red : GLushort; green : GLushort; blue : GLushort);
   pragma Import (Stdcall, glColor3us, "glColor3us");

   procedure glColor4b
     (red   : GLbyte;
      green : GLbyte;
      blue  : GLbyte;
      alpha : GLbyte);
   pragma Import (Stdcall, glColor4b, "glColor4b");

   procedure glColor4d
     (red   : GLdouble;
      green : GLdouble;
      blue  : GLdouble;
      alpha : GLdouble);
   pragma Import (Stdcall, glColor4d, "glColor4d");

   procedure glColor4f
     (red   : GLfloat;
      green : GLfloat;
      blue  : GLfloat;
      alpha : GLfloat);
   pragma Import (Stdcall, glColor4f, "glColor4f");

   procedure glColor4i
     (red   : GLint;
      green : GLint;
      blue  : GLint;
      alpha : GLint);
   pragma Import (Stdcall, glColor4i, "glColor4i");

   procedure glColor4s
     (red   : GLshort;
      green : GLshort;
      blue  : GLshort;
      alpha : GLshort);
   pragma Import (Stdcall, glColor4s, "glColor4s");

   procedure glColor4ub
     (red   : GLubyte;
      green : GLubyte;
      blue  : GLubyte;
      alpha : GLubyte);
   pragma Import (Stdcall, glColor4ub, "glColor4ub");

   procedure glColor4ui
     (red   : GLuint;
      green : GLuint;
      blue  : GLuint;
      alpha : GLuint);
   pragma Import (Stdcall, glColor4ui, "glColor4ui");

   procedure glColor4us
     (red   : GLushort;
      green : GLushort;
      blue  : GLushort;
      alpha : GLushort);
   pragma Import (Stdcall, glColor4us, "glColor4us");

   procedure glColor3bv (v : access GLbyte);
   pragma Import (Stdcall, glColor3bv, "glColor3bv");

   procedure glColor3dv (v : access GLdouble);
   pragma Import (Stdcall, glColor3dv, "glColor3dv");

   procedure glColor3fv (v : access GLfloat);
   pragma Import (Stdcall, glColor3fv, "glColor3fv");

   procedure glColor3iv (v : access GLint);
   pragma Import (Stdcall, glColor3iv, "glColor3iv");

   procedure glColor3sv (v : access GLshort);
   pragma Import (Stdcall, glColor3sv, "glColor3sv");

   procedure glColor3ubv (v : access GLubyte);
   pragma Import (Stdcall, glColor3ubv, "glColor3ubv");

   procedure glColor3uiv (v : access GLuint);
   pragma Import (Stdcall, glColor3uiv, "glColor3uiv");

   procedure glColor3usv (v : access GLushort);
   pragma Import (Stdcall, glColor3usv, "glColor3usv");

   procedure glColor4bv (v : access GLbyte);
   pragma Import (Stdcall, glColor4bv, "glColor4bv");

   procedure glColor4dv (v : access GLdouble);
   pragma Import (Stdcall, glColor4dv, "glColor4dv");

   procedure glColor4fv (v : access GLfloat);
   pragma Import (Stdcall, glColor4fv, "glColor4fv");

   procedure glColor4iv (v : access GLint);
   pragma Import (Stdcall, glColor4iv, "glColor4iv");

   procedure glColor4sv (v : access GLshort);
   pragma Import (Stdcall, glColor4sv, "glColor4sv");

   procedure glColor4ubv (v : access GLubyte);
   pragma Import (Stdcall, glColor4ubv, "glColor4ubv");

   procedure glColor4uiv (v : access GLuint);
   pragma Import (Stdcall, glColor4uiv, "glColor4uiv");

   procedure glColor4usv (v : access GLushort);
   pragma Import (Stdcall, glColor4usv, "glColor4usv");

   procedure glTexCoord1d (s : GLdouble);
   pragma Import (Stdcall, glTexCoord1d, "glTexCoord1d");

   procedure glTexCoord1f (s : GLfloat);
   pragma Import (Stdcall, glTexCoord1f, "glTexCoord1f");

   procedure glTexCoord1i (s : GLint);
   pragma Import (Stdcall, glTexCoord1i, "glTexCoord1i");

   procedure glTexCoord1s (s : GLshort);
   pragma Import (Stdcall, glTexCoord1s, "glTexCoord1s");

   procedure glTexCoord2d (s : GLdouble; t : GLdouble);
   pragma Import (Stdcall, glTexCoord2d, "glTexCoord2d");

   procedure glTexCoord2f (s : GLfloat; t : GLfloat);
   pragma Import (Stdcall, glTexCoord2f, "glTexCoord2f");

   procedure glTexCoord2i (s : GLint; t : GLint);
   pragma Import (Stdcall, glTexCoord2i, "glTexCoord2i");

   procedure glTexCoord2s (s : GLshort; t : GLshort);
   pragma Import (Stdcall, glTexCoord2s, "glTexCoord2s");

   procedure glTexCoord3d (s : GLdouble; t : GLdouble; r : GLdouble);
   pragma Import (Stdcall, glTexCoord3d, "glTexCoord3d");

   procedure glTexCoord3f (s : GLfloat; t : GLfloat; r : GLfloat);
   pragma Import (Stdcall, glTexCoord3f, "glTexCoord3f");

   procedure glTexCoord3i (s : GLint; t : GLint; r : GLint);
   pragma Import (Stdcall, glTexCoord3i, "glTexCoord3i");

   procedure glTexCoord3s (s : GLshort; t : GLshort; r : GLshort);
   pragma Import (Stdcall, glTexCoord3s, "glTexCoord3s");

   procedure glTexCoord4d
     (s : GLdouble;
      t : GLdouble;
      r : GLdouble;
      q : GLdouble);
   pragma Import (Stdcall, glTexCoord4d, "glTexCoord4d");

   procedure glTexCoord4f (s : GLfloat; t : GLfloat; r : GLfloat; q : GLfloat);
   pragma Import (Stdcall, glTexCoord4f, "glTexCoord4f");

   procedure glTexCoord4i (s : GLint; t : GLint; r : GLint; q : GLint);
   pragma Import (Stdcall, glTexCoord4i, "glTexCoord4i");

   procedure glTexCoord4s (s : GLshort; t : GLshort; r : GLshort; q : GLshort);
   pragma Import (Stdcall, glTexCoord4s, "glTexCoord4s");

   procedure glTexCoord1dv (v : access GLdouble);
   pragma Import (Stdcall, glTexCoord1dv, "glTexCoord1dv");

   procedure glTexCoord1fv (v : access GLfloat);
   pragma Import (Stdcall, glTexCoord1fv, "glTexCoord1fv");

   procedure glTexCoord1iv (v : access GLint);
   pragma Import (Stdcall, glTexCoord1iv, "glTexCoord1iv");

   procedure glTexCoord1sv (v : access GLshort);
   pragma Import (Stdcall, glTexCoord1sv, "glTexCoord1sv");

   procedure glTexCoord2dv (v : access GLdouble);
   pragma Import (Stdcall, glTexCoord2dv, "glTexCoord2dv");

   procedure glTexCoord2fv (v : access GLfloat);
   pragma Import (Stdcall, glTexCoord2fv, "glTexCoord2fv");

   procedure glTexCoord2iv (v : access GLint);
   pragma Import (Stdcall, glTexCoord2iv, "glTexCoord2iv");

   procedure glTexCoord2sv (v : access GLshort);
   pragma Import (Stdcall, glTexCoord2sv, "glTexCoord2sv");

   procedure glTexCoord3dv (v : access GLdouble);
   pragma Import (Stdcall, glTexCoord3dv, "glTexCoord3dv");

   procedure glTexCoord3fv (v : access GLfloat);
   pragma Import (Stdcall, glTexCoord3fv, "glTexCoord3fv");

   procedure glTexCoord3iv (v : access GLint);
   pragma Import (Stdcall, glTexCoord3iv, "glTexCoord3iv");

   procedure glTexCoord3sv (v : access GLshort);
   pragma Import (Stdcall, glTexCoord3sv, "glTexCoord3sv");

   procedure glTexCoord4dv (v : access GLdouble);
   pragma Import (Stdcall, glTexCoord4dv, "glTexCoord4dv");

   procedure glTexCoord4fv (v : access GLfloat);
   pragma Import (Stdcall, glTexCoord4fv, "glTexCoord4fv");

   procedure glTexCoord4iv (v : access GLint);
   pragma Import (Stdcall, glTexCoord4iv, "glTexCoord4iv");

   procedure glTexCoord4sv (v : access GLshort);
   pragma Import (Stdcall, glTexCoord4sv, "glTexCoord4sv");

   procedure glRasterPos2d (x : GLdouble; y : GLdouble);
   pragma Import (Stdcall, glRasterPos2d, "glRasterPos2d");

   procedure glRasterPos2f (x : GLfloat; y : GLfloat);
   pragma Import (Stdcall, glRasterPos2f, "glRasterPos2f");

   procedure glRasterPos2i (x : GLint; y : GLint);
   pragma Import (Stdcall, glRasterPos2i, "glRasterPos2i");

   procedure glRasterPos2s (x : GLshort; y : GLshort);
   pragma Import (Stdcall, glRasterPos2s, "glRasterPos2s");

   procedure glRasterPos3d (x : GLdouble; y : GLdouble; z : GLdouble);
   pragma Import (Stdcall, glRasterPos3d, "glRasterPos3d");

   procedure glRasterPos3f (x : GLfloat; y : GLfloat; z : GLfloat);
   pragma Import (Stdcall, glRasterPos3f, "glRasterPos3f");

   procedure glRasterPos3i (x : GLint; y : GLint; z : GLint);
   pragma Import (Stdcall, glRasterPos3i, "glRasterPos3i");

   procedure glRasterPos3s (x : GLshort; y : GLshort; z : GLshort);
   pragma Import (Stdcall, glRasterPos3s, "glRasterPos3s");

   procedure glRasterPos4d
     (x : GLdouble;
      y : GLdouble;
      z : GLdouble;
      w : GLdouble);
   pragma Import (Stdcall, glRasterPos4d, "glRasterPos4d");

   procedure glRasterPos4f
     (x : GLfloat;
      y : GLfloat;
      z : GLfloat;
      w : GLfloat);
   pragma Import (Stdcall, glRasterPos4f, "glRasterPos4f");

   procedure glRasterPos4i (x : GLint; y : GLint; z : GLint; w : GLint);
   pragma Import (Stdcall, glRasterPos4i, "glRasterPos4i");

   procedure glRasterPos4s
     (x : GLshort;
      y : GLshort;
      z : GLshort;
      w : GLshort);
   pragma Import (Stdcall, glRasterPos4s, "glRasterPos4s");

   procedure glRasterPos2dv (v : access GLdouble);
   pragma Import (Stdcall, glRasterPos2dv, "glRasterPos2dv");

   procedure glRasterPos2fv (v : access GLfloat);
   pragma Import (Stdcall, glRasterPos2fv, "glRasterPos2fv");

   procedure glRasterPos2iv (v : access GLint);
   pragma Import (Stdcall, glRasterPos2iv, "glRasterPos2iv");

   procedure glRasterPos2sv (v : access GLshort);
   pragma Import (Stdcall, glRasterPos2sv, "glRasterPos2sv");

   procedure glRasterPos3dv (v : access GLdouble);
   pragma Import (Stdcall, glRasterPos3dv, "glRasterPos3dv");

   procedure glRasterPos3fv (v : access GLfloat);
   pragma Import (Stdcall, glRasterPos3fv, "glRasterPos3fv");

   procedure glRasterPos3iv (v : access GLint);
   pragma Import (Stdcall, glRasterPos3iv, "glRasterPos3iv");

   procedure glRasterPos3sv (v : access GLshort);
   pragma Import (Stdcall, glRasterPos3sv, "glRasterPos3sv");

   procedure glRasterPos4dv (v : access GLdouble);
   pragma Import (Stdcall, glRasterPos4dv, "glRasterPos4dv");

   procedure glRasterPos4fv (v : access GLfloat);
   pragma Import (Stdcall, glRasterPos4fv, "glRasterPos4fv");

   procedure glRasterPos4iv (v : access GLint);
   pragma Import (Stdcall, glRasterPos4iv, "glRasterPos4iv");

   procedure glRasterPos4sv (v : access GLshort);
   pragma Import (Stdcall, glRasterPos4sv, "glRasterPos4sv");

   procedure glRectd
     (x1 : GLdouble;
      y1 : GLdouble;
      x2 : GLdouble;
      y2 : GLdouble);
   pragma Import (Stdcall, glRectd, "glRectd");

   procedure glRectf (x1 : GLfloat; y1 : GLfloat; x2 : GLfloat; y2 : GLfloat);
   pragma Import (Stdcall, glRectf, "glRectf");

   procedure glRecti (x1 : GLint; y1 : GLint; x2 : GLint; y2 : GLint);
   pragma Import (Stdcall, glRecti, "glRecti");

   procedure glRects (x1 : GLshort; y1 : GLshort; x2 : GLshort; y2 : GLshort);
   pragma Import (Stdcall, glRects, "glRects");

   procedure glRectdv (v1 : access GLdouble; v2 : access GLdouble);
   pragma Import (Stdcall, glRectdv, "glRectdv");

   procedure glRectfv (v1 : access GLfloat; v2 : access GLfloat);
   pragma Import (Stdcall, glRectfv, "glRectfv");

   procedure glRectiv (v1 : access GLint; v2 : access GLint);
   pragma Import (Stdcall, glRectiv, "glRectiv");

   procedure glRectsv (v1 : access GLshort; v2 : access GLshort);
   pragma Import (Stdcall, glRectsv, "glRectsv");

   procedure glShadeModel (mode : GLenum);
   pragma Import (Stdcall, glShadeModel, "glShadeModel");

   procedure glLightf (light : GLenum; pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glLightf, "glLightf");

   procedure glLighti (light : GLenum; pname : GLenum; param : GLint);
   pragma Import (Stdcall, glLighti, "glLighti");

   procedure glLightfv
     (light  : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glLightfv, "glLightfv");

   procedure glLightiv (light : GLenum; pname : GLenum; params : access GLint);
   pragma Import (Stdcall, glLightiv, "glLightiv");

   procedure glGetLightfv
     (light  : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glGetLightfv, "glGetLightfv");

   procedure glGetLightiv
     (light  : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glGetLightiv, "glGetLightiv");

   procedure glLightModelf (pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glLightModelf, "glLightModelf");

   procedure glLightModeli (pname : GLenum; param : GLint);
   pragma Import (Stdcall, glLightModeli, "glLightModeli");

   procedure glLightModelfv (pname : GLenum; params : access GLfloat);
   pragma Import (Stdcall, glLightModelfv, "glLightModelfv");

   procedure glLightModeliv (pname : GLenum; params : access GLint);
   pragma Import (Stdcall, glLightModeliv, "glLightModeliv");

   procedure glMaterialf (face : GLenum; pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glMaterialf, "glMaterialf");

   procedure glMateriali (face : GLenum; pname : GLenum; param : GLint);
   pragma Import (Stdcall, glMateriali, "glMateriali");

   procedure glMaterialfv
     (face   : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glMaterialfv, "glMaterialfv");

   procedure glMaterialiv
     (face   : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glMaterialiv, "glMaterialiv");

   procedure glGetMaterialfv
     (face   : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glGetMaterialfv, "glGetMaterialfv");

   procedure glGetMaterialiv
     (face   : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glGetMaterialiv, "glGetMaterialiv");

   procedure glColorMaterial (face : GLenum; mode : GLenum);
   pragma Import (Stdcall, glColorMaterial, "glColorMaterial");

   procedure glPixelZoom (xfactor : GLfloat; yfactor : GLfloat);
   pragma Import (Stdcall, glPixelZoom, "glPixelZoom");

   procedure glPixelStoref (pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glPixelStoref, "glPixelStoref");

   procedure glPixelStorei (pname : GLenum; param : GLint);
   pragma Import (Stdcall, glPixelStorei, "glPixelStorei");

   procedure glPixelTransferf (pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glPixelTransferf, "glPixelTransferf");

   procedure glPixelTransferi (pname : GLenum; param : GLint);
   pragma Import (Stdcall, glPixelTransferi, "glPixelTransferi");

   procedure glPixelMapfv
     (map     : GLenum;
      mapsize : GLint;
      values  : access GLfloat);
   pragma Import (Stdcall, glPixelMapfv, "glPixelMapfv");

   procedure glPixelMapuiv
     (map     : GLenum;
      mapsize : GLint;
      values  : access GLuint);
   pragma Import (Stdcall, glPixelMapuiv, "glPixelMapuiv");

   procedure glPixelMapusv
     (map     : GLenum;
      mapsize : GLint;
      values  : access GLushort);
   pragma Import (Stdcall, glPixelMapusv, "glPixelMapusv");

   procedure glGetPixelMapfv (map : GLenum; values : access GLfloat);
   pragma Import (Stdcall, glGetPixelMapfv, "glGetPixelMapfv");

   procedure glGetPixelMapuiv (map : GLenum; values : access GLuint);
   pragma Import (Stdcall, glGetPixelMapuiv, "glGetPixelMapuiv");

   procedure glGetPixelMapusv (map : GLenum; values : access GLushort);
   pragma Import (Stdcall, glGetPixelMapusv, "glGetPixelMapusv");

   procedure glBitmap
     (width  : GLsizei;
      height : GLsizei;
      xorig  : GLfloat;
      yorig  : GLfloat;
      xmove  : GLfloat;
      ymove  : GLfloat;
      bitmap : access GLubyte);
   pragma Import (Stdcall, glBitmap, "glBitmap");

   procedure glReadPixels
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address);
   pragma Import (Stdcall, glReadPixels, "glReadPixels");

   procedure glDrawPixels
     (width  : GLsizei;
      height : GLsizei;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address);
   pragma Import (Stdcall, glDrawPixels, "glDrawPixels");

   procedure glCopyPixels
     (x      : GLint;
      y      : GLint;
      width  : GLsizei;
      height : GLsizei;
      c_type : GLenum);
   pragma Import (Stdcall, glCopyPixels, "glCopyPixels");

   procedure glStencilFunc (func : GLenum; ref : GLint; mask : GLuint);
   pragma Import (Stdcall, glStencilFunc, "glStencilFunc");

   procedure glStencilMask (mask : GLuint);
   pragma Import (Stdcall, glStencilMask, "glStencilMask");

   procedure glStencilOp (fail : GLenum; zfail : GLenum; zpass : GLenum);
   pragma Import (Stdcall, glStencilOp, "glStencilOp");

   procedure glClearStencil (s : GLint);
   pragma Import (Stdcall, glClearStencil, "glClearStencil");

   procedure glTexGend (coord : GLenum; pname : GLenum; param : GLdouble);
   pragma Import (Stdcall, glTexGend, "glTexGend");

   procedure glTexGenf (coord : GLenum; pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glTexGenf, "glTexGenf");

   procedure glTexGeni (coord : GLenum; pname : GLenum; param : GLint);
   pragma Import (Stdcall, glTexGeni, "glTexGeni");

   procedure glTexGendv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLdouble);
   pragma Import (Stdcall, glTexGendv, "glTexGendv");

   procedure glTexGenfv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glTexGenfv, "glTexGenfv");

   procedure glTexGeniv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glTexGeniv, "glTexGeniv");

   procedure glGetTexGendv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLdouble);
   pragma Import (Stdcall, glGetTexGendv, "glGetTexGendv");

   procedure glGetTexGenfv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glGetTexGenfv, "glGetTexGenfv");

   procedure glGetTexGeniv
     (coord  : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glGetTexGeniv, "glGetTexGeniv");

   procedure glTexEnvf (target : GLenum; pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glTexEnvf, "glTexEnvf");

   procedure glTexEnvi (target : GLenum; pname : GLenum; param : GLint);
   pragma Import (Stdcall, glTexEnvi, "glTexEnvi");

   procedure glTexEnvfv
     (target : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glTexEnvfv, "glTexEnvfv");

   procedure glTexEnviv
     (target : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glTexEnviv, "glTexEnviv");

   procedure glGetTexEnvfv
     (target : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glGetTexEnvfv, "glGetTexEnvfv");

   procedure glGetTexEnviv
     (target : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glGetTexEnviv, "glGetTexEnviv");

   procedure glTexParameterf
     (target : GLenum;
      pname  : GLenum;
      param  : GLfloat);
   pragma Import (Stdcall, glTexParameterf, "glTexParameterf");

   procedure glTexParameteri (target : GLenum; pname : GLenum; param : GLint);
   pragma Import (Stdcall, glTexParameteri, "glTexParameteri");

   procedure glTexParameterfv
     (target : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glTexParameterfv, "glTexParameterfv");

   procedure glTexParameteriv
     (target : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glTexParameteriv, "glTexParameteriv");

   procedure glGetTexParameterfv
     (target : GLenum;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import (Stdcall, glGetTexParameterfv, "glGetTexParameterfv");

   procedure glGetTexParameteriv
     (target : GLenum;
      pname  : GLenum;
      params : access GLint);
   pragma Import (Stdcall, glGetTexParameteriv, "glGetTexParameteriv");

   procedure glGetTexLevelParameterfv
     (target : GLenum;
      level  : GLint;
      pname  : GLenum;
      params : access GLfloat);
   pragma Import
     (Stdcall,
      glGetTexLevelParameterfv,
      "glGetTexLevelParameterfv");

   procedure glGetTexLevelParameteriv
     (target : GLenum;
      level  : GLint;
      pname  : GLenum;
      params : access GLint);
   pragma Import
     (Stdcall,
      glGetTexLevelParameteriv,
      "glGetTexLevelParameteriv");

   procedure glTexImage1D
     (target         : GLenum;
      level          : GLint;
      internalFormat : GLint;
      width          : GLsizei;
      border         : GLint;
      format         : GLenum;
      c_type         : GLenum;
      pixels         : System.Address);
   pragma Import (Stdcall, glTexImage1D, "glTexImage1D");

   procedure glTexImage2D
     (target         : GLenum;
      level          : GLint;
      internalFormat : GLint;
      width          : GLsizei;
      height         : GLsizei;
      border         : GLint;
      format         : GLenum;
      c_type         : GLenum;
      pixels         : System.Address);
   pragma Import (Stdcall, glTexImage2D, "glTexImage2D");

   procedure glGetTexImage
     (target : GLenum;
      level  : GLint;
      format : GLenum;
      c_type : GLenum;
      pixels : System.Address);
   pragma Import (Stdcall, glGetTexImage, "glGetTexImage");

   procedure glMap1d
     (target : GLenum;
      u1     : GLdouble;
      u2     : GLdouble;
      stride : GLint;
      order  : GLint;
      points : access GLdouble);
   pragma Import (Stdcall, glMap1d, "glMap1d");

   procedure glMap1f
     (target : GLenum;
      u1     : GLfloat;
      u2     : GLfloat;
      stride : GLint;
      order  : GLint;
      points : access GLfloat);
   pragma Import (Stdcall, glMap1f, "glMap1f");

   procedure glMap2d
     (target  : GLenum;
      u1      : GLdouble;
      u2      : GLdouble;
      ustride : GLint;
      uorder  : GLint;
      v1      : GLdouble;
      v2      : GLdouble;
      vstride : GLint;
      vorder  : GLint;
      points  : access GLdouble);
   pragma Import (Stdcall, glMap2d, "glMap2d");

   procedure glMap2f
     (target  : GLenum;
      u1      : GLfloat;
      u2      : GLfloat;
      ustride : GLint;
      uorder  : GLint;
      v1      : GLfloat;
      v2      : GLfloat;
      vstride : GLint;
      vorder  : GLint;
      points  : access GLfloat);
   pragma Import (Stdcall, glMap2f, "glMap2f");

   procedure glGetMapdv (target : GLenum; query : GLenum; v : access GLdouble);
   pragma Import (Stdcall, glGetMapdv, "glGetMapdv");

   procedure glGetMapfv (target : GLenum; query : GLenum; v : access GLfloat);
   pragma Import (Stdcall, glGetMapfv, "glGetMapfv");

   procedure glGetMapiv (target : GLenum; query : GLenum; v : access GLint);
   pragma Import (Stdcall, glGetMapiv, "glGetMapiv");

   procedure glEvalCoord1d (u : GLdouble);
   pragma Import (Stdcall, glEvalCoord1d, "glEvalCoord1d");

   procedure glEvalCoord1f (u : GLfloat);
   pragma Import (Stdcall, glEvalCoord1f, "glEvalCoord1f");

   procedure glEvalCoord1dv (u : access GLdouble);
   pragma Import (Stdcall, glEvalCoord1dv, "glEvalCoord1dv");

   procedure glEvalCoord1fv (u : access GLfloat);
   pragma Import (Stdcall, glEvalCoord1fv, "glEvalCoord1fv");

   procedure glEvalCoord2d (u : GLdouble; v : GLdouble);
   pragma Import (Stdcall, glEvalCoord2d, "glEvalCoord2d");

   procedure glEvalCoord2f (u : GLfloat; v : GLfloat);
   pragma Import (Stdcall, glEvalCoord2f, "glEvalCoord2f");

   procedure glEvalCoord2dv (u : access GLdouble);
   pragma Import (Stdcall, glEvalCoord2dv, "glEvalCoord2dv");

   procedure glEvalCoord2fv (u : access GLfloat);
   pragma Import (Stdcall, glEvalCoord2fv, "glEvalCoord2fv");

   procedure glMapGrid1d (un : GLint; u1 : GLdouble; u2 : GLdouble);
   pragma Import (Stdcall, glMapGrid1d, "glMapGrid1d");

   procedure glMapGrid1f (un : GLint; u1 : GLfloat; u2 : GLfloat);
   pragma Import (Stdcall, glMapGrid1f, "glMapGrid1f");

   procedure glMapGrid2d
     (un : GLint;
      u1 : GLdouble;
      u2 : GLdouble;
      vn : GLint;
      v1 : GLdouble;
      v2 : GLdouble);
   pragma Import (Stdcall, glMapGrid2d, "glMapGrid2d");

   procedure glMapGrid2f
     (un : GLint;
      u1 : GLfloat;
      u2 : GLfloat;
      vn : GLint;
      v1 : GLfloat;
      v2 : GLfloat);
   pragma Import (Stdcall, glMapGrid2f, "glMapGrid2f");

   procedure glEvalPoint1 (i : GLint);
   pragma Import (Stdcall, glEvalPoint1, "glEvalPoint1");

   procedure glEvalPoint2 (i : GLint; j : GLint);
   pragma Import (Stdcall, glEvalPoint2, "glEvalPoint2");

   procedure glEvalMesh1 (mode : GLenum; i1 : GLint; i2 : GLint);
   pragma Import (Stdcall, glEvalMesh1, "glEvalMesh1");

   procedure glEvalMesh2
     (mode : GLenum;
      i1   : GLint;
      i2   : GLint;
      j1   : GLint;
      j2   : GLint);
   pragma Import (Stdcall, glEvalMesh2, "glEvalMesh2");

   procedure glFogf (pname : GLenum; param : GLfloat);
   pragma Import (Stdcall, glFogf, "glFogf");

   procedure glFogi (pname : GLenum; param : GLint);
   pragma Import (Stdcall, glFogi, "glFogi");

   procedure glFogfv (pname : GLenum; params : access GLfloat);
   pragma Import (Stdcall, glFogfv, "glFogfv");

   procedure glFogiv (pname : GLenum; params : access GLint);
   pragma Import (Stdcall, glFogiv, "glFogiv");

   procedure glFeedbackBuffer
     (size   : GLsizei;
      c_type : GLenum;
      buffer : access GLfloat);
   pragma Import (Stdcall, glFeedbackBuffer, "glFeedbackBuffer");

   procedure glPassThrough (token : GLfloat);
   pragma Import (Stdcall, glPassThrough, "glPassThrough");

   procedure glSelectBuffer (size : GLsizei; buffer : access GLuint);
   pragma Import (Stdcall, glSelectBuffer, "glSelectBuffer");

   procedure glInitNames;
   pragma Import (Stdcall, glInitNames, "glInitNames");

   procedure glLoadName (name : GLuint);
   pragma Import (Stdcall, glLoadName, "glLoadName");

   procedure glPushName (name : GLuint);
   pragma Import (Stdcall, glPushName, "glPushName");

   procedure glPopName;
   pragma Import (Stdcall, glPopName, "glPopName");

   procedure glGenTextures (n : GLsizei; textures : access GLuint);
   pragma Import (Stdcall, glGenTextures, "glGenTextures");

   procedure glDeleteTextures (n : GLsizei; textures : access GLuint);
   pragma Import (Stdcall, glDeleteTextures, "glDeleteTextures");

   procedure glBindTexture (target : GLenum; texture : GLuint);
   pragma Import (Stdcall, glBindTexture, "glBindTexture");

   procedure glPrioritizeTextures
     (n          : GLsizei;
      textures   : access GLuint;
      priorities : access GLclampf);
   pragma Import (Stdcall, glPrioritizeTextures, "glPrioritizeTextures");

   function glAreTexturesResident
     (n          : GLsizei;
      textures   : access GLuint;
      residences : access GLboolean) return GLboolean;
   pragma Import (Stdcall, glAreTexturesResident, "glAreTexturesResident");

   function glIsTexture (texture : GLuint) return GLboolean;
   pragma Import (Stdcall, glIsTexture, "glIsTexture");

   procedure glTexSubImage1D
     (target  : GLenum;
      level   : GLint;
      xoffset : GLint;
      width   : GLsizei;
      format  : GLenum;
      c_type  : GLenum;
      pixels  : System.Address);
   pragma Import (Stdcall, glTexSubImage1D, "glTexSubImage1D");

   procedure glTexSubImage2D
     (target  : GLenum;
      level   : GLint;
      xoffset : GLint;
      yoffset : GLint;
      width   : GLsizei;
      height  : GLsizei;
      format  : GLenum;
      c_type  : GLenum;
      pixels  : System.Address);
   pragma Import (Stdcall, glTexSubImage2D, "glTexSubImage2D");

   procedure glCopyTexImage1D
     (target         : GLenum;
      level          : GLint;
      internalformat : GLenum;
      x              : GLint;
      y              : GLint;
      width          : GLsizei;
      border         : GLint);
   pragma Import (Stdcall, glCopyTexImage1D, "glCopyTexImage1D");

   procedure glCopyTexImage2D
     (target         : GLenum;
      level          : GLint;
      internalformat : GLenum;
      x              : GLint;
      y              : GLint;
      width          : GLsizei;
      height         : GLsizei;
      border         : GLint);
   pragma Import (Stdcall, glCopyTexImage2D, "glCopyTexImage2D");

   procedure glCopyTexSubImage1D
     (target  : GLenum;
      level   : GLint;
      xoffset : GLint;
      x       : GLint;
      y       : GLint;
      width   : GLsizei);
   pragma Import (Stdcall, glCopyTexSubImage1D, "glCopyTexSubImage1D");

   procedure glCopyTexSubImage2D
     (target  : GLenum;
      level   : GLint;
      xoffset : GLint;
      yoffset : GLint;
      x       : GLint;
      y       : GLint;
      width   : GLsizei;
      height  : GLsizei);
   pragma Import (Stdcall, glCopyTexSubImage2D, "glCopyTexSubImage2D");

   procedure glVertexPointer
     (size   : GLint;
      c_type : GLenum;
      stride : GLsizei;
      ptr    : System.Address);
   pragma Import (Stdcall, glVertexPointer, "glVertexPointer");

   procedure glNormalPointer
     (c_type : GLenum;
      stride : GLsizei;
      ptr    : System.Address);
   pragma Import (Stdcall, glNormalPointer, "glNormalPointer");

   procedure glColorPointer
     (size   : GLint;
      c_type : GLenum;
      stride : GLsizei;
      ptr    : System.Address);
   pragma Import (Stdcall, glColorPointer, "glColorPointer");

   procedure glIndexPointer
     (c_type : GLenum;
      stride : GLsizei;
      ptr    : System.Address);
   pragma Import (Stdcall, glIndexPointer, "glIndexPointer");

   procedure glTexCoordPointer
     (size   : GLint;
      c_type : GLenum;
      stride : GLsizei;
      ptr    : System.Address);
   pragma Import (Stdcall, glTexCoordPointer, "glTexCoordPointer");

   procedure glEdgeFlagPointer (stride : GLsizei; ptr : System.Address);
   pragma Import (Stdcall, glEdgeFlagPointer, "glEdgeFlagPointer");

   procedure glGetPointerv (pname : GLenum; params : System.Address);
   pragma Import (Stdcall, glGetPointerv, "glGetPointerv");

   procedure glArrayElement (i : GLint);
   pragma Import (Stdcall, glArrayElement, "glArrayElement");

   procedure glDrawArrays (mode : GLenum; first : GLint; count : GLsizei);
   pragma Import (Stdcall, glDrawArrays, "glDrawArrays");

   procedure glDrawElements
     (mode    : GLenum;
      count   : GLsizei;
      c_type  : GLenum;
      indices : System.Address);
   pragma Import (Stdcall, glDrawElements, "glDrawElements");

   procedure glInterleavedArrays
     (format  : GLenum;
      stride  : GLsizei;
      pointer : System.Address);
   pragma Import (Stdcall, glInterleavedArrays, "glInterleavedArrays");

end GL;
