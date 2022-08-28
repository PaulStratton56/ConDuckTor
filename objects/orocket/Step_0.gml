if(x<40 || x>oPlayer.xMax || y<130 || y>global.room_yMin){
	instance_destroy();//destroy if out of bounds of train car
}
victim=instance_place(x,y,oCyberduck);//store victim
if(victim!=noone && victim.tempInvincibility<0){
	dealDamage(1,speed,direction,victim);//code in Scripts
	//future explosion code here likely
	instance_destroy();//destroy after hitting an enemy
}