//update position
x=oPlayer.x
y=oPlayer.y

victim = instance_place(x,y,oCyberduck);//define victim
if(victim!=noone && victim.tempInvincibility<0){//attacking
	knockback=abs(oPlayer.xSp-victim.xSp)/4+8;//dependent on relative speed + c
	//damage dependent on distance from player and the relative speed of the swing
	damage=point_distance(x,y,victim.x,victim.y)*sqrt(abs(oPlayer.xSp-victim.xSp)+6)/750;
	
	#region //calculate knockback angle
		switch (image_index){//numbers dependent on angle of sword in each sprite frame
			case 0:angle=image_angle+67*image_yscale;break;
			case 1:angle=image_angle+52*image_yscale;break;
			case 2:angle=image_angle+35*image_yscale;break;
			case 3:angle=image_angle+25*image_yscale;break;
			case 4:angle=image_angle+15*image_yscale;break;
			case 5:angle=image_angle+ 7*image_yscale;break;
			case 6:angle=image_angle;break;
			case 7:angle=image_angle-15*image_yscale;break;
			case 8:angle=image_angle-15*image_yscale;break;
		}
		angle-=90*image_xscale*image_yscale;//knockback should be perpendicular to sword
	#endregion
	
	dealDamage(damage,knockback,angle,victim);//code in Scripts
}