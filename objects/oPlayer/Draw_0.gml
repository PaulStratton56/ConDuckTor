#region //debugging
	draw_self();
	draw_set_color(0);
	if(instance_exists(oSword)){
		draw_text(x+100,200,string(oSword.image_angle));
	}
	if(currentWeapon==oBow){
		draw_text(x+200,200,"Bow");
	}
	if(currentWeapon==oSword){
		draw_text(x+200,200,"Sword");
	}
	draw_text(x+300,200,string(instance_number(oArrow)));
	if(instance_exists(oBow)){
		draw_text(x+400,200,string(oBow.image_angle));
	}
	draw_text(x+500,200,string(array_length(oWatcher.arrows)))
#endregion
