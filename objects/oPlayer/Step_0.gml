image_yscale=sign(mouse_x-x);
if(image_yscale==0){image_yscale=1};
image_angle=point_direction(x,y,mouse_x,mouse_y);

keysCollected*=keysCollected>=0;
yMin=global.room_yMin;
	
#region//movement and position
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	jump= keyboard_check_pressed(ord("W"));
	ground = yMin-abs(sprite_height/2);
	xAcc = baseAcc*(right-left);
	
	xMax = min((keysCollected+1)*1550+29,room_width)-abs(sprite_width/2);//prevent player from going to next room if key not collected
	x = clamp(x + xSp,29+abs(sprite_width/2),xMax);
	xSp = clamp((xSp*!(x==abs(sprite_width/2) || x==xMax) + xAcc),-mxSp,mxSp);
	if(!abs(right-left)&&y==ground){xSp*=xDec;}//if on the ground and not accelerating, decelerate
	
	y = clamp(y + ySp,abs(sprite_height/2),ground);//apply jump, gravity, and if on ground stop moving
	ySp = (ySp+grav)*(y!=ground)+jumpSp*jump*(y==ground);
	//if y is not on the ground, ySp should be 0 and don't add gravity
	//if y is on the ground, and jump is pressed, increase ySp by jumpSp
#endregion

#region//fighting
	if(room!=rStationHub){
		shift = keyboard_check_pressed(vk_shift);
		weapon1 = keyboard_check_pressed(ord("1"));
		weapon2 = keyboard_check_pressed(ord("2"));
		weapon3 = keyboard_check_pressed(ord("3"));
		if(shift || weapon1 || weapon2 || weapon3){instance_destroy(currentWeapon);}
		if(weapon1){currentWeapon=oSword;}
		else if(weapon2){currentWeapon=oBow;}
		else if(weapon3){currentWeapon=oRPG;}
		if(keyboard_check_pressed(vk_space) && !instance_exists(currentWeapon) && delay<0){
			instance_create_layer(x,y,"Weapons",currentWeapon);
			if(currentWeapon==oSword){delay=45;}//time delay before sword swing
		}
		delay--;
	}
#endregion

with(instance_place(x,y,oKey)){
	if(!oWatcher.debugging){
		other.keysCollected+=1;
		instance_destroy();
	}
}

if(myHealth<=0){
	game_restart();
}
