/// @description (Old DnD) - particle type create
/// @param index type index
/// @param shape
/// @param sprite sprite index
/// @param sizeMin minimum size
/// @param sizeMax maximum size
/// @param sizeIncr size increments
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_type[index] < 0) {
	global.__part_type[index] = part_type_create();
} // end if
part_type_shape(global.__part_type[index], argument1 );
part_type_sprite(global.__part_type[index], argument2, true, false, false );
part_type_size(global.__part_type[index], argument3, argument4, argument5, 0 );
