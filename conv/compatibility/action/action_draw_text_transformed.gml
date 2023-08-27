/// @description (Old DnD) - draw text transformed
/// @param msg	text to display
/// @param x	x position 
/// @param y	y position 
/// @param xscale	x scale
/// @param yscale	y scale
/// @param angle	angle

var msg = argument0;
var xx = argument1;
var yy = argument2;
if (global.__argument_relative) {
	xx += x;
	yy += y;
}  // end if
draw_text_transformed( xx, yy, string_hash_to_newline(msg), argument3, argument4, argument5 );