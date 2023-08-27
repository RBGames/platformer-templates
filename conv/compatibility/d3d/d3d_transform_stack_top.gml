/// @description d3d - Makes the top transformation the current one.
var m = matrix_stack_top();
matrix_set( matrix_world, m);
