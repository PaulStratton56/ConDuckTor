grav=1;

//duck faces direction it is walking
image_xscale=sign(-xSp);
if(image_xscale==0){image_xscale=1;}

playerDifference=oPlayer.x-x;

#region//agro - moves faster and chases player
	if(abs(playerDifference) < range && sign(playerDifference)==sign(xSp) && oPlayer.x>xMin && oPlayer.x<xMax){
		seen = true;
		image_index = 1;
	}
	if (abs(playerDifference) > outofRange){
		seen = false;
		image_index = 0;
	}
#endregion

#region// movement
	y=clamp(y+ySp,17,yMin);
	airborne = y<yMin;
	ySp+=grav*airborne;//only add gravity if airborne
	
	xMin=max((xstart-oCart.sprite_width/2)*(oPlayer.xMax<xstart),30);//max and min based on keys collected
	xMax=max(xstart+oCart.sprite_width/2,oPlayer.xMax*(oPlayer.xMax>xstart));
	x=clamp(x+xSp,xMin,xMax);
	xSp+=xAcc;
	if(abs(xSp)<baseAcc){//adjust max speed and where to start decelerating to switch directions
		mxSp=random(3)+3;
		startDec=oCart.sprite_width/2-30-mxSp*mxSp/(2*baseAcc);
	}
	if(airborne){xAcc=0;}//currently no air resistance
	else{
		if(abs(x-xstart)>startDec){xAcc=baseAcc*sign(xstart-x);}//"patrol" go back and forth along starting cart
		else{xAcc=(!seen)*baseAcc*sign(xSp)*(mxSp-abs(xSp));}//accelerate to max speed, decelerate if too fast
		if(seen){xSp = round(sqrt(abs(playerDifference)/8))*sign(playerDifference);}//if see player go faster then decelerate on approach
		if((x>=xMax || x<=xMin) && sign(xSp)!=sign(xstart-x)){xSp*=-.5;}//if hit a wall for some reason, bounce back and cut speed in half
	}
#endregion

if(place_meeting(x,y,oPlayer)&&!oWatcher.debugging){//deal damage when in contact with player
	oPlayer.myHealth-=.1;
}
tempInvincibility--;
if(myHealth<=0){
	instance_destroy();
}