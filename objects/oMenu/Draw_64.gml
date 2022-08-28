/// @description Insert description here
// You can write your code in this editor

//Menu Characteristics
draw_set_halign(fa_center);
draw_set_font(pauseMenuFont);

var spacing = 70;

var textSize = 1;

if(pause){
	
	draw_set_color(c_black); //set current draw color to black
	draw_set_alpha(0.60); //sets transparency to 60%
	draw_rectangle(0, 0, room_width, room_height,0); // draws a rectangle around viewPort
	
	draw_set_alpha(1.0); //sets transparency to 60%
	for (var i = 0; i < array_length(menu[currentSubMenu]); ++i) {
	
	//Set Color
	if i == currentIndex{
		draw_set_color(c_yellow); 
		textSize = 1.07;
		draw_set_swf_aa_level(1);
	} else {
		draw_set_color(c_white);
		textSize = 1;
		draw_set_swf_aa_level(0);
	}
	
	//scrollable setting?
	if is_array(menu[currentSubMenu][i]){
		
		//get menu
		var menuArray = menu[currentSubMenu][i];
		
		//get map
		var mapArray = global.settingsMap[? menuArray[1]];
		
		//get map selections
		var limitsArray = mapArray[1];
		
		//is this an integer
		if is_real(limitsArray[0]){
			//show integer
			var text = menuArray[0] + string(mapArray[0]);
		}else{
			//show string
			var text = menuArray[0] + limitsArray[mapArray[0]];
		}
	}else{	
		//show plainText
		var text = menu[currentSubMenu][i]
	}
	
   //draw_text(room_width/2, room_height *0.4 + spacing * i, text); 
	draw_text_transformed(700, 700 *0.4 + spacing * i, text, textSize, textSize, 0);
	
 }
}

/*x = view_xport[0];
y = view_yport[0];
width = view_wport[0];
height = view_hport[0];
optionNames = ["Resume","Options","Exit"];

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if(pause){
	draw_set_color(c_black); //set current draw color to black
	draw_set_alpha(0.60); //sets transparency to 60%
	draw_rectangle(x, y, width, height,0); // draws a rectangle around viewPort
	draw_set_font(pauseMenuFont);//sets font to pauseMenuFont
	draw_set_color(c_white);//sets current draw color to white
	draw_set_alpha(1); // No transparency
	draw_set_halign(fa_center);
	
	for(i = 0; i < array_length(optionNames); i++){
		stringWidth = string_width(optionNames[i]);
		
		if (point_in_rectangle(mx, my,((x/2)-(stringWidth/2)), (height - 600 +(150/2)), (x/2)+(stringWidth/2), (height - 600 +(150/2)))) {
		 draw_set_color(c_yellow);//sets current draw color to white
		}
		draw_text((width)/2,(height-600) + i*150, optionNames[i]); // Writes text at the center of viewport
	} 
	
}*/
