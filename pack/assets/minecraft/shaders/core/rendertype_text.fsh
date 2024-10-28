// DE: Hallo, da du offensichtlich gerade versuchst unsere Shader zu klauen, möchte ich dich freundlich darauf hinweisen, dass
// man normalerweise bevor man Code klaut wenigstens nachfragt, ob man diesen benutzen darf. Sollte eigentlich
// Common Sense sein, aber leider ist das nicht so. Wir behalten uns das Recht vor rechtlich gegen Urheberrechtsverletzungen
// vorzugehen.

// EN: Hello, since you are obviously trying to steal our shaders, I would like to kindly point out that
// normally, before stealing code, you at least ask if you are allowed to use it. Should actually be
// common sense, but unfortunately this is not the case. We reserve the right to take legal action
// against copyright infringement.

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
