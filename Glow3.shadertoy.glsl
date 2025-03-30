  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;
    vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
//  vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
    float len = distance(uv * ra, vec2(0.5) * ra) - 0.2; // Circle SDF: p->uv center->vec2(0.5) radius->0.2
//  float len = distance(uv * ra, vec2(0.5) * ra) - 0.2; // Circle SDF: p->uv center->vec2(0.5) radius->0.2
    float edgeThickness = 0.01;
//  float edgeThickness = 0.01;
    len = edgeThickness / abs(len);
//  len = edgeThickness / abs(len);
    fragColor = vec4(len, len, len, 1.0);
//  fragColor = vec4(len, len, len, 1.0);
}
