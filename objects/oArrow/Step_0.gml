if(active && !embedded){//inactive if it hits the car boundaries, embedded if it hit an enemy
	x+=xSp;//update position
	y+=ySp;
	image_angle = darctan2(-ySp,xSp);//update angle to be tangent to flight path
	ySp+=grav;
	
	if(trajectories){//create trajectories if trajectories is on
		with(instance_create_layer(x,y,"Player", oTrajectory)){
			myArrow=other.id;//store id of arrow that created it
			image_angle=other.image_angle;
		}
	}
		
	//if hits a "boundary" of train car
	if(x<40 || x>oPlayer.xMax || y>global.room_yMin || y<130){
		active=false;//deactivate
		array_push(oWatcher.arrows,id);//add this id to list of watchers arrows
	}
	
	myEnemy=instance_place(x,y,oCyberduck); //store id of enemy that was hit
	if(myEnemy!=noone){
		embedded=true;
		embeddedX=myEnemy.x-x;//x position relative to enemy
		embeddedY=myEnemy.y-y;//y position relative to enemy
		if(myEnemy.tempInvincibility>0){instance_destroy();}
		else{
			damage=sqrt(power(xSp-myEnemy.xSp,2)+power(ySp-myEnemy.ySp,2))/90;//90 is arbitrary
			knockback=8*damage;//8 is arbitrary
			// damage & knockback in terms of relative speed of arrow
			dealDamage(damage,knockback,image_angle,myEnemy);//code located in scripts
		}
	}
}
else if(embedded){//if embedded in an enemy, move with them
	if(instance_exists(myEnemy)){//update x and y position based on enemy movement
		x=myEnemy.x-embeddedX;
		y=myEnemy.y-embeddedY;
	}
	else{instance_destroy();}//if enemy doesn't exist, destroy self
}