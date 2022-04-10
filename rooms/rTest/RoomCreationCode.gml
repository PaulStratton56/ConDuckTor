
//Change this variable to alter the room and the number of cars.
cartNumber = 7;

//Room and cart generation
room_width = (275*cartNumber)+40;
for(var i =0;(275*i+128) <= room_width;i++){
	instance_create_layer(275*i+148,room_height-180,"Instances_Carts",oCart);
	instance_create_layer(275*i+148,room_height-220,"Enemies",oCyberduck);
}
instance_create_layer(32,550,"IMain",oPlayer);
