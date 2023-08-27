/// @description  Falling down

if ((bolFall = false)) {
  intVSpeed = 0;
} 
else {
  // Enable player's themporal jumping
  with(obj_player) {
    if(other.y - y < 2) {
      if(intVSpeed >= 0 ) {
        if(!bolTempJump) {
          bolTempJump = true;
          alarm[2] = room_speed * 0.5;   
        }
      }
    }
  }
  
  intVSpeed += scr_approach(intVSpeed, intMaxVSpeed, intGravity) * 0.2;
}

y += intVSpeed / 3;

if (y > room_height + 10) and(bolFall) {
  bolFall = false;
  alarm[1] = intTimer * 10;
}


/// Animation

if (!bolFalling) {
  sprite_index = spr_platformF;
} else {
  sprite_index = spr_platformF2;
}


