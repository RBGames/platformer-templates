/// @description  Saves the model to the indicated file name.
/// @param ind The index of the model to be saved.
/// @param fname The name of the file to save the model to.

var __ind = argument0;
var __fname = argument1;

var __file = file_text_open_write(__fname);
if (__file == -1)
	return -1;
	
var __vertexsize = 36;		// combined size of position, normal, colour and uv
	
// Count up the number of 'things' we have in the model
var __numthings = 0;
var __numpointverts = 0;
var __numlineverts = 0;
var __numtriverts = 0;

if (__ind[e__YYM.PointB] != undefined)
{
	var __buffpos = buffer_tell(__ind[e__YYM.PointB]);
	if (__buffpos > 0)
	{
		__numthings += 2;		// include primitive begin\end
	}
	
	// Now add the number of vertices
	__numpointverts = __buffpos / __vertexsize;
	__numthings += __numpointverts;
}

if (__ind[e__YYM.LineB] != undefined)
{
	var __buffpos = buffer_tell(__ind[e__YYM.LineB]);
	if (__buffpos > 0)
	{
		__numthings += 2;		// include primitive begin\end
	}
	
	// Now add the number of vertices
	__numlineverts = __buffpos / __vertexsize;
	__numthings += __numlineverts;
}

if (__ind[e__YYM.TriB] != undefined)
{
	var __buffpos = buffer_tell(__ind[e__YYM.TriB]);
	if (__buffpos > 0)
	{
		__numthings += 2;		// include primitive begin\end
	}
	
	// Now add the number of vertices
	__numtriverts = __buffpos / __vertexsize;
	__numthings += __numtriverts;
}

file_text_write_string(__file, "100");
file_text_writeln(__file);
file_text_write_string(__file, string_format(__numthings, 0, 0));
file_text_writeln(__file);

if (__ind[e__YYM.PointB] != undefined)
{	
	var __buf = __ind[e__YYM.PointB];
	if (__numpointverts > 0)
	{
		// Primitive begin (pointlist)
		file_text_write_string(__file, "0 " + string_format(pr_pointlist, 10, 4) + " 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000");
		file_text_writeln(__file);
		
		// Vertices		
		buffer_seek(__buf, buffer_seek_start, 0);		// after reading through the whole buffer we should end up back at the end
		var __i;
		for(__i = 0; __i < __numpointverts; __i++)
		{			
			var __x = buffer_read(__buf, buffer_f32);
			var __y = buffer_read(__buf, buffer_f32);
			var __z = buffer_read(__buf, buffer_f32);
			var __nx = buffer_read(__buf, buffer_f32);
			var __ny = buffer_read(__buf, buffer_f32);
			var __nz = buffer_read(__buf, buffer_f32);
			var __colalpha = buffer_read(__buf, buffer_u32);
			var __u = buffer_read(__buf, buffer_f32);
			var __v = buffer_read(__buf, buffer_f32);
			
			// Need to separate colour and alpha
			var __col = __colalpha & $00ffffff;
			var __alpha = ((__colalpha >> 24) & $ff) / 255.0;
			
			file_text_write_string(__file, "9"
									+ " " + string_format(__x, 10, 4)
									+ " " + string_format(__y, 10, 4)
									+ " " + string_format(__z, 10, 4)
									+ " " + string_format(__nx, 10, 4)
									+ " " + string_format(__ny, 10, 4)
									+ " " + string_format(__nz, 10, 4)
									+ " " + string_format(__u, 10, 4)
									+ " " + string_format(__v, 10, 4)
									+ " " + string_format(__col, 10, 4)
									+ " " + string_format(__alpha, 10, 4)
									);
			file_text_writeln(__file);
		}
		
		// Primitive end
		file_text_write_string(__file, "1 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000");
		file_text_writeln(__file);
	}
}

if (__ind[e__YYM.LineB] != undefined)
{	
	var __buf = __ind[e__YYM.LineB];
	if (__numlineverts > 0)
	{
		// Primitive begin (pointlist)
		file_text_write_string(__file, "0 " + string_format(pr_linelist, 10, 4) + " 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000");
		file_text_writeln(__file);
		
		// Vertices		
		buffer_seek(__buf, buffer_seek_start, 0);		// after reading through the whole buffer we should end up back at the end
		var __i;
		for(__i = 0; __i < __numlineverts; __i++)
		{			
			var __x = buffer_read(__buf, buffer_f32);
			var __y = buffer_read(__buf, buffer_f32);
			var __z = buffer_read(__buf, buffer_f32);
			var __nx = buffer_read(__buf, buffer_f32);
			var __ny = buffer_read(__buf, buffer_f32);
			var __nz = buffer_read(__buf, buffer_f32);
			var __colalpha = buffer_read(__buf, buffer_u32);
			var __u = buffer_read(__buf, buffer_f32);
			var __v = buffer_read(__buf, buffer_f32);
			
			// Need to separate colour and alpha
			var __col = __colalpha & $00ffffff;
			var __alpha = ((__colalpha >> 24) & $ff) / 255.0;
			
			file_text_write_string(__file, "9"
									+ " " + string_format(__x, 10, 4)
									+ " " + string_format(__y, 10, 4)
									+ " " + string_format(__z, 10, 4)
									+ " " + string_format(__nx, 10, 4)
									+ " " + string_format(__ny, 10, 4)
									+ " " + string_format(__nz, 10, 4)
									+ " " + string_format(__u, 10, 4)
									+ " " + string_format(__v, 10, 4)
									+ " " + string_format(__col, 10, 4)
									+ " " + string_format(__alpha, 10, 4)
									);
			file_text_writeln(__file);
		}
		
		// Primitive end
		file_text_write_string(__file, "1 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000");
		file_text_writeln(__file);
	}
}

if (__ind[e__YYM.TriB] != undefined)
{	
	var __buf = __ind[e__YYM.TriB];
	if (__numtriverts > 0)
	{
		// Primitive begin (pointlist)
		file_text_write_string(__file, "0 " + string_format(pr_trianglelist, 10, 4) + " 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000");
		file_text_writeln(__file);
		
		// Vertices		
		buffer_seek(__buf, buffer_seek_start, 0);		// after reading through the whole buffer we should end up back at the end
		var __i;
		for(__i = 0; __i < __numtriverts; __i++)
		{			
			var __x = buffer_read(__buf, buffer_f32);
			var __y = buffer_read(__buf, buffer_f32);
			var __z = buffer_read(__buf, buffer_f32);
			var __nx = buffer_read(__buf, buffer_f32);
			var __ny = buffer_read(__buf, buffer_f32);
			var __nz = buffer_read(__buf, buffer_f32);
			var __colalpha = buffer_read(__buf, buffer_u32);
			var __u = buffer_read(__buf, buffer_f32);
			var __v = buffer_read(__buf, buffer_f32);
			
			// Need to separate colour and alpha
			var __col = __colalpha & $00ffffff;
			var __alpha = ((__colalpha >> 24) & $ff) / 255.0;
			
			file_text_write_string(__file, "9"
									+ " " + string_format(__x, 10, 4)
									+ " " + string_format(__y, 10, 4)
									+ " " + string_format(__z, 10, 4)
									+ " " + string_format(__nx, 10, 4)
									+ " " + string_format(__ny, 10, 4)
									+ " " + string_format(__nz, 10, 4)
									+ " " + string_format(__u, 10, 4)
									+ " " + string_format(__v, 10, 4)
									+ " " + string_format(__col, 10, 4)
									+ " " + string_format(__alpha, 10, 4)
									);
			file_text_writeln(__file);
		}
		
		// Primitive end
		file_text_write_string(__file, "1 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000 0000000000.0000");
		file_text_writeln(__file);
	}
}
	
file_text_close(__file);