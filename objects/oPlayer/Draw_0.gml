
#region //debugging
	draw_self();
	if(instance_exists(oSword)){
		draw_text(100,200,string(oSword.image_angle));
	}
	if(currentWeapon==oBow){
		draw_text(200,200,"Bow");
	}
	if(currentWeapon==oSword){
		draw_text(200,200,"Sword");
	}
	draw_text(300,200,string(instance_number(oArrow)));
#endregion

