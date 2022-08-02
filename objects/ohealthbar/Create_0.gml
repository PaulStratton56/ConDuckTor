playersHealth=false;
myEnemy=noone;//whoever's health is represented
fade_out = function(){
	instance_destroy();
}
healthbar_fades = time_source_create(time_source_game,5,time_source_units_seconds,fade_out);
if(place_meeting(x,y,oHealthBar)){//if already a healthbar,destroy it cause it shows wrong health
	with(instance_place(x,y,oHealthBar)){
		time_source_reset(healthbar_fades);
		instance_destroy();
	}
}