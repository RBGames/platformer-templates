/// @description Sets a tile's depth.
/// @param index The index of the tile to set.
/// @param depth The depth of the tile.
/// @returns

var __index = argument0;
var __depth = argument1;

// Should really check if the element ID points to a tile (and not a different sort of element)
var __layerid = layer_get_element_layer(__index);
if (__layerid == -1)
	return -1;	// not found
	
var __currdepth = layer_get_depth(__layerid);
if (__currdepth == __depth)
	return -1;	// depth already correct
	
// Scan for a layer with the correct depth
var __layers = layer_get_all();
var __numlayers = array_length_1d(__layers);

var __layertouse = -1;
var __i;
for(__i = 0; __i < __numlayers; __i++)
{
	if (layer_get_depth(__layers[__i]) == __depth)
	{
		// Don't bother checking names - we'll just add tiles to whatever layer is handy
		__layertouse = __layers[__i];
		break;		
	}
}

if (__layertouse == -1)
{
	// didn't find a layer of the correct depth, so create one
	__layertouse = layer_create(__depth);
}

// Now move the tile from it's old layer to the new one
layer_element_move(__index, __layertouse);

return layer_get_depth(__layerid);
