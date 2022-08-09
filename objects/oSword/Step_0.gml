x=oPlayer.x
y=oPlayer.y
victim = instance_place(x,y,oCyberduck);
if(victim!=noone && victim.tempInvincibility<0){//damage, knockback, healthbar
	knockback=abs(oPlayer.xSp-victim.xSp)/4+8;
	damage=point_distance(x,y,victim.x,victim.y)*sqrt(abs(oPlayer.xSp-victim.xSp)+6)/750;
	//damage dependent on distance from player and the relative speed of the swing
	
	#region //calculate angle of knockback
		switch (image_index){
			case 0:angleOfStrike=image_angle+67*image_yscale;break;
			case 1:angleOfStrike=image_angle+52*image_yscale;break;
			case 2:angleOfStrike=image_angle+35*image_yscale;break;
			case 3:angleOfStrike=image_angle+25*image_yscale;break;
			case 4:angleOfStrike=image_angle+15*image_yscale;break;
			case 5:angleOfStrike=image_angle+ 7*image_yscale;break;
			case 6:angleOfStrike=image_angle;break;
			case 7:angleOfStrike=image_angle-15*image_yscale;break;
			case 8:angleOfStrike=image_angle-15*image_yscale;break;
		}
		angle=angleOfStrike-90*image_xscale*image_yscale;
	#endregion
	
	dealDamage(damage,knockback,angle,victim);
}

if (image_index>=sprite_get_number(sSword)-1){
	instance_destroy();
}
