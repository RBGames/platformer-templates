/// @description (Old DnD) - if collision evauation
/// @param xxG 	x value
/// @param yyG 	y value
/// @param flag false for free, true for empty check
var xx = argument0;
var yy = argument1;
if (global.__argument_relative) {
	xx += x;
	yy += y;
}  // end if

if (argument2) {
	return !place_empty( xx, yy);
} else {
	return !place_free( xx, yy );
} // end if
