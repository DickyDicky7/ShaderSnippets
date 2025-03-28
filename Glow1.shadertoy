  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;
    vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
//  vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
    float len = distance(uv * ra, vec2(0.5) * ra);
//  float len = distance(uv * ra, vec2(0.5) * ra);
    len = 0.1 / len;
//  len = 0.1 / len;
    fragColor = vec4(len, len, len, 1.0);
//  fragColor = vec4(len, len, len, 1.0);
}
