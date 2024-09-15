/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

is_in_range = true;
checked = false;
no_spike = false;

function reset()
{
	is_in_range = true;
	checked = false;
	no_spike = false;
}

function check()
{
	if(!checked && !position_meeting(x,y,obj_hair))
	{
		checked = true;
		is_in_range = false;
		
		if(position_meeting(x-global.cell_width,y,obj_player_attack_tile)){instance_place(x-global.cell_width,y,obj_player_attack_tile).check();}
		if(position_meeting(x+global.cell_width,y,obj_player_attack_tile)){instance_place(x+global.cell_width,y,obj_player_attack_tile).check();}
		if(position_meeting(x,y-global.cell_width,obj_player_attack_tile)){instance_place(x,y-global.cell_width,obj_player_attack_tile).check();}
		if(position_meeting(x,y+global.cell_width,obj_player_attack_tile)){instance_place(x,y+global.cell_width,obj_player_attack_tile).check();}
	}
}

function get_is_in_range(xx,yy)
{
	return (position_meeting(x+global.cell_width*xx,y+global.cell_width*yy,obj_player_attack_tile) && instance_place(x+global.cell_width*xx,y+global.cell_width*yy,obj_player_attack_tile).is_in_range);
}

function get_neighbor_number()
{
	return (
		get_is_in_range(-1,0)
		+ get_is_in_range(1,0)
		+ get_is_in_range(0,-1)
		+ get_is_in_range(0,1)
		
		+ ((get_is_in_range(-1,0) || get_is_in_range(0,-1)) && get_is_in_range(-1,-1))
		+ ((get_is_in_range(1,0) || get_is_in_range(0,-1)) && get_is_in_range(1,-1))
		+ ((get_is_in_range(-1,0) || get_is_in_range(0,1)) && get_is_in_range(-1,1))
		+ ((get_is_in_range(1,0) || get_is_in_range(0,1)) && get_is_in_range(1,1))
	)
}