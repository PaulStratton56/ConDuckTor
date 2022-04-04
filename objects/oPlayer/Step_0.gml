//Checking for Player Input
if(keyboard_check(vk_right)){
	xAcc = baseAcc
	image_xscale=3
}
else if(keyboard_check(vk_left)){
	xAcc = -baseAcc
	image_xscale=-3
}
else{
	xAcc = 0	
}

if(keyboard_check_pressed(vk_space) and y == room_height - 45){
	ySp = jumpSp	
}

//Calculating Speed
xSp = clamp((xSp + xAcc) * xDec,-mxSp,mxSp)
ySp = min(30,(ySp + grav))


//Applying Speed to Position
x = clamp(x + xSp,width/2,room_width-(width/2))

y = clamp(y + ySp,0,room_height-height/2)
