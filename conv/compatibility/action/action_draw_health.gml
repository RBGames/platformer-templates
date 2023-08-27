/// @description (Old DnD) - draw health
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
var c1Type = argument4;
var c2Type= argument5;
var showBack = argument4;
var c1=0, c2=0, c3=0;
if (global.__argument_relative) {
	xx1 += x;
	yy1 += y;
	xx2 += x;
	yy2 += y;
}  // end if

switch( c1Type ) {
	case 0: c1=c_black; break;
	case 1: c1=c_black; break;
	case 2: c1=c_gray; break;
	case 3: c1=c_silver; break;
	case 4: c1=c_white; break;
	case 5: c1=c_maroon; break;
	case 6: c1=c_green; break;
	case 7: c1=c_olive; break;
	case 8: c1=c_navy; break;
	case 9: c1=c_purple; break;
	case 10: c1=c_teal; break;
	case 11: c1=c_red; break;
	case 12: c1=c_lime; break;
	case 13: c1=c_yellow; break;
	case 14: c1=c_blue; break;
	case 15: c1=c_fuchsia; break;
	case 16: c1=c_aqua; break;
} // end switch

switch( c2Type ) {
	case 0: { c2=c_red; c3=c_lime; } break;
	case 1: { c2=c_black; c3=c_white; } break;
	case 2: c2=c_black; break;
	case 3: c2=c_gray; break;
	case 4: c2=c_silver; break;
	case 5: c2=c_white; break;
	case 6: c2=c_maroon; break;
	case 7: c2=c_green; break;
	case 8: c2=c_olive; break;
	case 9: c2=c_navy; break;
	case 10: c2=c_purple; break;
	case 11: c2=c_teal; break;
	case 12: c2=c_red; break;
	case 13: c2=c_lime; break;
	case 14: c2=c_yellow; break;
	case 15: c2=c_blue; break;
	case 16: c2=c_fuchsia; break;
	case 17: c2=c_aqua; break;
} // end switch

if (c2Type>1) { c3=c2; }
draw_healthbar( xx1, yy1, xx2, yy2, health, c1, c2, c3, 0, showBack, true );