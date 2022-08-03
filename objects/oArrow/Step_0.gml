if(active && !embedded){//inactive if it hits the ground, embedded if it hit an enemy
	x+=xSp;
	y+=ySp;
	image_angle = darctan2(-ySp,xSp);
	ySp+=grav;
	
	if(trajectories){
		with(instance_create_layer(x,y,"Player", oTrajectory)){
			myArrow=other.id;
			image_angle=other.image_angle;
		}
	}
		
	//if out of bounds of rectangle, either destroy or inactivate it
	if(x<0 || x>room_width || y>oPlayer.room_yMin){
		if(y>oPlayer.room_yMin){
			active=false;
			array_push(oWatcher.arrows,id);//add to list of watchers arrows
		}
		else{instance_destroy();}
	}
		
	if(place_meeting(x,y,oCyberduck)){//hit an enemy
		embedded=true;
		myEnemy=instance_place(x,y,oCyberduck); //store enemy that was hit in variable
		embeddedX=myEnemy.x-x;
		embeddedY=myEnemy.y-y;
		if(myEnemy.knockedback){instance_destroy();}
		if(myEnemy!=noone && !myEnemy.knockedback){
			damage=sqrt(power(xSp-myEnemy.xSp,2)+power(ySp-myEnemy.ySp,2))/90; // damage & knockback relative to speed of arrow
			knockback=16*damage;
			dealDamage(damage,knockback,myEnemy);//damage, knockback, health bar
		}
	}
}
else if(embedded){//if embedded in an enemy, move with the victim
	if(instance_exists(myEnemy)){
		x=myEnemy.x-embeddedX;
		y=myEnemy.y-embeddedY;
	}
	else{instance_destroy();}
}


//code needs cleaning up, I think there are redundant parts in it