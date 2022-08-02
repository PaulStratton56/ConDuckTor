/// @description Insert description here
// You can write your code in this editor
#macro MAIN 0
#macro SETTINGS 1

global.settingsMap = ds_map_create();

ds_map_add(global.settingsMap, "mapMusic", [5, [0,10]])
ds_map_add(global.settingsMap, "mapSound", [5, [0,10]])
ds_map_add(global.settingsMap, "mapGrass", ["0", ["Untouched", "Touched"]])

//holding Keys
time_held_left = 0;
time_held_right = 0;

//Pause State
pause = false;


// Main Menu
menu[MAIN][0] = "Resume";
menu[MAIN][1] = "Options";
menu[MAIN][2] = "Exit";

//options sub menu

menu[SETTINGS][0] = ["Music - ", "mapMusic"];
menu[SETTINGS][1] = ["Sound - ", "mapSound"];
menu[SETTINGS][2] = ["Grass - ", "mapGrass"];
menu[SETTINGS][3] = "Back";


currentIndex = 0;//Position in menu
currentSubMenu = 0; //subMenu Position
