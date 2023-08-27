/// @description (Old DnD) - particle type set color
/// @param index type index
/// @param type particle type
/// @param col1 colour 1
/// @param col2 colour 2
/// @param alpha1 alpha 1
/// @param alpha2 alpha 2
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_type[index] < 0) {
	global.__part_type[index] = part_type_create();
} // end if
if (argument1 == 0) {
	part_type_color_mix(global.__part_type[index], argument2, argument3);
} else {
	part_type_color2(global.__part_type[index], argument2, argument3);
}
part_type_alpha2(global.__part_type[index], argument4, argument5 );
