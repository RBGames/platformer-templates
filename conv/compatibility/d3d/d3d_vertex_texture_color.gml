/// @description d3d - Sets the primitive vertex
/// @param x the x position
/// @param y the y position
/// @param z the z position
/// @param u the normal u
/// @param v the normal v
/// @param col the colour
/// @param alpha the alpha

vertex_position_3d( global.__d3dPrimBuffer, argument0, argument1, argument2 );
vertex_normal( global.__d3dPrimBuffer, 0, 0, 0 );
vertex_colour( global.__d3dPrimBuffer, argument5, argument6 );
vertex_texcoord( global.__d3dPrimBuffer, (argument3 * global.__d3dPrimTexW) + global.__d3dPrimTexX, (argument4 * global.__d3dPrimTexH) + global.__d3dPrimTexY );


