/// @description (Old DnD) - particle system destroy
if (global.__part_syst >= 0) { 
	part_system_destroy(global.__part_syst);
}
global.__part_syst = -1;
