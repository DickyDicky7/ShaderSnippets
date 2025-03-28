  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;
    vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
//  vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
    float speedR = 2.0;
    float speedG = 2.0;
    float speedB = 2.0;
    float lenR = distance(uv * ra, vec2(0.3, 0.3) * vec2(sin(iTime), cos(iTime)) * speedR * ra);
//  float lenR = distance(uv * ra, vec2(0.3, 0.3) * vec2(sin(iTime), cos(iTime)) * speedR * ra);
    float lenG = distance(uv * ra, vec2(0.7, 0.3) * vec2(sin(iTime), cos(iTime)) * speedG * ra);
//  float lenG = distance(uv * ra, vec2(0.7, 0.3) * vec2(sin(iTime), cos(iTime)) * speedG * ra);
    float lenB = distance(uv * ra, vec2(0.5, 0.7) * vec2(cos(iTime), sin(iTime)) * speedB * ra);
//  float lenB = distance(uv * ra, vec2(0.5, 0.7) * vec2(cos(iTime), sin(iTime)) * speedB * ra);
    lenR = 0.5 / lenR;
//  lenR = 0.5 / lenR;
    lenG = 0.5 / lenG;
//  lenG = 0.5 / lenG;
    lenB = 0.5 / lenB;
//  lenB = 0.5 / lenB;
    fragColor = vec4(lenR, lenG, lenB, 1.0);
//  fragColor = vec4(lenR, lenG, lenB, 1.0);
}
