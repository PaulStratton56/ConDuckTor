weapons = [oArrow,oSword]
for (i=0;i<array_length(weapons);i++){
	if(place_meeting(x,y,weapons[i])){
		instance_destroy();
		instance_destroy(weapons[i]);
		break;
	}
}
if (x+xSp>=xstart+64){
	xSp=-1;
}
else if(x+xSp<=xstart-64){
	xSp=1;
}
x+=xSp;
if(place_meeting(x,y,oPlayer)){
	instance_destroy(oPlayer);
	game_restart();
}
