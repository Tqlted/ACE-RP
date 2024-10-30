#ifndef TEXT_EFFECT
#define TEXT_EFFECT(r, g, b) void f()
#endif


// UTIL 

    // WHITE + NO BACKGROUND
    TEXT_EFFECT(240, 240, 4) { // #F0F004
        override_text_color(rgb(255,255,255));
        remove_text_shadow();
    }

    // WHITE + BLACK BACKGROUND
    TEXT_EFFECT(240, 240, 8) { // #F0F008
        override_shadow_color(rgb(0,0,0));
    }

// BOSSBARS 
    // LOBBY 2ND BOSSBAR
    TEXT_EFFECT(240, 240, 12) { // #F0F00C
        apply_iterating_movement(1, 2);
        change_position(0,-22);
        apply_gradient(rgb(238, 102, 102),rgb(208, 72, 72));
        apply_outline(rgb(0,0,0));
    }

    // BUY 2ND BOSSBAR
    TEXT_EFFECT(240, 240, 24) { // #F0F018
        change_position(0,-22);
        apply_metalic(rgb(249, 222, 87),rgb(233, 164, 21));
        apply_outline(rgb(102, 31, 13));
    }

// DEV LORE
TEXT_EFFECT(240, 240, 16) { // #F0F010
    apply_gradient(rgb(170, 85, 255),rgb(200, 115, 255));
    override_shadow_color(rgb(0,0,0));
}

// DEV NAME
TEXT_EFFECT(240, 240, 28) { // #F0F01C
    override_text_color(rgb(255,255,255));
    apply_outline(rgb(150, 65, 235));
}

// CARDS
TEXT_EFFECT(240, 240, 20) { // #F0F014
    override_text_color(rgb(255,255,255));
    remove_text_shadow();
    apply_thin_outline(rgb(0,0,0));
}

// FIGHT TITLE
TEXT_EFFECT(240, 240, 32) { // #F0F020
    apply_metalic(rgb(251, 113, 133));
    override_shadow_color(rgb(0,0,0));
    apply_waving_movement(1.2,0.7);
}

// VOTE TEXT
TEXT_EFFECT(240, 240, 236) { // #F0F0EC
    apply_rainbow();
}

