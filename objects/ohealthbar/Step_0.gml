if(!playersHealth){//players health bar should be permanent
	if(time_source_get_state(healthbar_fades)==time_source_state_initial){//if not started, start timer for healthbar
		time_source_start(healthbar_fades);
	}
	if(instance_exists(myEnemy)){//keep aligned with whoever's health I represent
		x=myEnemy.x-30;
		y=myEnemy.y-30;
	}
	else{
		time_source_destroy(healthbar_fades);
		instance_destroy();
	}
}
else{
	x=oCamera.x-oCamera.wWidth/2+20;
	image_xscale=oPlayer.myHealth;
}