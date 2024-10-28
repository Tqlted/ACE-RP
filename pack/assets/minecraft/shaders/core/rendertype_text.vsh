#version 150
#define VSH
#define RENDERTYPE_TEXT

#moj_import <fog.glsl>
#moj_import <scoreboard_utils.glsl>
#moj_import <text_utils.glsl>

// These are inputs and outputs to the shader
// If you are merging with a shader, put any inputs and outputs that they have, but are not here already, in the list below
in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform vec2 ScreenSize;
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 baseColor;
out vec4 lightColor;
out vec3 vertexPosition;

uniform vec4 ColorModulator;
uniform int FogShape;


#moj_import <spheya_packs_impl.glsl>

void main() {
    
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    baseColor = Color;
    lightColor = texelFetch(Sampler2, UV2 / 16, 0);

    vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    vertexColor = baseColor * lightColor;
    texCoord0 = UV0;
    vertexPosition = Position;

    if(applySpheyaPacks()) return;

    // When merging with another shader, you should put the code in their main() function below here

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vec3 colorWithoutAlpha = vertexColor.rgb;

    bool is_gui_shadow = Position.z == 0.0;
    bool is_gui = Position.z == 0.03;

    if (is_scoreboard_number(Position, vertexColor)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position.x + 100, Position.y, Position.z, 0);
        vertexColor = vec4(0);
    } else if (is_gui_shadow && should_remove_shadow(Color)) {
        vertexColor = vec4(0);
    } else if (is_gui && is_text_shadow_remove_color(Color)) {
        vertexColor = vec4(vec3(1), vertexColor.a);
    }


}
