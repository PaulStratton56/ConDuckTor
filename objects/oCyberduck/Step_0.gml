grav=1;

x+=xSp;
y+=ySp;
ySp+=grav;
if(y>550){ySp=0;}

//duck faces direction is is walking
if (xSp < 0){
	image_xscale = 1;
}else if (xSp > 0){
	image_xscale = -1;
}


//agro checker - moves faster and chases player
seen = false;
if(xSp > 0 && x - oPlayer.x < 100){
	seen = true;
}else if(xSp < 0 && oPlayer.x - x < 100){
	seen = true;
}
if (abs(oPlayer.x - x) > 300){
	seen = false;
}

if(seen == false){
	if (x+xSp>=xstart+64){
		xSp=-random(2)-1;
	}
	else if(x+xSp<=xstart-64){
		xSp=random(2)+1;
	}
}else if(seen == true){
	if(x - oPlayer.x < 0){
		xSp = 3;
	} else if(oPlayer.x - x < 0) {
		xSp = -3;
	}
}

if(place_meeting(x,y,oPlayer)){
	game_restart();
}
