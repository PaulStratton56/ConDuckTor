

//Change this variable to alter the room and the number of cars.
cartNumber = 5;

//Room and cart generation
room_width = (275*cartNumber)+40;
i = 0;
while((275*i+128) <= room_width){
	instance_create_layer(275*i+148,room_height-180,"Instances_Carts",oCart);
	if(i!=0){
		instance_create_layer(275*i+148,room_height-180,"Enemies",oCyberduck);
	}
	i++;
}


