//@Global Game Scripts

//Fullscreen toggle

if(keyboard_check_pressed(ord("F"))){
	window_set_fullscreen(!window_get_fullscreen());
}

//delete arrows after set number of shots
if(array_length(arrows)>numberOfArrows){
	instance_destroy(arrows[0])
	array_delete(arrows,0,1);
}

//Game complete!
if(!instance_exists(oCyberduck) && room == rTest){
	game_restart();
}
if(instance_exists(oCamera)){
	x=oCamera.x;
	y=room_height-650;
}