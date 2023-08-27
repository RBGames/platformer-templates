/// @description Returns the unique id for the given tile index.
/// @param index The index of the tile.
/// @returns {number} total number of tiles in room

var __index = argument0;

var __currtile = 0;

// Scan through all layers looking for the specified tile (slow!)
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
			if (__currtile == __index)
			{
				return __els[__j];
			}
			
			__currtile++;
		}
	}	
}

return -1;