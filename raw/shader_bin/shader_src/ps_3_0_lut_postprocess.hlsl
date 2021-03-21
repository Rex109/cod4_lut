#define PC
#define IS_VERTEX_SHADER 0
#define IS_PIXEL_SHADER 1
#include <shader_vars.h>

struct PixelInput
{
    float4 position     : POSITION;
	float2 texcoord 	: TEXCOORD0;
};

struct PixelOutput
{
	float4 color        : COLOR;
};

PixelOutput ps_main( const PixelInput pixel )
{
    PixelOutput fragment;

	float4 color = tex2D(colorMapPostSunSampler, pixel.texcoord.xy);

	float u  =  floor(color.b * 15.0) / 15.0 * 240.0;
    u  = (floor(color.r * 15.0) / 15.0 *  15.0) + u;
    u /= 255.0;
    float v  = floor(color.g * 15.0) / 15.0;

    float3 left = tex2D(colorMapSampler, float2(u, v)).rgb;

    u  =  ceil(color.b * 15.0) / 15.0 * 240.0;
    u  = (ceil(color.r * 15.0) / 15.0 *  15.0) + u;
    u /= 255.0;
    v  = ceil(color.g * 15.0) / 15.0;

    float3 right = tex2D(colorMapSampler, float2(u, v)).rgb;

    color.r = lerp(left.r, right.r, frac(color.r * 15.0));
    color.g = lerp(left.g, right.g, frac(color.g * 15.0));
    color.b = lerp(left.b, right.b, frac(color.b * 15.0));

	fragment.color = color;
	return fragment;
}
