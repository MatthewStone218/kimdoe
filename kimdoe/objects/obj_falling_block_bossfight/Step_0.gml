/// @description Insert description here
// You can write your code in this editor

block_y += yspd;
yspd += 0.5;

if(block_y >= 0)
{
	var _x = obj_player.x;
	var _y = obj_player.y;
	
	obj_player.x = obj_player.s_x;
	obj_player.y = obj_player.s_y;
	
	if(place_meeting(x,y,obj_player))
	{
		with(obj_player){kill_self();}
	}
	
	obj_player.x = _x;
	obj_player.y = _y;
	
	instance_create_depth(x,y,-y,obj_block_bossfight,{image_index: image_index});
}