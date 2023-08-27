/// @description  Movement

//room_speed = 2;
y += intVSpeed;

repeat(abs(intVSpeed)) {
  if (place_meeting(x, y + sign(intVSpeed), obj_block) || place_meeting(x, y + sign(intVSpeed), obj_bump)) {
    intVSpeed *= -1;
    break;
  }
}

if (place_meeting(x, y - 1, obj_player) && !place_meeting(x, y, obj_player)) {
  with (obj_player) {
    intVSpeed = other.intVSpeed;
  }
}

if (place_meeting(x, y - 2, obj_player) && !place_meeting(x, y, obj_player)) {
  with (obj_player) {
    if (y < other.y) y++;
    intVSpeed = other.intVSpeed;
  }
}


if (place_meeting(x, y - 3, obj_player) && !place_meeting(x, y, obj_player)) {
  with (obj_player) {
    if (y < other.y) y += 2;
    intVSpeed = other.intVSpeed;
  }
}






