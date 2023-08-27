/// @description (Old DnD) - particle system create
/// @param depth 
if (global.__part_syst < 0) { global.__part_syst = part_system_create(); }
part_system_clear(global.__part_syst);
part_system_depth(global.__part_syst, argument0);
for( var i=0; i<=15; ++i) {
	global.__part_type[i] = -1;
	global.__part_emit[i] = -1;
} // end for
