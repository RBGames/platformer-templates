/// @description (Old DnD) - move the current instance until contact
/// @param dir direction
/// @param maxdist maximum distance
/// @param useall true if using all
if (argument2) {
	move_contact_all( argument0, argument1 );
} else {
	move_contact_solid( argument0, argument1 );
}

