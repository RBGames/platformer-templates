/// scr suelo 

//  plataforma unidireccional
if (place_meeting(x,y + 1,obj_block)) return 1;

/*

else if (place_meeting(x,y +1, obj_platform)) and (!place_meeting(x,y,obj_platform))
{

if (intVY >= 0) return 1;

}
   //plataforma de movimiento horizontal
else if (place_meeting(x,y+1, obj_movilH)) and (!place_meeting(x,y,obj_movilH))

{

if (intVY >=0) return 1;

}
   

// plataforma que se cae

else if (place_meeting(x,y+1, obj_movilF)) and (!place_meeting(x,y,obj_movilF))

{

if (intVY >=0) return 1;

   // plataforma de movimento vertical
else if (place_meeting (x,y+1,obj_movilV)) and (!place_meeting(x,y,obj_movilV)) return 1;}
