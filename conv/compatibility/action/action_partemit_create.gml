/// @description (Old DnD) - particle system emitter create in a region
/// @param index emitter index
/// @param shape shape to use
/// @param xMin	x min
/// @param xMax	x max
/// @param yMin	y min
/// @param yMax	y max
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_emit[index] < 0) {
	global.__part_emit[index] = part_emitter_create(global.__part_syst);
} // end if
part_emitter_region( global.__part_syst, global.__part_emit[index], argument2, argument3, argument4, argument5, argument1, 0);