/// @description Moves all tiles at a given depth to a new depth.
/// @param depth The current depth of the tile layer.
/// @param newdepth The depth to change the layer to.
/// @returns 

var __depth = argument0;
var __newdepth = argument1;

// Scan for a layer with the depth
var __layers = layer_get_all();
var __numlayers = array_length_1d(__layers);
var __layerstomove;
__layerstomove[0] = -1;
var __numlayerstomove = 0;

var __layertouse = -1;
var __i;
for(__i = 0; __i < __numlayers; __i++)
{
	var __layerdepth = layer_get_depth(__layers[__i]);
	
	if (__layerdepth == __depth)
	{
		__layerstomove[__numlayerstomove] = __layers[__i];
		__numlayerstomove++;
	}	
	else if (layer_get_depth(__layers[__i]) == __newdepth)
	{
		// Don't bother checking names - we'll just add tiles to whatever layer is handy
		__layertouse = __layers[__i];
		break;		
	}
}

if (__layertouse == -1)
{
	// didn't find a layer of the correct depth, so create one
	__layertouse = layer_create(__newdepth);
}

// Now go through again and move all those tiles of the original depth to the new layer
// (should we delete layers that become empty?)
for(__i = 0; __i < __numlayerstomove; __i++)
{
	var __els = layer_get_all_elements(__layerstomove[__i]);
	var __numels = array_length_1d(__els);
	
	var __j;
	for(__j = 0; __j < __numels; __j++)
	{
		if (layer_get_element_type(__els[__j]) == layerelementtype_tile)
		{
			layer_element_move(__els[__j], __layertouse);
		}
	}
}