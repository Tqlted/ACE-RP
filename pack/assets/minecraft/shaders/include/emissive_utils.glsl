// DE: Hallo, da du offensichtlich gerade versuchst unsere Shader zu klauen, möchte ich dich freundlich darauf hinweisen, dass
// man normalerweise bevor man Code klaut wenigstens nachfragt, ob man diesen benutzen darf. Sollte eigentlich
// Common Sense sein, aber leider ist das nicht so. Wir behalten uns das Recht vor rechtlich gegen Urheberrechtsverletzungen
// vorzugehen.

// EN: Hello, since you are obviously trying to steal our shaders, I would like to kindly point out that
// normally, before stealing code, you at least ask if you are allowed to use it. Should actually be
// common sense, but unfortunately this is not the case. We reserve the right to take legal action
// against copyright infringement.

#version 150

vec4 make_emissive(vec4 defaultColor, vec4 pixelColor, vec4 vertexColor, vec4 ColorModulator) {
    float alpha = pixelColor.a;

    if (alpha == 254./255.) {
        pixelColor.a = 1;
        return pixelColor * mix(vertexColor, vec4(1.), 2) * ColorModulator;
    } else if (alpha == 234./255.) {
        pixelColor.a = 230./255.; // 90% transparency
        return pixelColor * mix(vertexColor, vec4(1.), 2) * ColorModulator;
    } else if (alpha == 233./255.) {
        pixelColor.a = 204./255.; // 80% transparency
        return pixelColor * mix(vertexColor, vec4(1.), 2) * ColorModulator;
    } else if (alpha == 154./255.) {
        pixelColor.a = 153./255.; // 60% transparency
        return pixelColor * mix(vertexColor, vec4(1.), 2) * ColorModulator;
    } else if (alpha == 103./255.) {
        pixelColor.a = 102./255.; // 40% transparency
        return pixelColor * mix(vertexColor, vec4(1.), 2) * ColorModulator;
    } else if (alpha == 249./255.) {
        pixelColor.a = 1;
        return pixelColor * vertexColor * 2.5 * ColorModulator;
    }

    return defaultColor;
}
