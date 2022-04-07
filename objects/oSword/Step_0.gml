x=oPlayer.x
y=oPlayer.y
image_xscale=sign(mouse_x-oPlayer.x);
if (image_index>sprite_get_number(sSword)-1){
	instance_destroy();
}
