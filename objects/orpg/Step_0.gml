//update position and orientation
x=oPlayer.x
y=oPlayer.y
image_angle=oPlayer.image_angle;
image_yscale=sign(oPlayer.image_yscale)*scalefactor;

fire=keyboard_check_pressed(vk_space);

delay--;
if(fire && delay<0){
	delay=120;//reset fire rate
	//create rocket, define initial conditions
	with(instance_create_layer(x+lengthdir_x(759*scalefactor+64,image_angle),y+lengthdir_y(759*scalefactor+64,image_angle),"Weapons",oRocket)){
		direction=other.image_angle;
		image_angle=direction;
		speed=15;
	}
	//apply recoil to player
	oPlayer.xSp-=lengthdir_x(recoil,image_angle);
	oPlayer.ySp-=lengthdir_y(recoil,image_angle);
}