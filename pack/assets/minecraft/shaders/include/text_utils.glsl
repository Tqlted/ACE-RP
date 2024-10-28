#version 150

// Check if this is the shadow color of text with color set to #fcfc04
bool should_remove_shadow(vec4 Color) {
    return Color.rgb == vec3(63./255., 63./255., 1./255.);
}

// Check if the text color set to #fcfc04
bool is_text_shadow_remove_color(vec4 Color) {
    return Color.rgb == vec3(252./255., 252./255., 4./255.);
}

