/// @description Clears all tiles from a given room.
/// @param ind The index of the room to clear all tiles from.
/// @returns 

var __ind = argument0;

// First check to see if the target room actually exists
if (room_exists(__ind) == false)
{
	return -1;
}

// Save the current target room and switch to the new one
var __currroom = layer_get_target_room();
layer_set_target_room(__ind);

// Scan all layers for tile elements and destroy any that we find
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
			layer_tile_destroy(__els[__j]);
		}
	}	
}


// Finally, restore our original room target
layer_set_target_room(__currroom);