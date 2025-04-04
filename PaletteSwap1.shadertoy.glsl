// https://lospec.com/palette-list/moonlight-gb
// https://lospec.com/palette-list/moonlight-gb
const int          paletteCount  =      4 ;
const vec3 palette[paletteCount] = vec3[4](
      vec3(015.0, 005.0, 045.0) / 255.0,
      vec3(035.0, 055.0, 115.0) / 255.0,
      vec3(055.0, 135.0, 145.0) / 255.0,
      vec3(095.0, 200.0, 095.0) / 255.0
);

  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;

    vec3 color = texture(iChannel0, uv).rgb;
//  vec3 color = texture(iChannel0, uv).rgb;
    int i = int(floor(dot(color, vec3(0.30, 0.59, 0.11)) * float(paletteCount)));
//  int i = int(floor(dot(color, vec3(0.30, 0.59, 0.11)) * float(paletteCount)));
    vec3 replacedColor = palette[i];
//  vec3 replacedColor = palette[i];

    fragColor = vec4(replacedColor, 1.0);
//  fragColor = vec4(replacedColor, 1.0);
}
