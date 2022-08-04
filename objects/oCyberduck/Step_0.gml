grav=1;

//duck faces direction it is walking
image_xscale=sign(-xSp);
if(image_xscale==0){image_xscale=1;}

#region//normal movement
	xMin=max((xstart-750)*(oPlayer.xMax<xstart),30);
	xMax=max(xstart+750,oPlayer.xMax*(oPlayer.xMax>xstart));
	if(airborne){xAcc=0;}
	else if(x==xMin || (!seen && abs(x-xstart)>750) || x==xMax){
		xAcc = sign(xstart-x);
		mxSp=random(2)+2;
	}
	x=clamp(x+xSp,xMin,xMax);
	xSp=clamp(xSp+xAcc,-mxSp,mxSp);
	y=clamp(y+ySp,17,yMin);
	airborne = y<yMin;
	ySp+=grav*airborne;
#endregion

#region//agro - moves faster and chases player
	if(abs(x - oPlayer.x) < range && sign(oPlayer.x-x)==sign(xSp)){
		seen = true;
		image_index = 1;
	}
	if (abs(oPlayer.x - x) > outofRange){
		seen = false;
		image_index = 0;
	}
	if(seen && !airborne){
		xSp = sign(floor((oPlayer.x-x)/3))*3;
	}
#endregion

if(place_meeting(x,y,oPlayer)&&!oWatcher.debugging){//deal damage when in contact with player
	oPlayer.myHealth-=.1;
}

if(myHealth<=0){
	instance_destroy();
}