/// @description d3d - Sets the primitive vertex and normal
/// @param x the x position
/// @param y the y position
/// @param z the z position
/// @param nx the normal x
/// @param ny the normal y
/// @param nz the normal z
/// @param col the colour
/// @param alpha the alpha

vertex_position_3d( global.__d3dPrimBuffer, argument0, argument1, argument2 );
vertex_normal( global.__d3dPrimBuffer, argument3, argument4, argument5 );
vertex_colour( global.__d3dPrimBuffer, argument6, argument7 );
vertex_texcoord( global.__d3dPrimBuffer, 0, 0 );


