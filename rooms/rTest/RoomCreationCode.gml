n=5
for (i=0;i<n;i++){
	instance_create_layer(275*i+128,590,"Instances_Carts",oCart);
	instance_create_layer(275*i+128,550,"Enemies",oCyberduck);
}
instance_create_layer(32,550,"IMain",oPlayer);
