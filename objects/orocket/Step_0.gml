/// @description Insert description here
// You can write your code in this editor
if(x<40 || x>oPlayer.xMax || y<0 || y>global.room_yMin){
	instance_destroy();
}
victim=instance_place(x,y,oCyberduck);
if(victim!=noone){
	dealDamage(1,speed,victim);
	instance_destroy();
}