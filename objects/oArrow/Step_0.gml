trajectories=true;

if(!instance_exists(oBow) && nocked){
	instance_destroy();
}

//make relative to player and bow
if(instance_exists(oBow)&&nocked){
	image_angle=oBow.image_angle;
}


#region//nock and draw
	if(keyboard_check(vk_space)&&nocked&&instance_exists(oBow)){
		if (oBow.image_index==0){
			x=oBow.x+lengthdir_x(63-38,image_angle);
			y=oBow.y+lengthdir_y(63-38,image_angle);
		}
		else if (oBow.image_index==1){
			x=oBow.x
			y=oBow.y
		}
		else if (oBow.image_index==2){
			x=oBow.x+lengthdir_x(26-38,image_angle);
			y=oBow.y+lengthdir_y(26-38,image_angle);
		}
		else if (oBow.image_index==3){
			x=oBow.x+lengthdir_x(16-38,image_angle);
			y=oBow.y+lengthdir_y(16-38,image_angle);
		}
		else if (oBow.image_index==4){
			x=oBow.x+lengthdir_x(1-38,image_angle);
			y=oBow.y+lengthdir_y(1-38,image_angle);
		}	
	}
#endregion

#region//shoot
	if(keyboard_check_released(vk_space)&&instance_exists(oBow)){
		grav=1;
		v=8*oBow.image_index;
		initialAngle=image_angle;
		xSp=v*cos(image_angle*pi/180)+oPlayer.xSp;
		ySp=-v*sin(image_angle*pi/180)+oPlayer.ySp;
		nocked=false;
	}
#endregion

#region//flight trajectory
	if(!nocked){
		x+=xSp;
		y+=ySp;
		image_angle = darctan2(-ySp,xSp);
		if(trajectories&&instance_exists(oBow)){instance_create_layer(x,y,"IMain", oTrajectory);}//adds flight path if bool is true
		ySp+=grav;
		//if out of bounds of rectangle except on top cause it should fall back down, destroy arrow and replace with a fake arrow // maybe should only make it the bottom boundary
		if(x<0 || x>room_width || y+lengthdir_y(sprite_width,image_angle)>620){
			if(y+lengthdir_y(sprite_width,image_angle)>620){
				instance_create_layer(x,y,"IMain",oFakeArrow);
			}
			instance_destroy();
		}
		if(place_meeting(x,y,oCyberduck)&&!nocked){
			with(instance_place(x,y,oCyberduck)){
				instance_destroy();
			}
			instance_destroy();
		}
	}
#endregion
//weird angle at top left and right of screen

if (keyboard_check_pressed(vk_shift)&&nocked){
	instance_destroy();
}

