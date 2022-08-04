#region //debugging
	draw_self();
	draw_set_color(0);
	if(oWatcher.debugging){
		draw_text(x-30,y-75, "Debugging Mode");
		for(var i =0;i<instance_number(oCyberduck);i++){
			currentEnemy =instance_find(oCyberduck,i);
			draw_text(currentEnemy.x,currentEnemy.y-150,currentEnemy.airborne);
		}
	}
#endregion


//outline for health bar for comparison

//comments and code cleanup
