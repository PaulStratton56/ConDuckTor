//update position and orientation
x=oPlayer.x;
y=oPlayer.y;
image_angle=oPlayer.image_angle;

startDraw = keyboard_check_pressed(vk_space);
notDrawing = !keyboard_check(vk_space);
#region
	if(startDraw){image_speed=drawspeed;}//if space is pressed on this frame: start bow animation; "nock" and draw
	if(notDrawing){//release bow
		if(image_index>1){//if on an arrow frame of bow animation (frame 0 has no arrow)
			with(instance_create_layer(x,y,"Player",oArrow)){//create arrow 
				image_angle=other.image_angle;//update image angle
				v=8*(other.image_index-1);//initial velocity
				xSp=v*cos(image_angle*pi/180)+oPlayer.xSp;//initial xSp
				ySp=-v*sin(image_angle*pi/180)+oPlayer.ySp;//initial ySp
			}
		}
		//set image index and speed to 0 regardless
		image_index=0;
		image_speed=0;
	}
#endregion