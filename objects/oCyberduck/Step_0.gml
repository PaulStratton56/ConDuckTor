playerDifference=oPlayer.x-x;

//duck faces direction it's walking
image_xscale=sign(-xSp);
if(image_xscale==0){image_xscale=1;}

#region//agro - moves faster and chases player
	if(abs(playerDifference) < range && sign(playerDifference)==sign(xSp) && oPlayer.x>xMin && oPlayer.x<xMax){
		//if close and facing player and not in another train car
		seen = true;
		image_index = 1;//red eyes
	}
	else if(abs(playerDifference) > outofRange){
		seen = false;
		image_index = 0;//normal eyes
	}
	countdown--;//laser countdown
	if(seen && countdown<0){//fire laser
		with instance_create_layer(x,y-10,"Weapons",oLaser){//create laser object with following initial conditions
			speed=10;
			direction=point_direction(x,y,oPlayer.x,oPlayer.y);
			image_angle=direction;
		}
		countdown=60;//reset laser fire rate in frames
	}
#endregion

#region// positional data
	y=clamp(y+ySp,17,yMin);
	airborne = y<yMin;
	ySp+=grav*airborne;//only add gravity if airborne
	
	//max and min based on keys collected
	xMin=max((xstart-oCart.sprite_width/2)*(oPlayer.xMax<xstart),30);
	xMax=max(xstart+oCart.sprite_width/2,oPlayer.xMax*(oPlayer.xMax>xstart));
	
	x=clamp(x+xSp,xMin,xMax);//update position and speed
	xSp+=xAcc;//speed not clamped intentionally
	if(abs(xSp)<baseAcc){//if speed will be 0 or switch signs within 1 frame
		//adjust max speed and where to start decelerating to switch directions
		mxSp=random(3)+3;
		startDec=oCart.sprite_width/2-30-mxSp*mxSp/(2*baseAcc);
	}
	if(airborne){xAcc=0;}//currently no air resistance
	else{//"patrol" go back and forth along starting cart
		if(abs(x-xstart)>startDec){xAcc=baseAcc*sign(xstart-x);}//start decelerating
		else{xAcc=(!seen)*baseAcc*sign(xSp)*(mxSp-abs(xSp));}//accelerate to max speed, decelerate if too fast
		if(seen){xSp = round(sqrt(abs(playerDifference)/8))*sign(playerDifference);}//if agro, go faster, then decelerate on approach
		if((x>=xMax || x<=xMin) && sign(xSp)!=sign(xstart-x)){xSp*=-.5;}//if hit a wall for some reason, bounce back and cut speed in half
	}
#endregion

tempInvincibility--;
if(myHealth<=0){//create key upon death
	instance_create_layer(x,y,"Keys",oKey);
	instance_destroy();
}