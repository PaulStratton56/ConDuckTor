//Checking for Player Input
if(keyboard_check(vk_right)){
	xAcc = baseAcc;
	image_xscale=1;
}
else if(keyboard_check(vk_left)){
	xAcc = -baseAcc;
	image_xscale=-1;
}
else{
	xAcc = 0;	
}

if(keyboard_check_pressed(vk_space)&&y==oCart.y+oCart.sprite_height-sprite_height/2){
	ySp = jumpSp;
}


//Constraining Speed
xSp = clamp((xSp + xAcc) * xDec,-mxSp,mxSp);
ySp = min(30,(ySp + grav));



//collisions
if (x+sprite_width/2+xSp>=oCart.x+oCart.sprite_width){
	xSp=0;
	x=oCart.x+oCart.sprite_width-sprite_width/2;
}
if (y+sprite_height/2+ySp>=oCart.y+oCart.sprite_height){
	y=oCart.y+oCart.sprite_height-sprite_height/2;
	ySp=0;
}
//if !place_meeting(x+sign(image_xscale)*sprite_width/2,y,oCart) || !place_meeting(x-sign(image_xscale)*sprite_width/2,y,oCart){
//	xSp=0;
//}



//Applying Speed to Position
x = clamp(x + xSp,sign(image_xscale)*sprite_width/2,room_width-sprite_width/2)
y = clamp(y + ySp,sprite_height/2,room_height-sprite_height/2)
