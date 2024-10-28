#version 150
#define FSH
#define RENDERTYPE_TEXT

#moj_import <fog.glsl>

// These are inputs and outputs to the shader
// If you are merging with a shader, put any inputs and outputs that they have, but are not here already, in the list below
uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform float GameTime;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 baseColor;
in vec4 lightColor;
in vec3 vertexPosition;

out vec4 fragColor;

#moj_import <spheya_packs_impl.glsl>
#moj_import <projection.glsl>
#ifdef CYTOOXIEN_DARK_MODE
#moj_import <dark_mode_utils.glsl>
#endif

void main() {
    if(applySpheyaPacks()) return;
    #ifdef CYTOOXIEN_DARK_MODE
    if (applyDarkMode()) return;
    #endif

    // Code below here is vanilla rendering,
    // If you are merging with another shader, replace the code below here with the code that they have in their main() function

    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
