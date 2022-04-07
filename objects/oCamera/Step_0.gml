
//Fullscreen toggle
full = window_get_fullscreen();
if(keyboard_check_pressed(ord("F"))){
	window_set_fullscreen(!full);
}

//More camera junk (DO NOT TOUCH UNLESS YOU KNOW)
x = clamp(wWidth/2,x+(xTo-x)/10,room_width-(wWidth/2));
y = clamp(wHeight/2,y+(yTo-y)/10,room_height-(wHeight/2));

if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera, vm);
