/// @description Insert description here
// You can write your code in this editor

//get key inputs

var escapeKey = keyboard_check_pressed(vk_escape);
var upKey = keyboard_check_pressed(ord("W"));
var downKey = keyboard_check_pressed(ord("S"));
var leftKey = keyboard_check_pressed(ord("A"));
var leftKeyHeld = keyboard_check(ord("A"));
var rightKey = keyboard_check_pressed(ord("D"));
var rightKeyHeld = keyboard_check(ord("D"));
var selectKey = keyboard_check_pressed(vk_space);

//holding key
var repeatSpeed = 10;
var repeatDelay = 25;

//holding leftKey
if leftKey time_held_left = repeatDelay;
if time_held_left > 0 {
	time_held_left--;
	if time_held_left == 0 and leftKeyHeld{
		leftKey = true;	
		time_held_left = repeatSpeed;
	}
}

//rightKey held
if rightKey time_held_right = repeatDelay;
if time_held_right > 0{
	time_held_right--;
	if time_held_right == 0 and rightKeyHeld{
		rightKey = true;	
		time_held_right = repeatSpeed;
	}
}

var indexMovement = downKey - upKey;
var horizontalMovment = rightKey - leftKey;

//move index position if key is pressed
if(indexMovement != 0){
	currentIndex += indexMovement; //move
	
	var indexSize = array_length(menu[currentSubMenu]);//check index size
	
	if currentIndex < 0 currentIndex = indexSize - 1; //if at start go to end
	else if currentIndex >= indexSize currentIndex = 0;// if at end go to start
}


if selectKey or (is_array(menu[currentSubMenu][currentIndex]) and (horizontalMovment != 0)){
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
					changeMenu(horizontalMovment, "mapMusic");
				break;
					
				case 1:
					changeMenu(horizontalMovment, "mapSound");
				break
		
				case 2:
					 changeMenu(horizontalMovment, "mapGrass");
				break;
				
				case 3:
					currentSubMenu = MAIN;
					currentIndex = 1;
				break;
			}
		break;
	}
}

function changeMenu(hMove, key){
	var mapArray = global.settingsMap[? key];
	
	var limitArray = mapArray[1];
	
	if is_real(limitArray[0]){
		// integer limits
		var _min = limitArray[0];
		var _max = limitArray[1];
	} else {
		//string limits
		var _min = 0;
		var _max = array_length(limitArray) - 1;
	}
	//@ updates orginal map
	mapArray[@ 0] = clamp(hMove + mapArray[0], _min, _max);
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
	
	
