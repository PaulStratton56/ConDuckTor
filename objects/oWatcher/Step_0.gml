//@Global Game Scripts

//Game complete!
if(!instance_exists(oCyberduck)){
	game_restart();
}
if(instance_number(oFakeArrow)>1){
	instance_destroy(arrows[0])
	array_delete(arrows,0,1);
}
