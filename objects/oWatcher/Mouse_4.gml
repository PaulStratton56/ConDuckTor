//toggles debugging mode when you click watcher
debugging=!debugging;
oPlayer.keysCollected += (debugging*2-1)*global.cartNumber;
game_set_speed(60*(!debugging)+debugging*10,gamespeed_fps);
if(instance_exists(oBow)){oBow.drawspeed=game_get_speed(gamespeed_fps)/60;}