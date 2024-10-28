// DE: Hallo, da du offensichtlich gerade versuchst unsere Shader zu klauen, möchte ich dich freundlich darauf hinweisen, dass
// man normalerweise bevor man Code klaut wenigstens nachfragt, ob man diesen benutzen darf. Sollte eigentlich
// Common Sense sein, aber leider ist das nicht so. Wir behalten uns das Recht vor rechtlich gegen Urheberrechtsverletzungen
// vorzugehen.

// EN: Hello, since you are obviously trying to steal our shaders, I would like to kindly point out that
// normally, before stealing code, you at least ask if you are allowed to use it. Should actually be
// common sense, but unfortunately this is not the case. We reserve the right to take legal action
// against copyright infringement.

#version 150

bool is_scoreboard_header_color(vec4 color) {
    return color.a == 102.0/255.0;
}

bool is_scoreboard_number(vec3 Position, vec4 vertexColor) {
//    Labymod renders on wrong z index
//    if (Position.z != 0.0) return false;
    if (Position.z != 0.0 && Position.z != 0.03) return false;
    if (gl_VertexID > 7) return false;
    if (vertexColor.rgb != vec3(252./255., 84./255., 84./255.)) return false;
    if (gl_Position.x >= 0.91 && gl_Position.y >= -0.35 && gl_Position.y <= 0.75) return true;
    return false;
}