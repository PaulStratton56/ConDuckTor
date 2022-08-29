
//Change this variable to alter the room and the number of cars.
global.cartNumber = 7;
global.room_yMin=room_height-250;

instance_create_layer(32,0,"Camera",oCamera);
instance_create_layer(700,700,"PauseMenu",oMenu);

//Room and cart generation
room_width = 1550*global.cartNumber+29;
for(var i = 0;i < global.cartNumber;i++){//current cart width is 1542
	instance_create_layer(1550*i+800,global.room_yMin,"Instances_Carts",oCart);
	instance_create_layer(1550*i+800,global.room_yMin,"Enemies",oCyberduck);
}

//create player health bar
with(instance_create_layer(400,room_height-20,"Player",oHealthBar)){
	image_xscale=oPlayer.myHealth;
	playersHealth=true;
}
oPlayer.y=global.room_yMin;//no fall when switching rooms
oPlayer.ground=global.room_yMin-abs(oPlayer.sprite_height/2);//update ground