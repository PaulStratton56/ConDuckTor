x=oPlayer.x
y=oPlayer.y

image_angle=oPlayer.image_angle;
image_yscale=sign(oPlayer.image_yscale)*scalefactor;

fire=keyboard_check_pressed(vk_space);
delay--;
if(fire && delay<0){
	delay=120;
	with(instance_create_layer(x+lengthdir_x(759*scalefactor+64,image_angle),y+lengthdir_y(759*scalefactor+64,image_angle),"Weapons",oRocket)){
		direction=other.image_angle;
		image_angle=direction;
		speed=15;
	}
	oPlayer.xSp-=lengthdir_x(recoil,image_angle);
	//oPlayer.y-=1;//temp solution, the player's yspeed gets reset to 0 because of clamp line in oPlayer step before it can take effect here
	oPlayer.ySp-=lengthdir_y(recoil,image_angle);
}