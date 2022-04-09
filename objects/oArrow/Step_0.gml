
//need to find a better solution.  Without this, each time you press space it creates all arrows you've shot previously at the angles you shot them, and fires them with the most recent arrow
while (place_meeting(x,y,oArrow)){
	instance_destroy();
}
//make relative to player and bow
oldFlightPaths=true;

if(xSp==0){
	image_angle=oBow.image_angle;
}
else{
	//image_angle=arctan((x-startx)/1024+4/5);
	image_angle=(180/pi)*arctan2((-(x-startx+sign(mouse_x-oPlayer.x)*49)/(xSp)+initialYSp),(xSp));
	if(oldFlightPaths){
		instance_create_layer(x,y,"IMain", oTempArrow);
	}
}


//draw arrow back
if(keyboard_check(vk_space)){
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
	xSp=0;
}
else if(keyboard_check_released(vk_space)){
	grav=1;
	v=8*oBow.image_index;
	initialAngle=image_angle;
	xSp=v*cos(image_angle*pi/180)+oPlayer.xSp;
	ySp=-v*sin(image_angle*pi/180)+oPlayer.ySp;
	initialYSp=v*sin(initialAngle*pi/180)+oPlayer.ySp
	startx=x;
	//starty=y;
}
if (keyboard_check_pressed(vk_shift)){
	instance_destroy();
}
if (xSp!=0){
	x+=xSp;
	y+=ySp;
	ySp+=grav;
}
