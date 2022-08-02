/// @description Insert description here
// You can write your code in this editor

//Menu Characteristics
draw_set_halign(fa_center);
draw_set_font(pauseMenuFont);

var spacing = 70;

if(pause){
	
	draw_set_color(c_black); //set current draw color to black
	draw_set_alpha(0.60); //sets transparency to 60%
	draw_rectangle(0, 0, room_width, room_height,0); // draws a rectangle around viewPort
	
	draw_set_alpha(1.0); //sets transparency to 60%
	for (var i = 0; i < array_length_2d(menu, currentSubMenu); ++i) {
	
	//Set Color
	if i = currentIndex draw_set_color(c_yellow);
	else draw_set_color(c_white);
	//
    draw_text(room_width/2, room_height *0.4 + spacing * i, menu[currentSubMenu, i]); 
	
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
