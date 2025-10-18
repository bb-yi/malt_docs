


#include "NPR_ScreenShader.glsl"
#include "Node Utils 2/node_utils_2.glsl"
#include "Node Utils/node_utils.glsl"


#include "D:\blender/malt_pluing\MyPlugin\Shaders\math.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\myshader.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\ray_marching.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\test1.glsl"
#include "D:\blender/malt_pluing\PluginExample\Shaders\PluginExample.glsl"


layout (location = 0) out vec4 OUT_SCREEN_SHADER_COLOR;
uniform vec4 U_0_RGBA_Color1_0_v;
OPTIONALLY_BINDLESS uniform sampler2D IN_SCREEN_SHADER_COLOR;
uniform vec2 U_0_Image1_0_UV;
uniform bool U_0_Image1_0_Smooth_Interpolation;
uniform float U_0_Layer_Blend1_0_opacity;
uniform int U_0_Layer_Blend1_0_mode;


#ifdef PIXEL_SHADER
void SCREEN_SHADER()
{
	vec4 _RGBA_Color1_0_result = Vec4_color_property(U_0_RGBA_Color1_0_v);


	vec4 _Image1_0_Color;
	vec2 _Image1_0_Resolution;
	Image(IN_SCREEN_SHADER_COLOR,UV[0],U_0_Image1_0_Smooth_Interpolation,_Image1_0_Color,_Image1_0_Resolution);

	vec4 _Layer_Blend1_0_result = blend_normal(U_0_Layer_Blend1_0_opacity,_RGBA_Color1_0_result,_Image1_0_Color,U_0_Layer_Blend1_0_mode);

	OUT_SCREEN_SHADER_COLOR = _Layer_Blend1_0_result;

}
#endif //PIXEL_SHADER


