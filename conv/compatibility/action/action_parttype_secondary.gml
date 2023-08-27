/// @description (Old DnD) - particle type secondary
/// @param index type index
/// @param stepType
/// @param stepNumber 
/// @param deathType
/// @param deathNumber
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_type[index] < 0) {
	global.__part_type[index] = part_type_create();
} // end if
part_type_step(global.__part_type[index], argument2, global.__part_type[argument1] );
part_type_death(global.__part_type[index], argument4, global.__part_type[argument3] );
