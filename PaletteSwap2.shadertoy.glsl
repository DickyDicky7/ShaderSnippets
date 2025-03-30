// https://lospec.com/palette-list/cornsole2
// https://lospec.com/palette-list/cornsole2
const int          paletteCount  =      2 ;
const vec3 palette[paletteCount] = vec3[2](
      vec3(100.0, 150.0, 240.0) / 255.0,
      vec3(255.0, 250.0, 220.0) / 255.0
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
