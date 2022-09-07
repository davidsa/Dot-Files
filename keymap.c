
 /* Copyright 2021 Dane Evans
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
  // SOFLE RGB
#include <stdio.h>

#include QMK_KEYBOARD_H

#define INDICATOR_BRIGHTNESS 30

#define HSV_OVERRIDE_HELP(h, s, v, Override) h, s , Override
#define HSV_OVERRIDE(hsv, Override) HSV_OVERRIDE_HELP(hsv,Override)

// Light combinations
#define SET_INDICATORS(hsv) \
	{0, 1, HSV_OVERRIDE_HELP(hsv, INDICATOR_BRIGHTNESS)}, \
    {36+0, 1, HSV_OVERRIDE_HELP(hsv, INDICATOR_BRIGHTNESS)}

#define SET_UNDERGLOW(hsv) \
	{1   , 6, hsv}, \
    {36+1, 6, hsv}

#define SET_NUMROW(hsv) \
	{12, 1, hsv}, \
	{21, 2, hsv}, \
	{31, 2, hsv}, \
    {36+12, 1, hsv}, \
    {36+21, 2, hsv}, \
    {36+31, 2, hsv}

#define SET_MODIFIER_KEYS(hsv) \
    {7, 2, hsv}, \
    {16, 2, hsv}, \
    {26, 1, hsv}, \
    {36+7, 2, hsv}, \
    {36+16, 2, hsv}, \
    {36+26, 1, hsv}

#define SET_THUMB_KEYS(hsv) \
    {27, 1, hsv}, \
    {36+27, 1, hsv}

#define SET_REGULAR_KEYS(hsv) \
    {9, 3, hsv}, \
    {13, 3, hsv}, \
    {18, 3, hsv}, \
    {23, 3, hsv}, \
    {28, 3, hsv}, \
    {33, 3, hsv}, \
    {9+13, 3, hsv}, \
    {36+13, 3, hsv}, \
    {36+18, 3, hsv}, \
    {36+23, 3, hsv}, \
    {36+28, 3, hsv}, \
    {36+33, 3, hsv}

#define SET_ESC(hsv) \
    {9, 1, hsv}

#define SET_SYMBOL_KEYS(hsv) \
    {36+23, 3, hsv}, \
    {36+28, 3, hsv}, \
    {36+33, 3, hsv}

#define SET_NAV(hsv) \
    {36+34, 1, hsv}, \
    {36+29, 1, hsv}, \
    {36+24, 1, hsv}, \
    {36+19, 1, hsv}

#define SET_MEDIA(hsv) \
    {23, 1, hsv}, \
    {30, 1, hsv}, \
    {33, 1, hsv}

#define SET_TMUX(hsv) \
    {19, 1, hsv}, \
    {24, 1, hsv}, \
    {29, 1, hsv}, \
    {34, 1, hsv}

#define SET_BRIGHTNESS(hsv) \
    {25, 1, hsv}, \
    {28, 1, hsv}

enum sofle_layers {
    _DEFAULTS = 0,
    _QWERTY = 0,
    _SYMBOLS,
    _NAV,
    _RAISE,
    _ADJUST
};

enum custom_keycodes {
    KC_QWERTY = SAFE_RANGE,
    KC_SYMBOLS,
    KC_NAV,
    KC_RAISE,
    KC_ADJUST,
    KC_D_MUTE,
    _TABNEXT,
    _TABPREV,
    _TABNEW,
    _TABCLOSE,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/*
 * QWERTY
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |  º   |   1  |   2  |   3  |   4  |   5  |                    |   6  |   7  |   8  |   9  |   0  |  `   |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | TAB  |   Q  |   W  |   E  |   R  |   T  |                    |   Y  |   U  |   I  |   O  |   P  | Bspc |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | ESC  |   A  |   S  |   D  |   F  |   G  |-------.    ,-------|   H  |   J  |   K  |   L  |   ;  |  '   |
 * |------+------+------+------+------+------| MUTE  |    |DISCORD|------+------+------+------+------+------|
 * |LShift|   Z  |   X  |   C  |   V  |   B  |-------|    |-------|   N  |   M  |   ,  |   .  |   /  |LShift|
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *            | LCTR | LAlt | CMD  | Space| /SYMBOLS/       \RAISE \  |ENTER |Bspc  | RAlt | RCTR |
 *            |      |      |      |      |/       /         \      \ |      |      |      |      |
 *            `----------------------------------'           '------''---------------------------'
 */
  [_QWERTY] = LAYOUT(
  //,------------------------------------------------.                    ,---------------------------------------------------.
  KC_NUBS,   KC_1,   KC_2,    KC_3,    KC_4,    KC_5,                       KC_6,    KC_7,   KC_8,    KC_9,    KC_0,    KC_MINS,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  KC_TAB,  KC_Q,   KC_W,    KC_E,    KC_R,    KC_T,                        KC_Y,    KC_U,   KC_I,    KC_O,    KC_P,    KC_RBRC,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  LT(_NAV,KC_ESC),  KC_A,   KC_S,    KC_D,    KC_F,    KC_G,               KC_H,    KC_J,   KC_K,    KC_L,    KC_SCLN, KC_QUOT,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
  KC_LSFT, KC_Z,   KC_X,    KC_C,    KC_V,    KC_B,  KC_MUTE,  KC_D_MUTE, KC_N,    KC_M,   KC_COMM, KC_DOT,  KC_SLSH, KC_LSFT,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                 KC_LCTRL, KC_LALT, KC_LGUI, KC_SPC, KC_SYMBOLS, KC_RAISE,  KC_ENT,  KC_BSPC,KC_RALT, KC_RCTRL
  //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
),

/* SYMBOLS
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |  F1  |  F2  |  F3  |  F4  |  F5  |                    |  F6  |  F7  |  F8  |  F9  | F10  | F11  |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |                    |   `  |   [  |   ]  |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------.    ,-------|   =  |   {  |   }  |      |      |      |
 * |------+------+------+------+------+------|       |    |       |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------|    |-------|   \  |   <  |   >  |      |      |      |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *            |      |      |      |      | /       /       \      \  |      |      |      |      |
 *            |      |      |      |      |/       /         \      \ |      |      |      |      |
 *            `----------------------------------'           '------''---------------------------'
 */
[_SYMBOLS] = LAYOUT(
  //,------------------------------------------------.                    ,---------------------------------------------------.
  _______,  KC_F1,  KC_F2,   KC_F3,   KC_F4,   KC_F5,                      KC_F6,   KC_F7,   KC_F8,   KC_F9,  KC_F10,  KC_F11,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, _______, _______, _______,                    KC_LBRC , A(KC_LBRC), A(KC_RBRC), _______, _______, _______,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, _______, _______, _______,                    S(KC_0), A(KC_QUOT), A(KC_BSLS), _______, _______, _______,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, _______, _______, _______, _______,  _______, A(KC_NUBS), KC_GRV,  S(KC_GRV),   _______, _______, _______,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                 _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______
  //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
),
/* NAV
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------.    ,-------|   <  |   -  |   ^  |   >  |      |      |
 * |------+------+------+------+------+------|       |    |       |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------|    |-------|      |      |      |      |      |      |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *            |      |      |      |      | /       /       \      \  |      |      |      |      |
 *            |      |      |      |      |/       /         \      \ |      |      |      |      |
 *            `----------------------------------'           '------''---------------------------'
 */
[_NAV] = LAYOUT(
  //,------------------------------------------------.                    ,---------------------------------------------------.
  _______, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, _______, _______, _______,                    KC_LEFT, KC_DOWN, KC_UP, KC_RIGHT, _______, _______,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, _______, _______, _______, _______,  _______, _______, _______, _______, _______, _______, _______,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                 _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______
  //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
),
/* RAISE
 * ,----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | Esc  | Ins  | Pscr | Menu |      |      |                    |      | PWrd |  Up  | NWrd | DLine| Bspc |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | Tab  | LAt  | LCtl |LShift|      | Caps |-------.    ,-------|      | Left | Down | Rigth|  Del | Bspc |
 * |------+------+------+------+------+------|  MUTE  |    |       |------+------+------+------+------+------|
 * |Shift | Undo |  Cut | Copy | Paste|      |-------|    |-------|      | LStr |      | LEnd |      | Shift|
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *            | LGUI | LAlt | LCTR |SYMBOLS | /Enter  /       \Space \  |RAISE | RCTR | RAlt | RGUI |
 *            |      |      |      |      |/       /         \      \ |      |      |      |      |
 *            `----------------------------------'           '------''---------------------------'
 */
[_RAISE] = LAYOUT(
  //,------------------------------------------------.                    ,---------------------------------------------------.
  KC_SLEP, _______, _______, _______, _______, _______,                    _______, _______, _______, _______, _______, _______,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, KC_MPRV, KC_MPLY, KC_MNXT,                    _______, _______, _______, _______, _______, _______,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  _______, _______,_TABCLOSE,_TABPREV,_TABNEXT,_TABNEW,                    _______, _______, _______, _______, _______, _______,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
  _______, _______, _______, KC_BRID, KC_BRIU, RGB_TOG, _______,  _______, _______, _______, _______, _______, _______, _______,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                 _______, _______, _______, _______, _______,     _______, _______, _______, _______, _______
  //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
),
/* ADJUST
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | RESET|      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |RGB_TOG|hue^ |sat ^ | bri ^|      |      |-------.   ,-------|desk <|      |      |desk >|      |      |
 * |------+------+------+------+------+------|  MUTE |    |       |------+------+------+------+------+------|
 * | mode | hue dn|sat d|bri dn|      |QWERTY|-------|    |-------|      | PREV | PLAY | NEXT |      |      |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *            | LGUI | LAlt | LCTR |SYMBOLS | /Enter/       \Space \  |RAISE | RCTR | RAlt | RGUI |
 *            |      |      |      |      |/       /         \      \ |      |      |      |      |
 *            `----------------------------------'           '------''---------------------------'
 */
  [_ADJUST] = LAYOUT(
  //,------------------------------------------------.                    ,---------------------------------------------------.
  EEP_RST, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  RESET,   XXXXXXX,XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|------+-------+--------+--------+--------+------|                   |--------+-------+--------+--------+--------+---------|
  RGB_TOG, RGB_HUI,RGB_SAI, RGB_VAI, KC_NO,   KC_NO,             C(G(KC_LEFT)),KC_NO,KC_NO,C(G(KC_RGHT)),XXXXXXX, XXXXXXX,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
  RGB_MOD, RGB_HUD,RGB_SAD, RGB_VAD, XXXXXXX,KC_QWERTY,XXXXXXX,   XXXXXXX, XXXXXXX, KC_MPRV, KC_MPLY, KC_MNXT, XXXXXXX, XXXXXXX,
  //|------+-------+--------+--------+--------+------|  ===  |   |  ===  |--------+-------+--------+--------+--------+---------|
                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX
    //            \--------+--------+--------+---------+-------|   |--------+---------+--------+---------+-------/
),
};

#ifdef RGBLIGHT_ENABLE
char layer_state_str[70];

const rgblight_segment_t PROGMEM layer_qwerty_lights[] = RGBLIGHT_LAYER_SEGMENTS(
  SET_INDICATORS(HSV_BLUE),
  SET_REGULAR_KEYS(HSV_BLUE),
  SET_NUMROW(HSV_TURQUOISE),
  SET_MODIFIER_KEYS(HSV_TEAL),
  SET_ESC(HSV_TEAL),
  SET_THUMB_KEYS(HSV_TEAL)
);

const rgblight_segment_t PROGMEM layer_symbol_lights[] = RGBLIGHT_LAYER_SEGMENTS(
  SET_INDICATORS(HSV_PURPLE),
  SET_REGULAR_KEYS(HSV_BLUE),
  SET_NUMROW(HSV_TURQUOISE),
  SET_MODIFIER_KEYS(HSV_TEAL),
  SET_ESC(HSV_TEAL),
  SET_THUMB_KEYS(HSV_TEAL),
  SET_SYMBOL_KEYS(HSV_PURPLE)
);

const rgblight_segment_t PROGMEM layer_nav_lights[] = RGBLIGHT_LAYER_SEGMENTS(
  SET_INDICATORS(HSV_SPRINGGREEN),
  SET_REGULAR_KEYS(HSV_BLUE),
  SET_NUMROW(HSV_TURQUOISE),
  SET_MODIFIER_KEYS(HSV_TEAL),
  SET_ESC(HSV_TEAL),
  SET_THUMB_KEYS(HSV_TEAL),
  SET_NAV(HSV_SPRINGGREEN)
);

const rgblight_segment_t PROGMEM layer_raise_lights[] = RGBLIGHT_LAYER_SEGMENTS(
  SET_INDICATORS(HSV_ORANGE),
  SET_REGULAR_KEYS(HSV_BLUE),
  SET_NUMROW(HSV_TURQUOISE),
  SET_MODIFIER_KEYS(HSV_TEAL),
  SET_ESC(HSV_TEAL),
  SET_THUMB_KEYS(HSV_TEAL),
  SET_MEDIA(HSV_GREEN),
  SET_TMUX(HSV_ORANGE),
  SET_BRIGHTNESS(HSV_YELLOW),
  {35, 1, HSV_RED}
);

const rgblight_segment_t PROGMEM layer_adjust_lights[] = RGBLIGHT_LAYER_SEGMENTS(
  SET_INDICATORS(HSV_BLUE),
  SET_REGULAR_KEYS(HSV_BLUE),
  SET_NUMROW(HSV_TURQUOISE),
  SET_MODIFIER_KEYS(HSV_TEAL),
  SET_ESC(HSV_TEAL),
  SET_THUMB_KEYS(HSV_TEAL)
);

const rgblight_segment_t* const PROGMEM my_rgb_layers[] = RGBLIGHT_LAYERS_LIST(
    layer_qwerty_lights,
	layer_symbol_lights,
    layer_nav_lights,
    layer_raise_lights,
    layer_adjust_lights
);

layer_state_t layer_state_set_user(layer_state_t state) {
	rgblight_set_layer_state(0, layer_state_cmp(state, _DEFAULTS) && layer_state_cmp(default_layer_state,_QWERTY));
	rgblight_set_layer_state(1, layer_state_cmp(state, _SYMBOLS));
	rgblight_set_layer_state(2, layer_state_cmp(state, _NAV));
	rgblight_set_layer_state(3, layer_state_cmp(state, _RAISE));
	rgblight_set_layer_state(4, layer_state_cmp(state, _ADJUST));
    return state;
}

void keyboard_post_init_user(void) {
    // Enable the LED layers
    rgblight_enable_noeeprom();
    rgblight_sethsv_noeeprom(HSV_BLUE);
    rgblight_mode_noeeprom(RGBLIGHT_MODE_STATIC_LIGHT);
    rgblight_layers = my_rgb_layers;
}
#endif

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case KC_QWERTY:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_QWERTY);
            }
            return false;
        case KC_SYMBOLS:
            if (record->event.pressed) {
                layer_on(_SYMBOLS);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            } else {
                layer_off(_SYMBOLS);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            }
            return false;
        case KC_RAISE:
            if (record->event.pressed) {
                layer_on(_RAISE);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            } else {
                layer_off(_RAISE);
                update_tri_layer(_SYMBOLS, _RAISE, _ADJUST);
            }
            return false;
        case KC_ADJUST:
            if (record->event.pressed) {
                layer_on(_ADJUST);
            } else {
                layer_off(_ADJUST);
            }
            return false;
        case KC_D_MUTE:
            if (record->event.pressed) {
                register_mods(mod_config(MOD_MEH));
                register_code(KC_UP);
            } else {
                unregister_mods(mod_config(MOD_MEH));
                unregister_code(KC_UP);
            }
        case _TABNEXT:
            if (record->event.pressed) {
                register_code(KC_LCTRL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTRL);
            } else {
                register_code(KC_N);
                unregister_code(KC_N);
            }
            break;
        case _TABPREV:
            if (record->event.pressed) {
                register_code(KC_LCTRL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTRL);
            } else {
                register_code(KC_P);
                unregister_code(KC_P);
            }
            break;
        case _TABNEW:
            if (record->event.pressed) {
                register_code(KC_LCTRL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTRL);
            } else {
                register_code(KC_C);
                unregister_code(KC_C);
            }
            break;
        case _TABCLOSE:
            if (record->event.pressed) {
                register_code(KC_LCTRL);
                register_code(KC_B);
                unregister_code(KC_B);
                unregister_code(KC_LCTRL);
            } else {
                register_code(KC_X);
                unregister_code(KC_X);
            }
            break;
    }
    return true;
}

#ifdef ENCODER_ENABLE

bool encoder_update_user(uint8_t index, bool clockwise) {
    if (index == 0) {
        if (clockwise) {
            tap_code(KC_VOLU);
        } else {
            tap_code(KC_VOLD);
        }
    } else if (index == 1) {
        if (clockwise) {
            tap_code(KC_BRIU);
        } else {
            tap_code(KC_BRID);
        }
    }
    return true;
}

#endif
