playersHealth=false;
myEnemy=noone;//whoever's health is represented

healthbar_fades = time_source_create(time_source_game,2,time_source_units_seconds,function(){
	instance_destroy();
});

with(instance_place(x,y,oHealthBar)){
	time_source_reset(healthbar_fades);
	instance_destroy();
}
