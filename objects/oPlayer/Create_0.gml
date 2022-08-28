//initial positional data
xAcc = 0;
xSp = 0;
ySp = 0;
yMin=690;
baseAcc = 1;
groundFriction=.25;
grav = 1;
jumpSp = -15;
mxSp = 10;
ground = global.room_yMin-abs(sprite_height/2);

//fighting
myHealth=10;
currentWeapon=oSword;
delay=0;

//keys
keysCollected=0;