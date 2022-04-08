grav=1;
if (x+xSp>=xstart+64){
	xSp=-random(2)-1;
}
else if(x+xSp<=xstart-64){
	xSp=random(2)+1;
}
x+=xSp;
y+=ySp;
ySp+=grav;
if(y>550){ySp=0;}

if(place_meeting(x,y,oPlayer)){
	instance_destroy(oPlayer);
	game_restart();
}
