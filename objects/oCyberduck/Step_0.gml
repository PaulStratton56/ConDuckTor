grav=1;

x+=xSp;
y+=ySp;
ySp+=grav;
if(y>550){ySp=0;}

//duck faces direction is is walking
image_xscale=sign(-xSp);
if(image_xscale==0){image_xscale=1;}

#region//agro - moves faster and chases player
	if(abs(x - oPlayer.x) < 100 && sign(oPlayer.x-x)==sign(xSp)){
		seen = true;
	}
	if (abs(oPlayer.x - x) > 300){
		seen = false;
	}

	if(!seen){
		if (abs(x-xstart)>64){
			xSp=sign(xstart-x)*(random(2)+1);
		}
	}
	else{
		xSp = sign(floor((oPlayer.x-x)/3))*3;
	}
#endregion

if(place_meeting(x,y,oPlayer)){
	game_restart();
}
