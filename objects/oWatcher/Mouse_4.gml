debugging=!debugging;//toggles debugging mode when you click watcher

oPlayer.keysCollected += (debugging*2-1)*global.cartNumber;//unlock all train cars in debugging mode by changing the variable the stores number of keeys collected (simple solution)
game_set_speed(60*(!debugging)+debugging*10,gamespeed_fps);//slow mo in debugging mode
if(instance_exists(oBow)){oBow.drawspeed=game_get_speed(gamespeed_fps)/60;}//update bow draw speed