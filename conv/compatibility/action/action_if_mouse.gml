/// @description (Old DnD) - if mouse evauation
/// @param button	button to check
var ret = mouse_button_down(argument0) || mouse_button_released(argument0);
switch( argument0 )
{
	case 1:	
	case 2:	
	case 3:
		ret = mouse_button_down(argument0) || mouse_button_released(argument0);
		break;
	default:
		ret = (mouse_button == 0);
		break;	
} // end switch
return ret;