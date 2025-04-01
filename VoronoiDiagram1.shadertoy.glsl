  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;

    vec2 seeds[5];
//  vec2 seeds[5];
    vec2 animation = vec2(sin(iTime), cos(iTime)) * 0.2;
//  vec2 animation = vec2(sin(iTime), cos(iTime)) * 0.2;
    seeds[0] = vec2(0.2, 0.3) + animation;
    seeds[1] = vec2(0.5, 0.7) - animation;
    seeds[2] = vec2(0.8, 0.2) + animation;
    seeds[3] = vec2(0.3, 0.9) - animation;
    seeds[4] = vec2(0.6, 0.4)            ;

    float minDistance = 100.0;
//  float minDistance = 100.0;
    int minI = 0;
//  int minI = 0;
    for (int i = 0; i < 5; ++i)
//  for (int i = 0; i < 5; ++i)
    {
        float currentDistance = distance(uv, seeds[i]);
//      float currentDistance = distance(uv, seeds[i]);
        if   (currentDistance < minDistance)
//      if   (currentDistance < minDistance)
        {
            minDistance = currentDistance;
//          minDistance = currentDistance;
            minI = i;
//          minI = i;
        }
    }

    fragColor = vec4(vec3(1.0 - minDistance), 1.0);
//  fragColor = vec4(vec3(1.0 - minDistance), 1.0);
}
