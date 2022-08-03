grav=1;

//duck faces direction it is walking
image_xscale=sign(-xSp);
if(image_xscale==0){image_xscale=1;}

yMin=oPlayer.room_yMin-45;//min for duck is room_yMin, which is known by player, -45 cause where the origin of the sprite is

#region//agro - moves faster and chases player
	if(abs(x - oPlayer.x) < range && sign(oPlayer.x-x)==sign(xSp)){
		seen = true;
		image_index = 1;
	}
	if (abs(oPlayer.x - x) > outofRange){
		seen = false;
		image_index = 0;
	}
	if(seen && !knockedback){
		xSp = sign(floor((oPlayer.x-x)/3))*3;
	}
#endregion

#region//normal movement
	if(knockedback || seen){
		xAcc=0;
	}
	else if(!seen && abs(x-xstart)>128 || x==30 || x==room_width-30){
		xAcc = sign(xstart-x);
		mxSp=random(2)+2;
	}
	x=clamp(x+xSp,30,room_width-30);
	xSp=clamp(xSp+xAcc,-mxSp,mxSp);
	y=clamp(y+ySp,17,yMin);
	ySp+=grav;
	if(y>=yMin){
		ySp=0;
		knockedback=false;
	}
	
#endregion

if(place_meeting(x,y,oPlayer)&&!oWatcher.debugging){//deal damage when in contact with player
	oPlayer.myHealth-=.1;
}

if(myHealth<=0){
	instance_destroy();
}