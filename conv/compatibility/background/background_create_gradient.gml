/// @description Creates a new background with a coloured gradient.
/// @param w The width of the new background.
/// @param h The height of the new background.
/// @param colour1 The first colour of the gradient.
/// @param colour2 The second colour of the gradient.
/// @param kind  The type of gradient (0 - 5). 
/// @returns {number} resource name for the new background

// First-pass implementation - may need to add engine support if this causes problems
var __w = argument0;
var __h = argument1;
var __col1 = argument2;
var __col2 = argument3;
var __kind = argument4;

var __halfw = __w / 2;
var __halfh = __h / 2;

var __CompTempSurf = surface_create(__w, __h);
if (surface_exists(__CompTempSurf))
{
	surface_set_target(__CompTempSurf);
	
	switch(__kind)
	{
		case 0:
		{
			// Horizontal gradient
			draw_rectangle_colour(0, 0, __w, __h, __col1, __col2, __col2, __col1, false);
		} break;
		
		case 1:
		{
			// Vertical gradient
			draw_rectangle_colour(0, 0, __w, __h, __col2, __col2, __col1, __col1, false);
		} break;
		
		case 2:
		{
			// Rectangular gradient			
			// Can't just use four rectangles due to triangulation artifacts
			// Also can't use a triangle fan because they aren't supported on all platforms			
			draw_primitive_begin(pr_trianglelist);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(0, __halfh, __col2, 1);
			draw_vertex_colour(0, 0, __col2, 1);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(0, 0, __col2, 1);
			draw_vertex_colour(__halfw, 0, __col2, 1);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(__halfw, 0, __col2, 1);
			draw_vertex_colour(__w, 0, __col2, 1);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(__w, 0, __col2, 1);
			draw_vertex_colour(__w, __halfh, __col2, 1);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(__w, __halfh, __col2, 1);
			draw_vertex_colour(__w, __h, __col2, 1);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(__w, __h, __col2, 1);
			draw_vertex_colour(__halfw, __h, __col2, 1);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(__halfw, __h, __col2, 1);
			draw_vertex_colour(0, __h, __col2, 1);
			
			draw_vertex_colour(__halfw, __halfh, __col1, 1);
			draw_vertex_colour(0, __h, __col2, 1);
			draw_vertex_colour(0, __halfh, __col2, 1);
			
			draw_primitive_end();
		} break;
		
		case 3:
		{
			// Elliptical gradient
			draw_clear(__col2);			
			draw_ellipse_colour(0, 0, __w, __h, __col1, __col2, false);
		} break;
		
		case 4:
		{
			// Symmetrical horizontal gradient
			draw_rectangle_colour(0, 0, __halfw, __h, __col2, __col1, __col1, __col2, false);
			draw_rectangle_colour(__halfw, 0, __w, __h, __col1, __col2, __col2, __col1, false);
		} break;
		
		case 5:
		{
			// Symmetrical vertical gradient
			draw_rectangle_colour(0, 0, __w, __halfh, __col2, __col2, __col1, __col1, false);
			draw_rectangle_colour(0, __halfh, __w, __h, __col1, __col1, __col2, __col2, false);
		} break;
	}
	
	surface_reset_target();
	
	var __sprid = sprite_create_from_surface(__CompTempSurf, 0, 0, __w, __h, false, false, 0, 0);
	surface_free(__CompTempSurf);
	return __sprid;
}
else
{
	return -1;
}
