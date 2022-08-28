//if out of bounds of train car, destroy self
if(x+lengthdir_x(sprite_width/2,direction)<40 || x+lengthdir_x(sprite_width/2,direction)>oPlayer.xMax || y<130 || y+lengthdir_y(sprite_width/2,direction)>global.room_yMin){
	instance_destroy();
}
//if hit player, damage them
with(instance_place(x,y,oPlayer)){
	myHealth-=1*!oWatcher.debugging;//damage player if not in debugging mode
	instance_destroy(other);
}