/// @description (Old DnD) - destroy instances at position
/// @param x	x position 
/// @param y	y position 

var xx = argument0;
var yy = argument1;
if (global.__argument_relative) {
	xx += x;
	yy += y;
}  // end if
position_destroy( xx, yy );