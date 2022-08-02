//destroy trajectories if arrow they are associated with is destroyed or hits a target
if(!instance_exists(oBow) || !instance_exists(id.myArrow) || id.myArrow.embedded){
	instance_destroy();
}
