/// @description Adds a new tile to a given room and sets its properties.
/// @param ind The index of the room to set the background of.
/// @param back The background from which the tile is taken.
/// @param left The x coordinate of the left side of the tile relative to the background.
/// @param top The y coordinate of the top side of the tile relative to the background.
/// @param width The width of the tile.
/// @param height The height of the tile.
/// @param x The x coordinate of where to place the tile. 
/// @param y The y coordinate of where to place the tile.
/// @param depth The depth of the tile in the room.
/// @param xscale The horizontal scale of the tile. 1=normal size, 0.5=half, 2=double, etc.
/// @param yscale The vertical scale of the tile. 1=normal size, 0.5=half, 2=double, etc.
/// @param alpha The alpha (transparency) of the tile. 0=invisible, 1=opaque, 0.5=translucent etc.
/// @returns {number} resource name for the new tile

var __ind = argument0;
var __back = argument1;
var __left = argument2;
var __top = argument3;
var __width = argument4;
var __height = argument5;
var __x = argument6;
var __y = argument7;
var __depth = argument8;
var __xscale = argument9;
var __yscale = argument10;
var __alpha = argument11;

// First check to see if the target room actually exists
if (room_exists(__ind) == false)
{
	return -1;
}

// Save the current target room and switch to the new one
var __currroom = layer_get_target_room();
layer_set_target_room(__ind);

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

// Now create a new tile element and add it to the layer
var __tile = layer_tile_create(__layertouse, __x, __y, __back, __left, __top, __width, __height);
layer_tile_xscale(__tile, __xscale);
layer_tile_yscale(__tile, __yscale);
layer_tile_alpha(__tile, __alpha);

// Finally, restore our original room target
layer_set_target_room(__currroom);

return __tile;