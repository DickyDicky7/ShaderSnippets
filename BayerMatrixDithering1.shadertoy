  float bayer2x2(vec2 coords)
//float bayer2x2(vec2 coords)
{
    ivec2 p = ivec2(mod(coords, 2.0)); // Tile coords to 0-1 range
//  ivec2 p = ivec2(mod(coords, 2.0)); // Tile coords to 0-1 range
    float[4] m = float[4](
        0.0, 2.0,  // Row 0
        3.0, 1.0   // Row 1
    );
    int index = p.x + p.y * 2; // Linear index: x + y * width
//  int index = p.x + p.y * 2; // Linear index: x + y * width
    return m[index] / 4.0;     // Normalize to [0, 1)
//  return m[index] / 4.0;     // Normalize to [0, 1)
}



  float bayer4x4(vec2 coords)
//float bayer4x4(vec2 coords)
{
    ivec2 p = ivec2(mod(coords, 4.0)); // Tile coords to 0-3 range
//  ivec2 p = ivec2(mod(coords, 4.0)); // Tile coords to 0-3 range
    float[16] m = float[16](
        0.0,  8.0,  2.0, 10.0,  // Row 0
       12.0,  4.0, 14.0,  6.0,  // Row 1
        3.0, 11.0,  1.0,  9.0,  // Row 2
       15.0,  7.0, 13.0,  5.0   // Row 3
    );
    int index = p.x + p.y * 4; // Linear index: x + y * width
//  int index = p.x + p.y * 4; // Linear index: x + y * width
    return m[index] / 16.0;    // Normalize to [0, 1)
//  return m[index] / 16.0;    // Normalize to [0, 1)
}



  float bayer8x8(vec2 coords)
//float bayer8x8(vec2 coords)
{
    ivec2 p = ivec2(mod(coords, 8.0)); // Tile coords to 0-7 range
//  ivec2 p = ivec2(mod(coords, 8.0)); // Tile coords to 0-7 range
    float[64] m = float[64](
         0.0, 32.0,  8.0, 40.0,  2.0, 34.0, 10.0, 42.0,  // Row 0
        48.0, 16.0, 56.0, 24.0, 50.0, 18.0, 58.0, 26.0,  // Row 1
        12.0, 44.0,  4.0, 36.0, 14.0, 46.0,  6.0, 38.0,  // Row 2
        60.0, 28.0, 52.0, 20.0, 62.0, 30.0, 54.0, 22.0,  // Row 3
         3.0, 35.0, 11.0, 43.0,  1.0, 33.0,  9.0, 41.0,  // Row 4
        51.0, 19.0, 59.0, 27.0, 49.0, 17.0, 57.0, 25.0,  // Row 5
        15.0, 47.0,  7.0, 39.0, 13.0, 45.0,  5.0, 37.0,  // Row 6
        63.0, 31.0, 55.0, 23.0, 61.0, 29.0, 53.0, 21.0   // Row 7
    );
    int index = p.x + p.y * 8; // Linear index: x + y * width
//  int index = p.x + p.y * 8; // Linear index: x + y * width
    return m[index] / 64.0;    // Normalize to [0, 1)
//  return m[index] / 64.0;    // Normalize to [0, 1)
}



  float bayer16x16(vec2 coords)
//float bayer16x16(vec2 coords)
{
    ivec2 p = ivec2(mod(coords, 16.0)); // Tile coords to 0-15 range
//  ivec2 p = ivec2(mod(coords, 16.0)); // Tile coords to 0-15 range
    float[256] m = float[256](
          0.0, 128.0,  32.0, 160.0,   8.0, 136.0,  40.0, 168.0,   2.0, 130.0,  34.0, 162.0,  10.0, 138.0,  42.0, 170.0,  // Row 0
        192.0,  64.0, 224.0,  96.0, 200.0,  72.0, 232.0, 104.0, 194.0,  66.0, 226.0,  98.0, 202.0,  74.0, 234.0, 106.0,  // Row 1
         48.0, 176.0,  16.0, 144.0,  56.0, 184.0,  24.0, 152.0,  50.0, 178.0,  18.0, 146.0,  58.0, 186.0,  26.0, 154.0,  // Row 2
        240.0, 112.0, 208.0,  80.0, 248.0, 120.0, 216.0,  88.0, 242.0, 114.0, 210.0,  82.0, 250.0, 122.0, 218.0,  90.0,  // Row 3
         12.0, 140.0,  44.0, 172.0,   4.0, 132.0,  36.0, 164.0,  14.0, 142.0,  46.0, 174.0,   6.0, 134.0,  38.0, 166.0,  // Row 4
        204.0,  76.0, 236.0, 108.0, 196.0,  68.0, 228.0, 100.0, 206.0,  78.0, 238.0, 110.0, 198.0,  70.0, 230.0, 102.0,  // Row 5
         60.0, 188.0,  28.0, 156.0,  52.0, 180.0,  20.0, 148.0,  62.0, 190.0,  30.0, 158.0,  54.0, 182.0,  22.0, 150.0,  // Row 6
        252.0, 124.0, 220.0,  92.0, 244.0, 116.0, 212.0,  84.0, 254.0, 126.0, 222.0,  94.0, 246.0, 118.0, 214.0,  86.0,  // Row 7
          3.0, 131.0,  35.0, 163.0,  11.0, 139.0,  43.0, 171.0,   1.0, 129.0,  33.0, 161.0,   9.0, 137.0,  41.0, 169.0,  // Row 8
        195.0,  67.0, 227.0,  99.0, 203.0,  75.0, 235.0, 107.0, 193.0,  65.0, 225.0,  97.0, 201.0,  73.0, 233.0, 105.0,  // Row 9
         51.0, 179.0,  19.0, 147.0,  59.0, 187.0,  27.0, 155.0,  49.0, 177.0,  17.0, 145.0,  57.0, 185.0,  25.0, 153.0,  // Row 10
        243.0, 115.0, 211.0,  83.0, 251.0, 123.0, 219.0,  91.0, 241.0, 113.0, 209.0,  81.0, 249.0, 121.0, 217.0,  89.0,  // Row 11
         15.0, 143.0,  47.0, 175.0,   7.0, 135.0,  39.0, 167.0,  13.0, 141.0,  45.0, 173.0,   5.0, 133.0,  37.0, 165.0,  // Row 12
        207.0,  79.0, 239.0, 111.0, 199.0,  71.0, 231.0, 103.0, 205.0,  77.0, 237.0, 109.0, 197.0,  69.0, 229.0, 101.0,  // Row 13
         63.0, 191.0,  31.0, 159.0,  55.0, 183.0,  23.0, 151.0,  61.0, 189.0,  29.0, 157.0,  53.0, 181.0,  21.0, 149.0,  // Row 14
        255.0, 127.0, 223.0,  95.0, 247.0, 119.0, 215.0,  87.0, 253.0, 125.0, 221.0,  93.0, 245.0, 117.0, 213.0,  85.0   // Row 15
    );
    int index = p.x + p.y * 16; // Linear index: x + y * width
//  int index = p.x + p.y * 16; // Linear index: x + y * width
    return m[index] / 256.0;    // Normalize to [0, 1)
//  return m[index] / 256.0;    // Normalize to [0, 1)
}



  void mainImage( out vec4 fragColor, in vec2 fragCoord )
//void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
//  vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 colorOriginal = texture(iChannel0, uv);
//  vec4 colorOriginal = texture(iChannel0, uv);
    vec3 color = colorOriginal.rgb;
//  vec3 color = colorOriginal.rgb;
    
    
    // Pick one:
    // Pick one:
    float intensity =  color.r; // R only
//  float intensity =  color.r; // R only
//  float intensity =  color.g; // G only
//  float intensity =  color.g; // G only
//  float intensity =  color.b; // B only
//  float intensity =  color.b; // B only
//  float intensity = (color.r + color.g + color.b) / 3.0; // Average
//  float intensity = (color.r + color.g + color.b) / 3.0; // Average
//  float intensity = dot(color, vec3(0.30, 0.59, 0.11)); // Luminance intensity = 0.30 * R + 0.59 * G + 0.11 * B
//  float intensity = dot(color, vec3(0.30, 0.59, 0.11)); // Luminance intensity = 0.30 * R + 0.59 * G + 0.11 * B
    
    
    float threshold = bayer16x16(fragCoord.xy);
//  float threshold = bayer16x16(fragCoord.xy);
    float ditheringOutput = step(threshold, intensity);
//  float ditheringOutput = step(threshold, intensity);
//  fragColor = vec4(vec3(ditheringOutput), 1.0);
//  fragColor = vec4(vec3(ditheringOutput), 1.0);
    fragColor = vec4(vec3(ditheringOutput), 1.0) * colorOriginal;
//  fragColor = vec4(vec3(ditheringOutput), 1.0) * colorOriginal;
}
