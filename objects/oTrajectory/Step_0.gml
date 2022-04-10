function myArrowDestroyed(){
	if(instance_exists(id.myArrow)){
		return false;
	}
	for(var i=0;i<array_length(oWatcher.arrows);i++){
		if(id.myArrow==(oWatcher.arrows[i]).associatedArrow){
			return false;
		}
	}
	return true;
}

if(!instance_exists(oBow) || myArrowDestroyed()){
	instance_destroy();
}

