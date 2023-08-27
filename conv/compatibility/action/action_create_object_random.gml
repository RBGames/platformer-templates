/// @description (Old DnD) - creates an instance of an object (from a choice of 4) at a position
/// @param objInd0 	possible object to create
/// @param objInd1 	possible object to create
/// @param objInd2 	possible object to create
/// @param objInd3 	possible object to create
/// @param xPos		X position to create at
/// @param yPos		Y position to create at

var ob = choose( argument0, argument1, argument2, argument3 );

if (!object_exists(ob)) {
	return 0;
} // end if

if (global.__argument_relative)	{
	i = instance_create( x+argument4, y+argument5, ob);
} else {
	i = instance_create( argument4, argument5, ob);
} // end if

