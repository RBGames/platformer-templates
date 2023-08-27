/// @description (Old DnD) - draw ellipse with gradient
/// @param x1	x position of start point
/// @param y1	y position of start point
/// @param x2	x position of end point
/// @param y2	y position of end point
/// @param c1   colour 1
/// @param c2   colour 2

var xx1 = argument0;
var yy1 = argument1;
var xx2 = argument2;
var yy2 = argument3;
if (global.__argument_relative) {
	xx1 += x;
	yy1 += y;
	xx2 += x;
	yy2 += y;
}  // end if

draw_ellipse_ext( xx1, yy1, xx2, yy2, argument4, argument5, false );
