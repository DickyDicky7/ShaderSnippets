  // Constants defining the ray marching and rendering parameters
//// Constants defining the ray marching and rendering parameters
  const int maxMarchingSteps = 100;       // Max iterations for ray marching
//const int maxMarchingSteps = 100;       // Max iterations for ray marching
  const float surfaceDist = 0.01;         // Distance threshold for surface detection
//const float surfaceDist = 0.01;         // Distance threshold for surface detection
  const float shadowDist = 0.03;          // Offset for shadow ray
//const float shadowDist = 0.03;          // Offset for shadow ray
  const float maxDist = 100.0;            // Maximum ray distance
//const float maxDist = 100.0;            // Maximum ray distance
  const vec3 lightSource = vec3(0.0, 7.0, 1.0); // Light position
//const vec3 lightSource = vec3(0.0, 7.0, 1.0); // Light position
  const vec2 EPS = vec2(0.01, 0.0);       // Offset for normal calculation
//const vec2 EPS = vec2(0.01, 0.0);       // Offset for normal calculation
  const int AA_SAMPLES = 8;               // Anti-aliasing samples per axis (2x2 = 4 samples)
//const int AA_SAMPLES = 8;               // Anti-aliasing samples per axis (2x2 = 4 samples)


  // Colors for each object
//// Colors for each object
  const vec3 COLOR_SPHERE = vec3(1.0, 0.0, 0.0); // Red
//const vec3 COLOR_SPHERE = vec3(1.0, 0.0, 0.0); // Red
  const vec3 COLOR_TORUS = vec3(0.0, 1.0, 0.0);  // Green
//const vec3 COLOR_TORUS = vec3(0.0, 1.0, 0.0);  // Green
  const vec3 COLOR_GROUND = vec3(0.5, 0.5, 0.5); // Gray
//const vec3 COLOR_GROUND = vec3(0.5, 0.5, 0.5); // Gray


float torusSDF(vec3 p, vec3 pos, vec2 t)
{
    vec3 pLocal = p - pos;              // Translate point relative to torus center
//  vec3 pLocal = p - pos;              // Translate point relative to torus center
    vec2 q = vec2(length(pLocal.xy) - t.x, pLocal.z);
//  vec2 q = vec2(length(pLocal.xy) - t.x, pLocal.z);
    return length(q) - t.y;             // Distance to torus surface
//  return length(q) - t.y;             // Distance to torus surface
}


float sphereSDF(vec3 p, vec3 c, float r)
{
    return distance(p, c) - r;          // Distance to sphere surface
//  return distance(p, c) - r;          // Distance to sphere surface
}


struct SceneHit
{
    float dist;
//  float dist;
    vec3 color;
//  vec3 color;
};


SceneHit sceneSDF(vec3 p)
{
    float groundDist = p.y;
//  float groundDist = p.y;
    float sphereDist = sphereSDF(p, vec3(2.0, 1.5, 5.0), 1.0);
//  float sphereDist = sphereSDF(p, vec3(2.0, 1.5, 5.0), 1.0);
    float torusDist = torusSDF(p, vec3(-2.0, 1.5, 5.0), vec2(1.0, 0.5));
//  float torusDist = torusSDF(p, vec3(-2.0, 1.5, 5.0), vec2(1.0, 0.5));

    SceneHit hit;
//  SceneHit hit;
    if (groundDist < sphereDist && groundDist < torusDist)
    {
        hit.dist = groundDist;
//      hit.dist = groundDist;
        hit.color = COLOR_GROUND;
//      hit.color = COLOR_GROUND;
    }
    else
    if (sphereDist < torusDist)
    {
        hit.dist = sphereDist;
//      hit.dist = sphereDist;
        hit.color = COLOR_SPHERE;
//      hit.color = COLOR_SPHERE;
    }
    else
    {
        hit.dist = torusDist;
//      hit.dist = torusDist;
        hit.color = COLOR_TORUS;
//      hit.color = COLOR_TORUS;
    }
    return hit;
//  return hit;
}


vec3 getNormal(vec3 p)
{
    float dist = sceneSDF(p).dist;
//  float dist = sceneSDF(p).dist;
    vec3 normal = dist - vec3(
//  vec3 normal = dist - vec3(
        sceneSDF(p - EPS.xyy).dist,
//      sceneSDF(p - EPS.xyy).dist,
        sceneSDF(p - EPS.yxy).dist,
//      sceneSDF(p - EPS.yxy).dist,
        sceneSDF(p - EPS.yyx).dist
//      sceneSDF(p - EPS.yyx).dist
    );
//  );
    return normalize(normal);
//  return normalize(normal);
}


struct RayHit
{
    float dist;
//  float dist;
    vec3 color;
//  vec3 color;
};


RayHit rayMarching(vec3 rayOrigin, vec3 rayDirection)
{
    float d = 0.0;
//  float d = 0.0;
    SceneHit hit;
//  SceneHit hit;
    for (int i = 0; i < maxMarchingSteps; ++i)
    {
        vec3 p = rayOrigin + rayDirection * d;
//      vec3 p = rayOrigin + rayDirection * d;
        hit = sceneSDF(p);
//      hit = sceneSDF(p);
        d += hit.dist;
//      d += hit.dist;
        if (hit.dist < surfaceDist || d > maxDist)
        {
            break;
//          break;
        }
    }
    return RayHit(d, hit.color);
//  return RayHit(d, hit.color);
}


float getLight(vec3 p)
{
    vec3 lightDirection = normalize(lightSource - p);
//  vec3 lightDirection = normalize(lightSource - p);
    vec3 normal = getNormal(p);
//  vec3 normal = getNormal(p);
    float diffuse = clamp(dot(lightDirection, normal), 0.0, 1.0);
//  float diffuse = clamp(dot(lightDirection, normal), 0.0, 1.0);
    float shadow = rayMarching(p + normal * shadowDist, lightDirection).dist;
//  float shadow = rayMarching(p + normal * shadowDist, lightDirection).dist;
    if (shadow < distance(lightSource, p))
    {
        diffuse *= 0.1;
//      diffuse *= 0.1;
    }
    return diffuse;
//  return diffuse;
}


vec3 getColor(vec3 rayOrigin, vec3 rayDirection)
{
    RayHit hit = rayMarching(rayOrigin, rayDirection);
//  RayHit hit = rayMarching(rayOrigin, rayDirection);
    vec3 p = rayOrigin + rayDirection * hit.dist;
//  vec3 p = rayOrigin + rayDirection * hit.dist;
    float diffuse = getLight(p);
//  float diffuse = getLight(p);
    vec3 color = hit.color * diffuse;
//  vec3 color = hit.color * diffuse;
    if (hit.dist >= maxDist)
    {
        color = vec3(0.0);              // Background color
//      color = vec3(0.0);              // Background color
    }
    return color;
//  return color;
}


void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy; // Screen space [0, 1]
//  vec2 uv = fragCoord / iResolution.xy; // Screen space [0, 1]
    uv -= 0.5;                          // Center at (0, 0)
//  uv -= 0.5;                          // Center at (0, 0)
    uv.x *= iResolution.x / iResolution.y; // Adjust for aspect ratio
//  uv.x *= iResolution.x / iResolution.y; // Adjust for aspect ratio

    // Map iMouse to camera position
//  // Map iMouse to camera position
    vec2 mouseUV = iMouse.xy / iResolution.xy; // Normalize mouse to [0, 1]
//  vec2 mouseUV = iMouse.xy / iResolution.xy; // Normalize mouse to [0, 1]
    vec3 rayOrigin;
//  vec3 rayOrigin;
    if (iMouse.z > 0.0)
    {
        // If mouse is clicked/dragged
//      // If mouse is clicked/dragged
        // Map mouse X to [-5, 5] and Y to [0, 10], Z fixed at 0
//      // Map mouse X to [-5, 5] and Y to [0, 10], Z fixed at 0
        rayOrigin = vec3(
//      rayOrigin = vec3(
            (mouseUV.x - 0.5) * 10.0,   // X: -05 to +05
//          (mouseUV.x - 0.5) * 10.0,   // X: -05 to +05
             mouseUV.y        * 10.0,   // Y: +00 to +10
//           mouseUV.y        * 10.0,   // Y: +00 to +10
                         0.0            // Z: Fixed (adjust if needed)
//                       0.0            // Z: Fixed (adjust if needed)
        );
//      );
    }
    else
    {
        rayOrigin = vec3(0.0, 1.0, 0.0); // Default position if no mouse input
//      rayOrigin = vec3(0.0, 1.0, 0.0); // Default position if no mouse input
    }

    // Anti-aliasing
//  // Anti-aliasing
    vec2 pixelSize = 1.0 / iResolution.xy;
//  vec2 pixelSize = 1.0 / iResolution.xy;
    vec3 finalColor = vec3(0.0);
//  vec3 finalColor = vec3(0.0);
    float totalSamples = float(AA_SAMPLES * AA_SAMPLES);
//  float totalSamples = float(AA_SAMPLES * AA_SAMPLES);

    for     (int i = 0; i < AA_SAMPLES; i++)
    {
        for (int j = 0; j < AA_SAMPLES; j++)
        {
            vec2 offset = (vec2(float(i), float(j)) / float(AA_SAMPLES - 1) - 0.5) * pixelSize;
//          vec2 offset = (vec2(float(i), float(j)) / float(AA_SAMPLES - 1) - 0.5) * pixelSize;
            vec2 sampleUV = uv + offset;
//          vec2 sampleUV = uv + offset;
            vec3 rayDirection = normalize(vec3(sampleUV.x, sampleUV.y, 1.0));
//          vec3 rayDirection = normalize(vec3(sampleUV.x, sampleUV.y, 1.0));
            finalColor += getColor(rayOrigin, rayDirection);
//          finalColor += getColor(rayOrigin, rayDirection);
        }
    }
    finalColor /= totalSamples;
//  finalColor /= totalSamples;

    fragColor = vec4(finalColor, 1.0);
//  fragColor = vec4(finalColor, 1.0);
}







