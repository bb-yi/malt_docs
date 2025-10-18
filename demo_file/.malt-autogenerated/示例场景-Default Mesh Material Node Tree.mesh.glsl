#define CUSTOM_PRE_PASS
#define CUSTOM_DEPTH_OFFSET
#define CUSTOM_VERTEX_DISPLACEMENT
#define CUSTOM_VERTEX_SHADER



#include "NPR_MeshShader.glsl"
#include "Node Utils 2/node_utils_2.glsl"
#include "Node Utils/node_utils.glsl"


#include "D:\blender/malt_pluing\InvertedHulls\Shaders\test.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\math.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\myshader.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\ray_marching.glsl"
#include "D:\blender/malt_pluing\MyPlugin\Shaders\test1.glsl"
#include "D:\blender/malt_pluing\PluginExample\Shaders\PluginExample.glsl"


uniform vec4 U_0_MAIN_PASS_PIXEL_SHADER_Output1_0_Line_Color;
#ifdef MAIN_PASS
layout (location = 0) out vec4 OUT_MAIN_PASS_PIXEL_SHADER_COLOR;
layout (location = 1) out vec4 OUT_MAIN_PASS_PIXEL_SHADER_LINECOLOR;
layout (location = 2) out float OUT_MAIN_PASS_PIXEL_SHADER_LINEWIDTH;
#endif //MAIN_PASS
uniform PrePassOutput U_0_pre_pass_pixel_shader_output1_0_PPO;
uniform float U_0_depth_offset_output1_0_depth_offset;
uniform bool U_0_depth_offset_output1_0_offset_position;
uniform vec3 U_0_vertex_displacement_shader_output1_0_result;
uniform Vertex U_0_common_vertex_shader_output1_0_V;
uniform vec3 U_0_rim_light1_0_normal;
uniform float U_0_rim_light1_0_angle;
uniform float U_0_rim_light1_0_rim_length;
uniform float U_0_rim_light1_0_length_falloff;
uniform float U_0_rim_light1_0_thickness;
uniform float U_0_rim_light1_0_thickness_falloff;
uniform vec3 U_0_npr_diffuse1_0_base_color;
uniform vec3 U_0_npr_diffuse1_0_color;
OPTIONALLY_BINDLESS uniform sampler1D U_0_npr_diffuse1_0_gradient;
uniform float U_0_npr_diffuse1_0_offset;
uniform bool U_0_npr_diffuse1_0_full_range;
uniform bool U_0_npr_diffuse1_0_max_contribution;
uniform int U_0_npr_diffuse1_0_shadows;
uniform ivec4 U_0_npr_diffuse1_0_light_groups;
uniform vec3 U_0_npr_diffuse1_0_position;
uniform vec3 U_0_npr_diffuse1_0_normal;
uniform vec3 U_0_npr_specular1_0_base_color;
uniform vec3 U_0_npr_specular1_0_color;
OPTIONALLY_BINDLESS uniform sampler1D U_0_npr_specular1_0_gradient;
uniform float U_0_npr_specular1_0_offset;
uniform float U_0_npr_specular1_0_roughness;
uniform float U_0_npr_specular1_0_anisotropy;
uniform bool U_0_npr_specular1_0_max_contribution;
uniform int U_0_npr_specular1_0_shadows;
uniform ivec4 U_0_npr_specular1_0_light_groups;
uniform vec3 U_0_npr_specular1_0_position;
uniform vec3 U_0_npr_specular1_0_normal;
uniform vec3 U_0_npr_specular1_0_tangent;
uniform vec4 U_0_layer_blend1_0_blend;
uniform int U_0_layer_blend1_0_mode;
uniform float U_0_line_width1_0_width_scale;
uniform int U_0_line_width1_0_width_units;
uniform float U_0_line_width1_0_depth_width;
uniform float U_0_line_width1_0_depth_threshold;
uniform float U_0_line_width1_0_depth_threshold_range;
uniform float U_0_line_width1_0_normal_width;
uniform float U_0_line_width1_0_normal_threshold;
uniform float U_0_line_width1_0_normal_threshold_range;
uniform vec4 U_0_line_width1_0_id_boundary_width;


#ifdef PIXEL_SHADER
void PRE_PASS_PIXEL_SHADER(inout PrePassOutput PPO)
{
	PPO = PPO;

}
#endif //PIXEL_SHADER
#ifdef PIXEL_SHADER
void DEPTH_OFFSET(inout float depth_offset, inout bool offset_position)
{
	depth_offset = depth_offset;
	offset_position = offset_position;

}
#endif //PIXEL_SHADER
#ifdef PIXEL_SHADER
void MAIN_PASS_PIXEL_SHADER()
{
	float _rim_light1_0_result = rim_light(NORMAL,U_0_rim_light1_0_angle,U_0_rim_light1_0_rim_length,U_0_rim_light1_0_length_falloff,U_0_rim_light1_0_thickness,U_0_rim_light1_0_thickness_falloff);

	vec3 _npr_diffuse1_0_result = NPR_diffuse_shading(U_0_npr_diffuse1_0_base_color,U_0_npr_diffuse1_0_color,U_0_npr_diffuse1_0_gradient,U_0_npr_diffuse1_0_offset,U_0_npr_diffuse1_0_full_range,U_0_npr_diffuse1_0_max_contribution,U_0_npr_diffuse1_0_shadows,MATERIAL_LIGHT_GROUPS,POSITION,NORMAL);

	vec3 _npr_specular1_0_result = NPR_specular_shading(U_0_npr_specular1_0_base_color,U_0_npr_specular1_0_color,U_0_npr_specular1_0_gradient,U_0_npr_specular1_0_offset,U_0_npr_specular1_0_roughness,U_0_npr_specular1_0_anisotropy,U_0_npr_specular1_0_max_contribution,U_0_npr_specular1_0_shadows,MATERIAL_LIGHT_GROUPS,POSITION,NORMAL,radial_tangent(NORMAL, vec3(0,0,1)));

	vec3 _vector_3d1_0_result = Vec3_add(_npr_diffuse1_0_result,_npr_specular1_0_result);

	vec4 _layer_blend1_0_result = blend_add(_rim_light1_0_result,vec4_from_vec3(_vector_3d1_0_result),U_0_layer_blend1_0_blend,U_0_layer_blend1_0_mode);

	float _line_width1_0_result = line_width_2(U_0_line_width1_0_width_scale,U_0_line_width1_0_width_units,U_0_line_width1_0_depth_width,U_0_line_width1_0_depth_threshold,U_0_line_width1_0_depth_threshold_range,U_0_line_width1_0_normal_width,U_0_line_width1_0_normal_threshold,U_0_line_width1_0_normal_threshold_range,U_0_line_width1_0_id_boundary_width);

	#ifdef MAIN_PASS
	OUT_MAIN_PASS_PIXEL_SHADER_COLOR = _layer_blend1_0_result;
	OUT_MAIN_PASS_PIXEL_SHADER_LINECOLOR = U_0_MAIN_PASS_PIXEL_SHADER_Output1_0_Line_Color;
	OUT_MAIN_PASS_PIXEL_SHADER_LINEWIDTH = _line_width1_0_result;
	#endif //MAIN_PASS

}
#endif //PIXEL_SHADER
#ifdef VERTEX_SHADER
vec3 VERTEX_DISPLACEMENT_SHADER()
{
	vec3 result;
	result = U_0_vertex_displacement_shader_output1_0_result;
	return result;

}
#endif //VERTEX_SHADER
#ifdef VERTEX_SHADER
void COMMON_VERTEX_SHADER(inout Vertex V)
{
	V = V;

}
#endif //VERTEX_SHADER


