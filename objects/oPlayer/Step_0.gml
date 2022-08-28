//update orientation
image_yscale=sign(mouse_x-x);
if(image_yscale==0){image_yscale=1};
image_angle=point_direction(x,y,mouse_x,mouse_y);

keysCollected*=keysCollected>=0;//if keys collected is negative reset to 0

#region//positional code
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	jump = keyboard_check_pressed(ord("W"));
	//testing happy
	
	xMax = min((keysCollected+1)*1550+29,room_width)-abs(sprite_width/2);//prevent player from going to next room if key not collected
	x = clamp(x + xSp,29+abs(sprite_width/2),xMax);
	xSp = clamp((xSp*!(x==abs(sprite_width/2) || x==xMax) + xAcc),-mxSp,mxSp);//clamp speed, and if touching a wall, xSp=0
	xAcc = baseAcc*(right-left)-groundFriction*sign(xSp)*(y==ground)*!(abs(right-left));//if on the ground and not accelerating, apply friction
	
	y = clamp(y + ySp,abs(sprite_height/2),ground);//apply jump, gravity, and if on ground stop moving
	ySp = (ySp+grav)*(y!=ground)+jumpSp*jump*(y==ground);
	//if y is not on the ground, add gravity
	//if y is on the ground, and jump is pressed, increase ySp by jumpSp
#endregion

#region//fighting
	if(room==rTest){
		shift = keyboard_check_pressed(vk_shift);
		weapon1 = keyboard_check_pressed(ord("1"));
		weapon2 = keyboard_check_pressed(ord("2"));
		weapon3 = keyboard_check_pressed(ord("3"));
		attack = keyboard_check_pressed(vk_space);
		
		if(shift || weapon1 || weapon2 || weapon3){instance_destroy(currentWeapon);}//destroy current weapon when you press shift or select weapon
		
		//define currentWeapon
		if(weapon1){currentWeapon=oSword;}
		else if(weapon2){currentWeapon=oBow;}
		else if(weapon3){currentWeapon=oRPG;}
		
		//if attack is pressed, create current weapon
		if(attack && !instance_exists(currentWeapon) && delay<0){
			instance_create_layer(x,y,"Weapons",currentWeapon);
			if(currentWeapon==oSword){delay=45;}//time delay before sword swing
		}
		delay--;
	}
#endregion

//collect keys upon contact
if(!oWatcher.debugging){
	with(instance_place(x,y,oKey)){
		other.keysCollected+=1;
		instance_destroy();
	}
}
//reset game upon death
if(myHealth<=0){
	game_restart();
}
