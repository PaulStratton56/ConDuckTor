// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function dealDamage(damage,knockback,target){//deals damage, knockback, creates healthbar above specified target, 
	with(target){
			myHealth-=damage;
			knockedback=true;
			ySp=-knockback;
			xSp=knockback*sign(x-oPlayer.x);
			mxSp=abs(xSp);
			healthbar = instance_create_layer(x,y-30,"Enemies",oHealthBar);
			healthbar.image_xscale=myHealth;
			healthbar.myEnemy=id;
	}
}