/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_escape)){ //checks if escape key is pressed
	if(!pause){ //if escape has not been pressed pause game
		pause = true;
		instance_deactivate_all(true);//tells all step events to stop except this one
	}else{
		pause = false;
		instance_activate_all();//unpauses all step events
 }
}
