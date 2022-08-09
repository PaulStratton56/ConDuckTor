//position
xAcc=0;
mxSp=5;
xSp=.05;
baseAcc=.05;
ySp=0;
yMin=global.room_yMin-45;//-45 cause where the origin of the sprite is
playerDifference=oPlayer.x-x;
startDec=oCart.sprite_width/2-30-mxSp*mxSp/(2*baseAcc)

//agro
range=150;
outofRange=300;
seen = false;

//fighting
myHealth=1;
airborne=false;
tempInvincibility=0;
