/// @description Insert description here
// You can write your code in this editor

var _dir = point_direction(x,y,obj_boss.x,obj_boss.y-boss_height);

draw_set_color(c_black);

draw_triangle(x,y,obj_boss.x+lengthdir_x(2,_dir+90),obj_boss.y-boss_height+lengthdir_y(2,_dir+90),obj_boss.x+lengthdir_x(5,_dir-90),obj_boss.y-boss_height+lengthdir_y(5,_dir-90),false);