/// @description Returns the total number of tiles in a room.
/// @returns {number} total number of tiles in room

var __totaltiles = 0;

// Scan for a layer with the correct depth
var __layers = layer_get_all();
var __numlayers = array_length_1d(__layers);

var __i;
for(__i = 0; __i < __numlayers; __i++)
{
	var __els = layer_get_all_elements(__layers[__i]);
	var __numels = array_length_1d(__els);
	
	var __j;
	for(__j = 0; __j < __numels; __j++)
	{
		var __eltype = layer_get_element_type(__els[__j]);
		if (__eltype == layerelementtype_tile)
		{
			__totaltiles++;
		}
	}	
}

return __totaltiles;