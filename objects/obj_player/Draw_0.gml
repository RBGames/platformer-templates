/// @description  Debugging
draw_set_color(c_black);
draw_set_font(fnt_roboto32);
draw_self();
//draw_text(x, y - 128, string(intHSpeed) + "  " + string(intVSpeed));
//draw_text(x, y - 200, justPlatform);
draw_text(x, y - 200, string_hash_to_newline("On Ground: " + string(bolGround)));
draw_text(x, y - 240, string_hash_to_newline("On Water: " + string(bolSurface)));
//draw_text(x, y - 280, "Jump Key: " + string(keyjump));
//draw_text(x, y - 320, "Temp Jumping: " + string(bolTempJump));
draw_text(x, y - 280, string_hash_to_newline("Y: " + string(y)));
draw_text(x, y - 320, string_hash_to_newline("Platfom Y: " + string(instance_nearest(x,y,obj_platformV).y)));
draw_text(x, y - 360, string_hash_to_newline("DJump Count: " + string(intDJump)));

