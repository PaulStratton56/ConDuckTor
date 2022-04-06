//Checking for Player Input
if(keyboard_check_pressed(ord("1"))){
	currentWeapon=oBow;
}
else if(keyboard_check_pressed(ord("2"))){
	currentWeapon=oSword;
}


if(mouse_x>=x){
	image_yscale=1;
	//image_angle=point_direction(x,y,mouse_x,mouse_y);
}
else{
	image_yscale=-1;
	//image_angle=180-point_direction(x,mouse_y,mouse_x,y);
}
image_angle=point_direction(x,y,mouse_x,mouse_y);


if(keyboard_check(ord("D"))){
	xAcc = baseAcc;
}
else if(keyboard_check(ord("A"))){
	xAcc = -baseAcc;
}
else{
	xAcc = 0;
}

if(keyboard_check_pressed(ord("W")) && y+image_yscale*sprite_height/2==oCart.y){
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
ySp = min(30,(ySp + grav));

//collisions
if (x+sprite_width/2+xSp>=room_width){//oCart.x+oCart.sprite_width/2){
	xSp=0;
	x=room_width-sprite_width/2-1;//oCart.x+oCart.sprite_width/2-sprite_width/2;
}
if (y+image_yscale*sprite_height/2+ySp>=oCart.y){
	y=oCart.y-image_yscale*sprite_height/2;
	ySp=0;
}


//Applying Speed to Position
x = clamp(x + xSp,sign(image_xscale)*sprite_width/2,room_width-sprite_width/2)
y = clamp(y + ySp,sprite_height/2,room_height-sprite_height/2)


if(!instance_exists(oCyberduck)){
	game_restart();
}
