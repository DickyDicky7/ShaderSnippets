  void mainImage(out vec4 fragColor, in vec2 fragCoord)
//void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize coordinates and adjust for aspect ratio
//  // Normalize coordinates and adjust for aspect ratio
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;
    vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
//  vec2 ra = vec2(iResolution.x / iResolution.y, 1.0);
    vec2 center = vec2(0.5) * ra;
//  vec2 center = vec2(0.5) * ra;
    vec2 coord = uv * ra;
//  vec2 coord = uv * ra;

    // Calculate distance from center
//  // Calculate distance from center
    float dist = distance(coord, center);
//  float dist = distance(coord, center);

    // Create three ripple patterns with different scales and speeds
//  // Create three ripple patterns with different scales and speeds
    float ripple1 = sin((dist / 0.1 + iTime * 0.5) * 10.0);
//  float ripple1 = sin((dist / 0.1 + iTime * 0.5) * 10.0);
    float ripple2 = sin((dist / 0.2 + iTime * 0.7) * 08.0);
//  float ripple2 = sin((dist / 0.2 + iTime * 0.7) * 08.0);
    float ripple3 = sin((dist / 0.3 + iTime * 0.3) * 06.0);
//  float ripple3 = sin((dist / 0.3 + iTime * 0.3) * 06.0);

    // Smooth the ripples and amplify the effect
    // Smooth the ripples and amplify the effect
    vec3 color = vec3(
//  vec3 color = vec3(
        0.25 / (abs(ripple1) + 0.1),  // Red   channel
//      0.25 / (abs(ripple1) + 0.1),  // Red   channel
        0.25 / (abs(ripple2) + 0.1),  // Green channel
//      0.25 / (abs(ripple2) + 0.1),  // Green channel
        0.25 / (abs(ripple3) + 0.1)   // Blue  channel
//      0.25 / (abs(ripple3) + 0.1)   // Blue  channel
    );
//  );

    // Output final color
//  // Output final color
    fragColor = vec4(color, 1.0);
//  fragColor = vec4(color, 1.0);
}
