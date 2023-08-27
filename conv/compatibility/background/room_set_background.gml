/// @description Sets a background and its related attributes of a given room.
/// @param ind The index of the room to set the background of.
/// @param bind The index of the background 'slot' to set (between 0 and 7).
/// @param vis Whether the new background is visible (true) or not (false).
/// @param fore Whether the background is actually a foreground (true) or a background (false).
/// @param back The index of the new background.
/// @param x The x position of the background (if htiled is true, the x of one of the backgrounds).
/// @param y The y position of the background (if vtiled is true, the y of one of the backgrounds).
/// @param htiled Whether the background is tiled horizontally (true) or not (false).
/// @param vtiled Whether the background is tiled vertically (true) or not (false).
/// @param hspeed The horizontal speed of the background in pixels per step.
/// @param vspeed The vertical speed of the background in pixels per step.
/// @param alpha The alpha (transparency) of the background. 1=opaque, 0=invisible, 0.5=translucent etc
/// @returns 

// NOTE: this script will only work properly if you're using the standard depth range (-16000 to 16000)

var __ind = argument0;
var __bind = argument1;
var __vis = argument2;
var __fore = argument3;
var __back = argument4;
var __x = argument5;
var __y = argument6;
var __htiled = argument7;
var __vtiled = argument8;
var __hspeed = argument9;
var __vspeed = argument10;
var __alpha = argument11;

// First check to see if the target room actually exists
if (room_exists(__ind) == false)
{
	return -1;
}

// Save the current target room and switch to the new one
var __currroom = layer_get_target_room();
layer_set_target_room(__ind);

__background_set_element(__bind, __vis, __fore, __back, __x, __y, __htiled, __vtiled, 1,1,false, __hspeed, __vspeed, $ffffff, __alpha);

// Finally, restore our original room target
layer_set_target_room(__currroom);