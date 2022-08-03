if(!inactive && !embedded){//inactive if it hits the ground, embedded if it hit an enemy
	if(nocked){
		if(!instance_exists(oBow)){
			instance_destroy();
		}

		//make relative to player and bow
		else{image_angle=oBow.image_angle;}

		#region//nock and draw, just animation, could remove this if we put the arrow in the bow sprite frames
			if(keyboard_check(vk_space)&&instance_exists(oBow)){
				if (oBow.image_index==0){
					x=oBow.x+lengthdir_x(63-38,image_angle);
					y=oBow.y+lengthdir_y(63-38,image_angle);
				}
				else if (oBow.image_index==1){
					x=oBow.x
					y=oBow.y
				}
				else if (oBow.image_index==2){
					x=oBow.x+lengthdir_x(26-38,image_angle);
					y=oBow.y+lengthdir_y(26-38,image_angle);
				}
				else if (oBow.image_index==3){
					x=oBow.x+lengthdir_x(16-38,image_angle);
					y=oBow.y+lengthdir_y(16-38,image_angle);
				}
				else if (oBow.image_index==4){
					x=oBow.x+lengthdir_x(1-38,image_angle);
					y=oBow.y+lengthdir_y(1-38,image_angle);
				}
			}
		#endregion

		#region//shoot
			if(instance_exists(oBow)&&keyboard_check_released(vk_space)){
				v=8*oBow.image_index;
				xSp=v*cos(image_angle*pi/180)+oPlayer.xSp;
				ySp=-v*sin(image_angle*pi/180)+oPlayer.ySp;
				nocked=false;
			}
		#endregion
	}
	else{//flight
		x+=xSp;
		y+=ySp;
		image_angle = darctan2(-ySp,xSp);
		if(trajectories){
			var traj = instance_create_layer(x,y,"Player", oTrajectory);
			traj.myArrow=id;
			traj.image_angle=image_angle;
		}
		ySp+=grav;
		
		//if out of bounds of rectangle, either destroy or inactivate it
		if(x<0 || x>room_width || y+lengthdir_y(sprite_width,image_angle)>oPlayer.room_yMin){
			if(y+lengthdir_y(sprite_width,image_angle)>oPlayer.room_yMin){
				inactive=true;
				array_push(oWatcher.arrows,id);//add to list of watchers arrows
			}
			else{instance_destroy();}
		}
		
		if(place_meeting(x,y,oCyberduck)){//hit an enemy
			embedded=true;
			myEnemy=instance_place(x,y,oCyberduck); //store enemy that was hit in variable
			embeddedX=myEnemy.x-x;
			embeddedY=myEnemy.y-y;
			//if(myEnemy.knockedback){instance_destroy();}
			if(myEnemy!=noone && !myEnemy.knockedback){
				damage=sqrt(power(xSp-myEnemy.xSp,2)+power(ySp-myEnemy.ySp,2))/90; // damage & knockback relative to speed of arrow
				knockback=16*damage;
				dealDamage(damage,knockback,myEnemy);//damage, knockback, health bar
			}
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