/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

is_in_range = true;
checked = false;

function reset()
{
	is_in_range = true;
	checked = false;
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