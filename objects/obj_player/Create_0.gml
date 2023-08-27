/// @description  Variables

// General
intHSpeed = 0;
intVSpeed = 0;
intMove = 0; 
intMultiplier = 2.0;

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

// Land Movement
intMaxHSpeed = 7 * intMultiplier;
intMaxVSpeed = 10 * intMultiplier;
intJumpHeight = 12 * intMultiplier;
intGravityNorm = 0.5 * intMultiplier;
intGravitySlide = 0.15 * intMultiplier;
intGroundAcc = 1.0 * intMultiplier;
intGroundFric = 1.2 * intMultiplier;
intAirAcc = 0.75 * intMultiplier;
intAirFric = 0.09 * intMultiplier;

// Water Movement
intMaxHSpeedWater = 2.5 * intMultiplier;
intMaxVSpeedWater = 4.0 * intMultiplier;
intJumpHeightW = 8 * intMultiplier;
intGravityNormW = 0.2 * intMultiplier;
intGroundAccW = 0.6 * intMultiplier;
intGroundFricW = 2.1 * intMultiplier;
intWaterAcc = 0.40 * intMultiplier;
intWaterFric = 0.2 * intMultiplier;

// Jumping
bolTempJump = false;
wallJumpEnabled = true;
bolRightWallJump = true;
bolLeftWallJump = true;
intDJump = 1;

