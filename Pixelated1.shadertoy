  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;
    vec2 ra = vec2(iResolution.y / iResolution.x, 1.0);
//  vec2 ra = vec2(iResolution.y / iResolution.x, 1.0);
    vec2 pixelSize = vec2(0.02, 0.02) * ra;
//  vec2 pixelSize = vec2(0.02, 0.02) * ra;
    float colorQuantizationLevels = 256.0;
//  float colorQuantizationLevels = 256.0;


    // Math: Snap the UV coordinates to the nearest grid point
//  // Math: Snap the UV coordinates to the nearest grid point
    vec4 color = texture(iChannel0, floor(uv / pixelSize) * pixelSize);
//  vec4 color = texture(iChannel0, floor(uv / pixelSize) * pixelSize);
    
    // Math: Color Quantization
//  // Math: Color Quantization
    // Each color channel (R G B) is typically in the range [0 1]
//  // Each color channel (R G B) is typically in the range [0 1]
    // Choose a number of discrete levels e.g. levels = 4 (for 4 shades per channel: 0 0.33 0.66 1.0)
//  // Choose a number of discrete levels e.g. levels = 4 (for 4 shades per channel: 0 0.33 0.66 1.0)
    color = floor(color * colorQuantizationLevels) / (colorQuantizationLevels - 1.0);
//  color = floor(color * colorQuantizationLevels) / (colorQuantizationLevels - 1.0);

    fragColor = color;
//  fragColor = color;
}
