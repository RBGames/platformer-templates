/// @description (Old DnD) - particle system emitter burst
/// @param index emitter index
/// @param ptype particle type
/// @param num number

if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
var index = argument0;
if (global.__part_emit[index] < 0) {
	show_message( "The particle emitter must first be created" );
	return;
} // end if
var ptype = argument1;
var num = argument2;
part_emitter_burst(global.__part_syst,  global.__part_emit[index], ptype, num )