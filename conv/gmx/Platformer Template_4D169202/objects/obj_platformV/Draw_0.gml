/// @description  Debugging
draw_set_color(c_black);
draw_set_font(fnt_roboto32);
draw_self();
draw_text(x, y - 32, string_hash_to_newline(intVSpeed));
draw_text(x, y - 64, string_hash_to_newline(place_meeting(x, y - 1, obj_player) && !place_meeting(x, y, obj_player)));

