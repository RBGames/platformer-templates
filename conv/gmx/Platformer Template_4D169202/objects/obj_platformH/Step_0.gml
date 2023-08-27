/// @description  Movement

x += intHSpeed;

repeat(abs(intHSpeed)) {
  if (
    place_meeting(x + sign(intHSpeed), y, obj_block) ||
    place_meeting(x + sign(intHSpeed), y, obj_bump)
  ) {
    intHSpeed *= -1;
    break;
  }
}

