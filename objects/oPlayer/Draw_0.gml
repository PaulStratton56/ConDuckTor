#region //debugging
	draw_self();
	draw_set_color(0);
	if(oWatcher.debugging){
		draw_text(x,y-50, "Debugging Mode");
		for(var i =0;i<instance_number(oCyberduck);i++){
			currentEnemy =instance_find(oCyberduck,i);
			draw_text(currentEnemy.x,currentEnemy.y-150,currentEnemy.myHealth);
		}
		if(instance_exists(oBow)){
			draw_text(x,y-300,oBow.image_index>=1);
		}
		if(instance_exists(oArrow)){
			draw_text(x,y-250,oArrow.xSp);
			draw_text(x,y-200,oArrow.ySp);
			draw_text(x,y-150,oArrow.damage);
		}
	}
#endregion


//outline for health bar for comparison

//comments and code cleanup
