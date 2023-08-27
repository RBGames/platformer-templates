/// @description (Old DnD) - if aligned evauation
/// @param xxG 	x alignment value
/// @param yyG 	y alignment value
var xxG = argument0;
var yyG = argument1;
var ret = false;
if ((xxG>0) && ((x % xxG)==0) && (yyG>0) && ((y % yyG)==0)) {
	ret = true;
} // end if
return ret;
