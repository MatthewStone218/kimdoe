/// @description Insert description here
// You can write your code in this editor
x = obj_boss.x+lengthdir_x(obj_boss.helicopter_dis,obj_boss.helicopter_dir+dir);
y = obj_boss.y-boss_height+lengthdir_y(obj_boss.helicopter_dis,obj_boss.helicopter_dir+dir);

if(global.state == ST.GAME)
{
	var _x = obj_player.x;
	var _y = obj_player.y;
	
	obj_player.x = obj_player.s_x;
	obj_player.y = obj_player.s_y;
	
	if(collision_line(obj_boss.x,obj_boss.y-boss_height,x,y,obj_player,false,false))
	{
		with(obj_player)
		{
			kill_self();
		}
	}
	
	obj_player.x = _x;
	obj_player.y = _y;
}	