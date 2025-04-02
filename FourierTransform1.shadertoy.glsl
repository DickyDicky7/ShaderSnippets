  float fourierTransform(vec2 uv, float frequency, float time, int terms, int termsStep)
//float fourierTransform(vec2 uv, float frequency, float time, int terms, int termsStep)
{
    float sum = 0.0;
//  float sum = 0.0;
    for (int n = 1; n <= terms; n += termsStep)
//  for (int n = 1; n <= terms; n += termsStep)
    {
        float  amplitude = 1.0 / float(n)                           ; // Amplitude decreases with frequency
//      float  amplitude = 1.0 / float(n)                           ; // Amplitude decreases with frequency
        sum += amplitude * sin  (float(n) * frequency * uv.x + time);
//      sum += amplitude * sin  (float(n) * frequency * uv.x + time);
    }
    return sum;
//  return sum;
}





  void mainImage(out vec4 fragColor, in vec2 fragCoord)
//void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
//  vec2 uv = fragCoord / iResolution.xy;
    float frequency = 6.28 * 4.0; // 4 full cycles across screen (2π per cycle)
//  float frequency = 6.28 * 4.0; // 4 full cycles across screen (2π per cycle)
    int terms     = 7; // Number of harmonics
//  int terms     = 7; // Number of harmonics
    int termsStep = 2;
//  int termsStep = 2;
    // Calculate Fourier Series
//  // Calculate Fourier Series
    float  wave = fourierTransform(uv, frequency, /* iTime */ 0.0, terms, termsStep); // wave represents the Y axis in this case ranging from -1 to +1
//  float  wave = fourierTransform(uv, frequency, /* iTime */ 0.0, terms, termsStep); // wave represents the Y axis in this case ranging from -1 to +1
    wave = wave * 0.5 + 0.5; // Normalize to 0-1
//  wave = wave * 0.5 + 0.5; // Normalize to 0-1

    // Visualize as a height field
//  // Visualize as a height field
    float line = smoothstep(0.02, 0.0, abs(uv.y - wave)); // Blurry outline
//  float line = smoothstep(0.02, 0.0, abs(uv.y - wave)); // Blurry outline
    vec3 color = vec3(line); // White wave on black
//  vec3 color = vec3(line); // White wave on black

    fragColor = vec4(color, 1.0);
//  fragColor = vec4(color, 1.0);
}
