weapons = [oArrow,oSword]
for (i=0;i<array_length(weapons);i++){
	if(place_meeting(x,y,weapons[i])){
		instance_destroy(weapons[i]);
		instance_destroy();
		break;
	}
}

//Move left of right based on where it is in relation to current position
if (x+xSp>=xstart+64){ xSp=-1; }
else if(x+xSp<=xstart-64){ xSp=1; }

x+=xSp;

//Kill the player on contact
if(place_meeting(x,y,oPlayer)){
	game_restart();
}
