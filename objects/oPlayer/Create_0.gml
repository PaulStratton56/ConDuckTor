#region//initial position variable data
	xAcc = 0;
	xSp = 0;
	ySp = 0;
	xDec = 0.8;
	yMin=690;
	room_yMin=690;
	baseAcc = 3;
	grav = 1;
	jumpSp = -15;
	mxSp = 20;
#endregion

//fighting
myHealth=10;
currentWeapon=oSword;

//time delay before sword swing
tooEarly=false;
fineNow = function(){
		tooEarly=false;
}
swingDelay = time_source_create(time_source_game,.5,time_source_units_seconds,fineNow)
