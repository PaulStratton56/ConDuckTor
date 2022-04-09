x=oPlayer.x
y=oPlayer.y
image_angle=oPlayer.image_angle;

#region //destroyes enemies in the correct sector of circle of sword swing
	var enemiesinRange = ds_list_create();
	var numinRange= collision_circle_list(x,y,oSword.sprite_width,oCyberduck,false,true,enemiesinRange,false);
	for (var i = 0; i<numinRange;i++){
		angleToEnemy=point_direction(x,y,ds_list_find_value(enemiesinRange,i).x,ds_list_find_value(enemiesinRange,i).y);
		if(((image_angle<270 || angleToEnemy>270)&&image_angle<angleToEnemy && angleToEnemy<image_angle+90) || (image_angle>270 && image_angle<angleToEnemy+360 && angleToEnemy+360<image_angle+90)){
			instance_destroy(ds_list_find_value(enemiesinRange,i));//sign(image_yscale)*
		}
	}
	ds_list_destroy(enemiesinRange);
#endregion
//still small bug when facing left and swinging up, I think cause of y axis and sword flipping


if (image_index>=sprite_get_number(sSword)-1){//needs work
	instance_destroy();
}
