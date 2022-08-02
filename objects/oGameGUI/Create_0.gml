/// @description Insert description here
// You can write your code in this editor
#macro MAIN 0
#macro SETTINGS 1

//Pause State
pause = false;

// Main Menu
menu[MAIN][0] = "Resume";
menu[MAIN][1] = "Options";
menu[MAIN][2] = "Exit";

//options sub menu

menu[SETTINGS][0] = "Music";
menu[SETTINGS][1] = "Sound";
menu[SETTINGS][2] = "Grass";
menu[SETTINGS][3] = "Back";


currentIndex = 0;//Position in menu
currentSubMenu = 0; //subMenu Position
