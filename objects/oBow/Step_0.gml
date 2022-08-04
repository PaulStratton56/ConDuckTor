x=oPlayer.x;
y=oPlayer.y;
image_angle=oPlayer.image_angle;

#region
	if(keyboard_check_pressed(vk_space)){//"nock" and draw
		image_speed=drawspeed;
	}
	if(!keyboard_check(vk_space)){//release
		if(image_index>1){//create arrow if on an arrow frame of bow animation (frame 0 has no arrow), otherwise set image index and speed to 0
			with(instance_create_layer(x,y,"Player",oArrow)){
				image_angle=other.image_angle;
				v=8*(other.image_index-1);
				xSp=v*cos(image_angle*pi/180)+oPlayer.xSp;
				ySp=-v*sin(image_angle*pi/180)+oPlayer.ySp;
			}
		}
		image_index=0;
		image_speed=0;
	}
#endregion