//destroy trajectories if arrow they are associated with is destroyed or hits a target
if(!instance_exists(oBow) || !instance_exists(myArrow) || myArrow.embedded){
	instance_destroy();
}
