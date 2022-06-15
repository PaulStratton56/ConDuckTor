image_yscale=sign(mouse_x-x);
if(image_yscale==0){image_yscale=1};
image_angle=point_direction(x,y,mouse_x,mouse_y);

#region//movement
	if(keyboard_check(ord("D")))
	{
		xAcc = baseAcc;
	}
	else if(keyboard_check(ord("A"))){
		xAcc = -baseAcc;
	}
	else{
		xAcc = 0;
	}

	if(keyboard_check_pressed(ord("W"))){// && y == oCart.y-(abs(sprite_height)/2)){
		ySp = jumpSp;
	}
#endregion

#region //speed and position bounds
	xSp = clamp((xSp + xAcc) * xDec,-mxSp,mxSp);
	ySp = min(30,(ySp + grav));
	x = clamp(x + xSp,abs(sprite_width/2),room_width-abs(sprite_width/2));
	if(x==abs(sprite_width/2) || x==room_width-abs(sprite_width/2)){xSp=0;}
	y = clamp(y + ySp,abs(sprite_height/2),yMin-abs(sprite_height/2));
	if(y==abs(sprite_height/2)|| y==yMin-abs(sprite_height/2)){ySp=0;}
#endregion

#region//choosing weapon
if(room!=rStationHub){
	if(keyboard_check_pressed(ord("1"))){
		instance_destroy(currentWeapon);
		currentWeapon=oSword;
	}
	else if(keyboard_check_pressed(ord("2"))){
		instance_destroy(currentWeapon);
		currentWeapon=oBow;
	}
	if(keyboard_check_pressed(vk_space) && !instance_exists(currentWeapon)){
		instance_create_layer(x,y,"Player",currentWeapon);
	}
}
#endregion

