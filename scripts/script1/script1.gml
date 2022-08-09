// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function dealDamage(damage,knockback,angle,target){//deals damage, knockback, creates healthbar above specified target, 
	with(target){
		tempInvincibility=10; //10 frames of invincibility because sword sprite is 9 frames
		myHealth-=damage;
		ySp=lengthdir_y(knockback,angle);
		xSp+=lengthdir_x(knockback,angle);
		with(instance_create_layer(x-30,y-30,"Enemies",oHealthBar)){
			image_xscale=other.myHealth;
			myEnemy=other.id;
		}
	}
}