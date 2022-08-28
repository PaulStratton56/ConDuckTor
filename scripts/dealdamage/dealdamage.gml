// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function dealDamage(damage,knockback,angle,target){//angle in degrees, target id (not object)
	with(target){//manipulate variables as target
		tempInvincibility=10; //10 frames of invincibility because sword sprite is 9 frames
		myHealth-=damage;
		ySp=lengthdir_y(knockback,angle);//impart knockback
		xSp+=lengthdir_x(knockback,angle);
		with(instance_create_layer(x-30,y-30,"Enemies",oHealthBar)){//create healthbar above target hit
			image_xscale=other.myHealth;//scale healthbar based on health
			myEnemy=other.id;//store which enemy the created healthbar represents
		}
	}
}