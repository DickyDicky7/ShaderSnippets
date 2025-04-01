  float drawLine(vec2 p0, vec2 p1, vec2 uv, float thickness, float blur)
//float drawLine(vec2 p0, vec2 p1, vec2 uv, float thickness, float blur)
{
    
    // Step 2: Project pixel onto line
//  // Step 2: Project pixel onto line
    vec2 lineDir = p1 - p0;
//  vec2 lineDir = p1 - p0;
    float lineLen = length(lineDir);
//  float lineLen = length(lineDir);
    vec2 lineUnit = lineDir / lineLen;
//  vec2 lineUnit = lineDir / lineLen;
    vec2 pixelVec = uv - p0;
//  vec2 pixelVec = uv - p0;
    float t = clamp(dot(pixelVec, lineUnit), 0.0, lineLen);
//  float t = clamp(dot(pixelVec, lineUnit), 0.0, lineLen);

    // Step 3: Closest point on the line
//  // Step 3: Closest point on the line
    vec2 closest = p0 + t * lineUnit;
//  vec2 closest = p0 + t * lineUnit;

    // Step 4: Distance from pixel to line
//  // Step 4: Distance from pixel to line
    float dist = length(uv - closest);
//  float dist = length(uv - closest);

    // Step 5: Blurry edge with exponential falloff
//  // Step 5: Blurry edge with exponential falloff
    float line = exp(-dist * blur) * thickness;
//  float line = exp(-dist * blur) * thickness;

    // Step 6: Return the result
//  // Step 6: Return the result
    return clamp(line, 0.0, 1.0); // Keep it in 0-1 range
//  return clamp(line, 0.0, 1.0); // Keep it in 0-1 range
}





  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;

    vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
//  vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
    
    uv *= ra;
//  uv *= ra;
    
    vec2 uvTiled = fract(uv  * 50.0);
//  vec2 uvTiled = fract(uv  * 50.0);
    
    vec2 cellPosition = floor(uv * 50.0);
//  vec2 cellPosition = floor(uv * 50.0);
    
    float random = fract(sin(dot(cellPosition, vec2(12.9898, 78.233))) * 43758.5453);
//  float random = fract(sin(dot(cellPosition, vec2(12.9898, 78.233))) * 43758.5453);

    float r = 0.0;
//  float r = 0.0;
    if (random < 0.25)
    {
        r = max(drawLine(vec2(0.0,0.0), vec2(0.5,0.5), uvTiled, 3.0, 100.0), drawLine(vec2(0.0,0.5), vec2(0.5,0.5), uvTiled, 3.0, 100.0));
    }
    else
    if (random < 0.50)
    {
        r = max(drawLine(vec2(0.0,1.0), vec2(0.5,0.5), uvTiled, 3.0, 100.0), drawLine(vec2(0.5,0.0), vec2(0.5,0.5), uvTiled, 3.0, 100.0));
    }
    else
    if (random < 0.75)
    {
        r = max(drawLine(vec2(1.0,0.0), vec2(0.5,0.5), uvTiled, 3.0, 100.0), drawLine(vec2(1.0,0.5), vec2(0.5,0.5), uvTiled, 3.0, 100.0));
    }
    else
    {
        r = max(drawLine(vec2(1.0,1.0), vec2(0.5,0.5), uvTiled, 3.0, 100.0), drawLine(vec2(0.5,1.0), vec2(0.5,0.5), uvTiled, 3.0, 100.0));
    }
    
    fragColor = vec4(vec3(r), 1.0);
//  fragColor = vec4(vec3(r), 1.0);
}
