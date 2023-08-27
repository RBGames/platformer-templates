/// @description  scr ground. This script checks for the collision with the ground or any platform

if (place_meeting(x, y + 1, obj_block)) return 1;

// One-way platform
if (place_meeting(x, y + 1, obj_platform)) && (!place_meeting(x, y, obj_platform)) {
    if (intVSpeed >= 0) return 1;
}

// Horizontal moving platform
if (place_meeting(x, y + 1, obj_platformH)) && (!place_meeting(x, y, obj_platformH)) {
    if (intVSpeed >= 0) return 1;
}

// Vertial moving platform
if (place_meeting(x, y + 1, obj_platformV)) && (!place_meeting(x, y, obj_platformV)) return 1;

// Falling platform

if (place_meeting(x, y + 1, obj_platformF)) && (!place_meeting(x, y, obj_platformF)) {
    if (intVSpeed >= 0) return 1;
}
