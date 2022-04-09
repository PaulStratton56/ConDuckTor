/// @description Insert description here
// You can write your code in this editor

if(pause){
	draw_set_color(c_black); //set current draw color to black
	draw_set_alpha(0.60); //sets transparency to 60%
	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0],0); // draws a rectangle around viewPort
	draw_set_font(pauseMenuFont);//sets font to pauseMenuFont
	draw_set_color(c_white);//sets current draw color to white
	draw_set_alpha(1); // No transparency 
	draw_text((view_wport[0]-125)/2,(view_hport[0])/2, "Paused"); // Writes text at the center of viewport
	
}
