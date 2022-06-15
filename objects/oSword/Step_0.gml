x=oPlayer.x
y=oPlayer.y

if(place_meeting(x,y,oCyberduck)){
	oPlayer.yMin=oCart.y;
	with(instance_place(x,y,oCyberduck)){
		instance_destroy();
	}
}

if (image_index>=sprite_get_number(sSword)-1){
	instance_destroy();
}
