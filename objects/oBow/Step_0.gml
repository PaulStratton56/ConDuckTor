x=oPlayer.x;
y=oPlayer.y;

image_angle=oPlayer.image_angle;

if !keyboard_check(vk_space){
	image_index=0;
	image_speed=0;
}
else{
	image_speed=1;
}
if image_index==4{
	image_speed=0;
}
if(keyboard_check_released(vk_space)){
	image_index=0;
}
if keyboard_check_pressed(vk_shift){
	instance_destroy();
}
