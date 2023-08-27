/// @description (Old DnD) - particle type create (older version)
/// @param index type index
/// @param shape
/// @param sizeMin minimum size
/// @param sizeMax maximum size
/// @param colStart colour at start
/// @param colEnd colour at end
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_type[index] < 0) {
	global.__part_type[index] = part_type_create();
} // end if
part_type_shape(global.__part_type[index], argument1 );
part_type_size(global.__part_type[index], argument2, argument3, 0, 0 );
part_type_colour2(global.__part_type[index], argument4, argument5 );
