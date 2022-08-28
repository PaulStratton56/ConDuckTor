/// @description go to map room
if(place_meeting(x,y,oPlayer) && keyboard_check_pressed(ord("I"))){//go to map when I is pressed
	room_goto(rMap);
}