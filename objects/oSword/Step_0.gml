x=oPlayer.x
y=oPlayer.y
victim = instance_place(x,y,oCyberduck);
if(victim!=noone && !victim.knockedback){//damage, knockback, healthbar
	knockback=abs(oPlayer.xSp-victim.xSp)/4+4;
	damage=point_distance(x,y,victim.x,victim.y)*sqrt(abs(oPlayer.xSp-victim.xSp)+1)/750;
	//damage dependent on distance from player and the relative speed of the swing
	dealDamage(damage,knockback,victim);
}

if (image_index>=sprite_get_number(sSword)-1){
	instance_destroy();
}
