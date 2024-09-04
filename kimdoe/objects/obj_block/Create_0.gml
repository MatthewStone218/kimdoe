/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

image_index = irandom(sprite_get_number(sprite_index)-1);

s_x = x;
s_y = y;

x_prev = x;
y_prev = y;

x_goal = x;
y_goal = y;

action = "none";
action_time = 1;

bib = 0;

function kicked(dir)
{	
	switch(dir)
	{
		case "left":
			if(position_meeting(x-global.cell_width,y,obj_blocks))
			{
				bib = 25;
			}
			else
			{
				action = "kicked";
				action_time = 0;
	
				x_prev = x;
				y_prev = y;
				
				x -= global.cell_width;
	
				x_goal = x;
				y_goal = y;
			}
		break;
		
		case "right":
			if(position_meeting(x+global.cell_width,y,obj_blocks))
			{
				bib = 25;
			}
			else
			{
				action = "kicked";
				action_time = 0;
	
				x_prev = x;
				y_prev = y;
				
				x += global.cell_width;
	
				x_goal = x;
				y_goal = y;
			}
		break;
		
		case "up":
			if(position_meeting(x,y-global.cell_width,obj_blocks))
			{
				bib = 25;
			}
			else
			{
				action = "kicked";
				action_time = 0;
	
				x_prev = x;
				y_prev = y;
				
				y -= global.cell_width;
	
				x_goal = x;
				y_goal = y;
			}
		break;
		
		case "down":
			if(position_meeting(x,y+global.cell_width,obj_blocks))
			{
				bib = 25;
			}
			else
			{
				action = "kicked";
				action_time = 0;
	
				x_prev = x;
				y_prev = y;
				
				y += global.cell_width;
	
				x_goal = x;
				y_goal = y;
			}
		break;
	}
}

function set_position()
{
	s_x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	s_y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
}