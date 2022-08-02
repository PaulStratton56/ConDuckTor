/// @description Insert description here
// You can write your code in this editor

//get key inputs

var escapeKey = keyboard_check_pressed(vk_escape);
var upKey = keyboard_check_pressed(ord("W"));
var downKey = keyboard_check_pressed(ord("S"));
var selectKey = keyboard_check_pressed(vk_space);

var indexMovement = downKey - upKey;

//move index position if key is pressed
if(indexMovement != 0){
	currentIndex += indexMovement; //move
	
	var indexSize = array_length_2d(menu, currentSubMenu);//check index size
	
	if currentIndex < 0 currentIndex = indexSize - 1; //if at start go to end
	else if currentIndex >= indexSize currentIndex = 0;// if at end go to start
}

if selectKey{
	switch(currentSubMenu){
		
		case MAIN: // Main Menu
			switch(currentIndex){
				case 0:
					pause = false;
					instance_activate_all();
				break;
		
				case 1:
					currentSubMenu = SETTINGS;
					currentIndex = 0;
				break
		
				case 2:
					game_end();
				break;
			}
		break;
		
		case SETTINGS: // Options Menu
			switch(currentIndex){
				case 0:
					
				break;
		
				case 1:
					
				break
		
				case 2:
					 
					 
				break;
				
				case 3:
					currentSubMenu = MAIN;
					currentIndex = 1;
				break;
			}
		break;
	}
}




//Check Pause State
if(escapeKey){ //checks if escape key is pressed
	if(!pause){ //if escape has not been pressed pause game
		pause = true;
		instance_deactivate_all(true);//tells all step events to stop except this one
	}else{
		pause = false;
		instance_activate_all();//unpauses all step events
 }
}
	
	
