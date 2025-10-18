


#include "NPR_LightShader.glsl"
#include "Node Utils 2/node_utils_2.glsl"
#include "Node Utils/node_utils.glsl"


#include "D:\blender/malt_pluing\MyPlugin\Shaders\math.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\myshader.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\ray_marching.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\test1.glsl"
#include "D:\blender/malt_pluing\PluginExample\Shaders\PluginExample.glsl"


uniform float U_0_LIGHT_SHADER_Output1_0_attenuation;


#ifdef PIXEL_SHADER
void LIGHT_SHADER(vec3 relative_coordinates, vec3 uvw, inout vec3 color, inout float attenuation)
{

	color = color;
	attenuation = attenuation;

}
#endif //PIXEL_SHADER


