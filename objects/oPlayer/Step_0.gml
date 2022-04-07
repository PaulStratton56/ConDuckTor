//Weapon Selection
if(keyboard_check_pressed(ord("1"))){
	currentWeapon=oBow;
}
else if(keyboard_check_pressed(ord("2"))){
	currentWeapon=oSword;
}

//Character looks at mouse
image_angle=point_direction(x,y,mouse_x,mouse_y);
image_yscale=sign(mouse_x-x);

//Movement
if(keyboard_check(ord("D"))){
	xAcc = baseAcc;
}
else if(keyboard_check(ord("A"))){
	xAcc = -baseAcc;
}
else{
	xAcc = 0;
}

if(keyboard_check_pressed(ord("W")) && y == oCart.y-(abs(sprite_height)/2)){
	ySp = jumpSp;
}


if(keyboard_check_pressed(vk_space)){
	if(!instance_exists(currentWeapon)){
		instance_create_layer(x,y,"IMain",currentWeapon);
	}
	if(currentWeapon==oBow){
		instance_create_layer(x,y,"IMain", oArrow);
	}
}

//Constraining Speed
xSp = clamp((xSp + xAcc) * xDec,-mxSp,mxSp);
ySp = min(30,ySp + grav);

//Applying Speed to Position
x = clamp(x + xSp,abs(sprite_width)/2,room_width-abs(sprite_width)/2)
y = clamp(y + ySp,abs(sprite_height)/2,(oCart.y)-(abs(sprite_height)/2))


