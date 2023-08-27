/// @description d3d - Adds a rotation around the y-axis with the indicated amount.
/// @param angle the angle to rotate

// get the sin and cos of the angle passed in
var c = dcos(argument0);
var s = dsin(argument0);

// build the rotation matrix
var mT = matrix_build_identity();
mT[0] = c;
mT[2] = s;

mT[8] = -s;
mT[10] = c;

var m = matrix_get( matrix_world );
var mR = matrix_multiply( m, mT );
matrix_set( matrix_world, mR );
