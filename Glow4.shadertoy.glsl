  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;
    vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
//  vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
    float lenR = distance(uv * ra, vec2(0.3, 0.3) * ra) - 0.2;
//  float lenR = distance(uv * ra, vec2(0.3, 0.3) * ra) - 0.2;
    float lenG = distance(uv * ra, vec2(0.7, 0.3) * ra) - 0.2;
//  float lenG = distance(uv * ra, vec2(0.7, 0.3) * ra) - 0.2;
    float lenB = distance(uv * ra, vec2(0.5, 0.7) * ra) - 0.2;
//  float lenB = distance(uv * ra, vec2(0.5, 0.7) * ra) - 0.2;
    lenR = max(0.01, 0.2 * sin(mod(iTime, 10.0))) / abs(lenR);
//  lenR = max(0.01, 0.2 * sin(mod(iTime, 10.0))) / abs(lenR);
    lenG = max(0.01, 0.2 * sin(mod(iTime, 10.0))) / abs(lenG);
//  lenG = max(0.01, 0.2 * sin(mod(iTime, 10.0))) / abs(lenG);
    lenB = max(0.01, 0.2 * sin(mod(iTime, 10.0))) / abs(lenB);
//  lenB = max(0.01, 0.2 * sin(mod(iTime, 10.0))) / abs(lenB);
    fragColor = vec4(lenR, lenG, lenB, 1.0);
//  fragColor = vec4(lenR, lenG, lenB, 1.0);
}
