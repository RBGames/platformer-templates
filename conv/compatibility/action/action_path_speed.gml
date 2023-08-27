/// @description (Old DnD) - set path speed
/// @param speed new speed
var spd = argument0;
if (global.__argument_relative) {
	spd += path_speed;
}  // end if
path_speed = spd;