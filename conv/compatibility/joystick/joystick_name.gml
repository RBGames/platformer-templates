/// @description Returns the name of the joystick.
/// @param id	the id of the joystick (1 or 2)

var jid=__joystick_2_gamepad(argument0);
return gamepad_get_description(jid);