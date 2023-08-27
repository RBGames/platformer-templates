/// @description  Variables that need to change

/// Keyboard variables
keyleft = -keyboard_check(vk_left);
keyright = keyboard_check(vk_right);
keyjump = keyboard_check_pressed(ord("X")); //keyboard_check(ord("X"));
keyjumprelease = keyboard_check_released(ord("X"));
keydown = keyboard_check(vk_down);
keyjumppressed = keyboard_check_pressed(ord("X"));
KeyAction = keyboard_check(ord("Z"));

// Collision
bolGround = scr_ground();
intColLeft = place_meeting(x - 1, y, obj_block);
intColRight = place_meeting(x + 1, y, obj_block);
bolAir = !place_meeting(x, y, obj_block);
justPlatform = bolGround && !place_meeting(x, y + 1, obj_block);
bolSurface = scr_water();

// Instance collision
insMovingHPlatform = instance_place(x, y + 1, obj_platformH);
insMovingVPlatform = instance_place(x, y + 3, obj_platformV);
insFallingPlatform = instance_place(x, y + 1, obj_platformF);
currentFallingPlatform = noone; 

// Don't allow more than one Temporal Jumping
if (intVSpeed < 0 ){
   bolTempJump = false;
}

/// Behavior

/// Acceleration and Friction

// On land
if (!bolSurface) {
  if (!bolGround) {
    intTempAcc = intAirAcc;
    intTempFric = intAirFric;
  } else {
    intTempAcc = intGroundAcc;
    intTempFric = intGroundFric;
  }
}

// Inside water
else {
  if (!bolGround) {
    intTempAcc = intWaterAcc;
    intTempFric = intWaterFric;
  } else {
    intTempAcc = intGroundAccW;
    intTempFric = intGroundFricW;
  }
}

/// Horizontal Speed

intMove = keyleft + keyright;
if (!bolSurface) {
  if (intMove != 0) {
    intHSpeed = scr_approach(intHSpeed, intMaxHSpeed * intMove, intTempAcc);
  } else {
    intHSpeed = scr_approach(intHSpeed, intMaxHSpeed * intMove, intTempFric);
  }
} else {
    if (intMove != 0) {
      intHSpeed = scr_approach(intHSpeed, intMaxHSpeedWater * intMove, intTempAcc);
    } else {
      intHSpeed = scr_approach(intHSpeed, intMaxHSpeedWater * intMove, intTempFric);
    }
}

// Speed over the horizontal moving platform
if (
  instance_place(x, y + 1, obj_platformH) &&
  !instance_place(x, y, obj_platformH) &&
  bolAir &&
  justPlatform &&
  !intColLeft &&
  !intColRight
) {
  x += insMovingHPlatform.intHSpeed;
}

/// Vertical speed

// Ground
if (!bolSurface) {
  if (!bolGround) {
    if ((intColLeft || intColRight) && intVSpeed >= 0) {
      intVSpeed = scr_approach(intVSpeed, intMaxVSpeed, intGravitySlide); // Free fall while touching a wall
    } else {
      intVSpeed = scr_approach(intVSpeed, intMaxVSpeed, intGravityNorm); // Free fall
    }
  } else {
    if (intDJump == 0) {
      intDJump++;
    }
  }
}

// Water
else {
  if (!bolGround) {
    if ((intColLeft || intColRight) && intVSpeed >= 0) {
      intVSpeed = scr_approach(intVSpeed, intMaxVSpeed, intGravitySlide); // Free fall while touching a wall
    }
    intVSpeed = scr_approach(intVSpeed, intMaxVSpeedWater, intGravityNormW); // Free fall
  } else {
    if (intDJump == 0) {
      intDJump++;
    }
  }
}

// Falling down of a platform

if (justPlatform) {
  if (keydown && place_meeting(x, y + 1, obj_platform)) {
    y++;
  }

  if (keydown && place_meeting(x, y + 1, obj_platformH)) {
    y++;
  }

  if (keydown && place_meeting(x, y + 1, obj_platformV)) {
    y += 2;
  }
}

/// Jumping

  // Re-Enabling the Double Jump
if (bolGround) {
  intDJump = 1;
}
  
  // On land
if (!bolSurface) {
  // Single Jump
  if ( (keyjump) && ((bolGround) || (bolTempJump)) ) {
    intVSpeed = -intMaxVSpeed;
    bolTempJump = false;
  }
  // Double Jump
  if ( (keyjump) &&  (intDJump > 0) && (!bolGround)){
    intVSpeed = -intMaxVSpeed * 0.6;
    bolTempJump = false;
    intDJump--;
  }
  
  // On water
} else {
  if (keyjump) intVSpeed = -intMaxVSpeedWater;
}
// Variable Jumping
if (keyjumprelease) {
  if (intVSpeed < 0) {
    if (insMovingVPlatform == noone) intVSpeed = 0.5;
  }
}

/// Wall Jump
if (!bolSurface && wallJumpEnabled) {
  // Left Wall
  if (intColLeft && !bolGround && (keyjumppressed) && bolLeftWallJump) {
    if (intMove < 0) {
      intHSpeed = intMaxHSpeed * 0.5;
      intVSpeed = -intJumpHeight * 1.1;
    } else {
      intHSpeed = intMaxHSpeed;
      intVSpeed = -intJumpHeight * 0.6;
    }
    bolLeftWallJump = false;
    bolRightWallJump = true;
  }

  // Right Wall
  if (intColRight && !bolGround && keyjumppressed && bolRightWallJump) {
    if (intMove > 0) {
      intHSpeed = -intMaxHSpeed * 0.5;
      intVSpeed = -intJumpHeight * 1.1;
    } else {
      intHSpeed = -intMaxHSpeed;
      intVSpeed = -intJumpHeight * 0.6;
    }
    bolRightWallJump = false;
    bolLeftWallJump = true;
  }
}

 // Resetting wall jumps on landing
if(bolGround) {
  bolRightWallJump = true;
  bolLeftWallJump = true;
}

// Horizontal Collision
repeat(abs(intHSpeed)) {
  // Slope up
  if (
    place_meeting(x + sign(intHSpeed), y, obj_block) &&
    !place_meeting(x + sign(intHSpeed), y - 1, obj_block)
  ) {
    y--;
  }
  // Slope down
  if (
    !place_meeting(x + sign(intHSpeed), y, obj_block) &&
    !place_meeting(x + sign(intHSpeed), y + 1, obj_block) &&
    place_meeting(x + sign(intHSpeed), y + 2, obj_block)
  ) {
    y++;
  }
  if (!place_meeting(x + sign(intHSpeed), y, obj_block)) {
    x += sign(intHSpeed);
  } else {
    intHSpeed = 0;
    break;
  }
  
}

// Vertical Collision
repeat(abs(intVSpeed)) {

  if (place_meeting(x, y + sign(intVSpeed), obj_block)) {
    intVSpeed = 0;
    break;
  }

  /// Platforms collision

  // one-way platform
  else if (
    place_meeting(x, y + sign(intVSpeed), obj_platform) &&
    !place_meeting(x, y, obj_platform) &&
    intVSpeed >= 0
  ) {
    intVSpeed = 0;
    break;
  }

  // Horizontal moving platform
  else if (
    place_meeting(x, y + sign(intVSpeed), obj_platformH) &&
    !place_meeting(x, y, obj_platformH) &&
    intVSpeed >= 0
  ) {
    intVSpeed = 0;
    break;
  }

  // Vertical moving platform
  else if (
    place_meeting(x, y + sign(intVSpeed) + 1, obj_platformV) &&
    !place_meeting(x, y, obj_platformV) &&
    intVSpeed >= 0
  ) {
    
    intVSpeed = instance_place(x, y + sign(intVSpeed) + 1, obj_platformV)
      .intVSpeed;
      
    break;
  }
  
  // Falling Platform
  else if (
    place_meeting(x, y + sign(intVSpeed), obj_platformF) &&
    !place_meeting(x, y, obj_platformF) &&
    intVSpeed >= 0
  ) {
    intVSpeed = 0;
    break;
  }
  
   // No Platform
    else {
   y += sign(intVSpeed);   
  }
  
}

// Falling platform fall apart

if (
  intVSpeed == 0 &&
  insFallingPlatform != noone &&
  !instance_place(x, y, obj_platformF)
)
  currentFallingPlatform = insFallingPlatform;
{
  with (currentFallingPlatform) {
    if (!bolFalling && (obj_player.y = y)) {
      bolFalling = true;
      alarm[0] = intTimer;
    }
  }
}



/// Interact with the room's borders (the sprite must be centered at x)

// Right Border
if (x <= 0 + sprite_width / 2) {
  intMove = 0;
  intHSpeed = 0;
  x = 0 + sprite_width / 2;
}

// Right Border
if (x >= room_width - sprite_width / 2) {
  intMove = 0;
  intHSpeed = 0;
  x = room_width - sprite_width / 2;
}


/// Animation

if (intColLeft && bolLeftWallJump) && (!bolSurface) {
  sprite_index = spr_player_wall;
  image_xscale = 1;
  image_speed = 0.3 * room_speed;
}

if (intColRight && bolRightWallJump) && (!bolSurface) {
  sprite_index = spr_player_wall;
  image_xscale = -1;
  image_speed = 0.3 * room_speed;
}

if (bolTempJump) {
  sprite_index = spr_player_temp_jump;
  image_xscale = 1;
  image_speed = 1 * room_speed;
}

if (bolGround) || (!intColLeft && !intColRight && !bolTempJump) || (bolSurface){
  sprite_index = spr_player;
  image_xscale = 1;
  image_speed = 1 * room_speed;
}


