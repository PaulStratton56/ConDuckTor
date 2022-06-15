if(id.nocked){
	if(!instance_exists(oBow)){
		instance_destroy();
	}

	//make relative to player and bow
	if(instance_exists(oBow)){
		image_angle=oBow.image_angle;
	}

	#region//nock and draw
		if(keyboard_check(vk_space)&&instance_exists(oBow)){
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
		if(instance_exists(oBow)&&keyboard_check_released(vk_space)){
			v=8*oBow.image_index;
			xSp=v*cos(image_angle*pi/180)+oPlayer.xSp;
			ySp=-v*sin(image_angle*pi/180)+oPlayer.ySp;
			id.nocked=false;
		}
	#endregion
}
else{//flight trajectory
	x+=xSp;
	y+=ySp;
	image_angle = darctan2(-ySp,xSp);
	if(trajectories){instance_create_layer(x,y,"Player", oTrajectory).myArrow=id;}
	ySp+=grav;
	//if out of bounds of rectangle except on top cause it should fall back down, destroy arrow and replace with a fake arrow // maybe should only make it the bottom boundary
	if(x<0 || x>room_width || y+lengthdir_y(sprite_width,image_angle)>620){
		if(y+lengthdir_y(sprite_width,image_angle)>620){
			fakeArrowID = instance_create_layer(x,y,"Player",oFakeArrow)
			array_push(oWatcher.arrows,fakeArrowID);
			fakeArrowID.associatedArrow=id;
		}
		instance_destroy();
	}
	if(place_meeting(x,y,oCyberduck)){
		oPlayer.yMin=oCart.y;
		with(instance_place(x,y,oCyberduck)){
			instance_destroy();
		}
		instance_destroy();
	}
}

if (keyboard_check_pressed(vk_shift)&&id.nocked){
	instance_destroy();
}

