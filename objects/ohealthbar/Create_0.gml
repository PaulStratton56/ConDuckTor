playersHealth=false;//boolean if players health
myEnemy=noone;//whoever's health is represented

healthbar_fades = time_source_create(time_source_game,2,time_source_units_seconds,function(){
	instance_destroy();
});//time source to make healthbar fade after 2 seconds

with(instance_place(x,y,oHealthBar)){//if another healthbar at same position, destroy it
	time_source_reset(healthbar_fades);
	instance_destroy();
}
