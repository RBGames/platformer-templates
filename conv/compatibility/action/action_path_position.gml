/// @description (Old DnD) - set path position
/// @param position new position
var pos = argument0;
if (global.__argument_relative) {
	pos += path_position;
}  // end if
path_position = pos;