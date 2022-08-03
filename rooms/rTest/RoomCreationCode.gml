
//Change this variable to alter the room and the number of cars.
cartNumber = 7;



//Room and cart generation
room_width = (1700*cartNumber);

for(var i =0;(1900*i+300) <= room_width;i++){
	instance_create_layer(1700*i+900,room_height-180,"Instances_Carts",oCart);
	if(i!=1){instance_create_layer(1900*i+300,room_height-220,"Enemies",oCyberduck);}
}

oPlayer.room_yMin=oCart.y;//when game switches to this room, player updates room_yMin variable

//create health bar
playerHealth = instance_create_layer(400,room_height-20,"Player",oHealthBar);
playerHealth.image_xscale=oPlayer.myHealth;
playerHealth.playersHealth=true;