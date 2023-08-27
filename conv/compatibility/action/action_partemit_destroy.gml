/// @description (Old DnD) - particle system emitter destroy
/// @param index emitter index
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_emit[index] < 0) {
	return;
} // end if
part_emitter_destroy( global.__part_syst, global.__part_emit[index]);