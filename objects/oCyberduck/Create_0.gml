//position
grav=1;
xAcc=0;
mxSp=5;
xSp=.05;
baseAcc=.05;
ySp=0;
yMin=global.room_yMin-45;//-45 cause where the origin of the sprite is
startDec=oCart.sprite_width/2-30-mxSp*mxSp/(2*baseAcc)//position of when to start deceleration to hit 0 at edge of cart

//agro
range=150;//activate agro range in px
outofRange=300;//deactive agro range in px
seen = false;//boolean storing whether agro or no
countdown=0;//laser fire rate counter

//fighting
myHealth=1;
airborne=false;
tempInvincibility=0;