/// @description (Old DnD) - particle type speed
/// @param index type index
/// @param speedMin
/// @param speedMax
/// @param dirMin
/// @param dirMax
/// @param stepInc
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_type[index] < 0) {
	global.__part_type[index] = part_type_create();
} // end if
part_type_speed(global.__part_type[index], argument1, argument2, -argument5, 0 );
part_type_direction(global.__part_type[index], argument3, argument4, 0, 0 );
