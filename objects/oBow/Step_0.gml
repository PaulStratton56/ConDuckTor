x=oPlayer.x;
y=oPlayer.y;
image_angle=oPlayer.image_angle;

#region//draw and release bow
	if(keyboard_check_pressed(vk_space)){
		image_speed=drawspeed;
	}
	if image_index==5{
		image_speed=0;
	}
	if((keyboard_check_released(vk_space) || !keyboard_check(vk_space))&&image_index>=1){//pressing space for an instant fires an arrow when it shouldn't
		with(instance_create_layer(x,y,"Player",oArrow)){
			image_angle=other.image_angle;
			v=7*other.image_index;
			xSp=v*cos(image_angle*pi/180)+oPlayer.xSp;
			ySp=-v*sin(image_angle*pi/180)+oPlayer.ySp;
		}
		image_index=0;
		image_speed=0;
	}
#endregion

if keyboard_check_pressed(vk_shift){
	instance_destroy();
}
