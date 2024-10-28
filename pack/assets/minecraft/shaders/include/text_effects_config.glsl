#ifndef TEXT_EFFECT
#define TEXT_EFFECT(r, g, b) void f()
#endif


// UTIL 

    // WHITE + NO BACKGROUND
    TEXT_EFFECT(240, 240, 4) {
        override_text_color(rgb(255,255,255));
        remove_text_shadow();
    }

    // WHITE + BLACK BACKGROUND
    TEXT_EFFECT(240, 240, 8) {
        override_shadow_color(rgb(0,0,0));
    }

// BOSSBARS 
    // LOBBY 2ND BOSSBAR
    TEXT_EFFECT(240, 240, 12) {
        apply_iterating_movement(1, 2);
        change_position(0,-22);
        apply_gradient(rgb(238, 102, 102),rgb(208, 72, 72));
        apply_outline(rgb(0,0,0));
    }

    // BUY 2ND BOSSBAR
    TEXT_EFFECT(240, 240, 24) {
        change_position(0,-22);
        apply_metalic(rgb(249, 222, 87),rgb(233, 164, 21));
        apply_outline(rgb(102, 31, 13));
    }

// DEV
TEXT_EFFECT(240, 240, 16) {
    apply_gradient(rgb(170, 85, 255),rgb(200, 115, 255));
    override_shadow_color(rgb(0,0,0));
}

// CARDS
TEXT_EFFECT(240, 240, 20) {
    override_text_color(rgb(255,255,255));
    remove_text_shadow();
    apply_thin_outline(rgb(0,0,0));
}

// VOTE TEXT
TEXT_EFFECT(240, 240, 236) {
    apply_rainbow();
}

