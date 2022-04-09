
//Change these to resize the window
wWidth = 1366;
wHeight = 768;

//This variable dictates which object the camera is following
//You can reference it anywhere with oCamera.follow
follow = oPlayer;

//Camera junk (DO NOT TOUCH UNLESS YOU KNOW)
camera = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(wWidth,wHeight,1,10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;
view_xport[0] = 0;
view_yport[0] = 0;
window_set_size(wWidth,wHeight);
surface_resize(application_surface,wWidth,wHeight);

xTo = x;
yTo = y;
