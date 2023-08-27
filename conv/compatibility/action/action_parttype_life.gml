/// @description (Old DnD) - particle type life
/// @param index type index
/// @param lifeMin minimum lifetime
/// @param lifeMax maximum lifetime
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_type[index] < 0) {
	global.__part_type[index] = part_type_create();
} // end if
part_type_life(global.__part_type[index], argument1, argument2 );