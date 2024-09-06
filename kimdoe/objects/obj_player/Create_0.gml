/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

action_time = 1;

action = "none";
action_input = "none";

x_prev = x;
y_prev = y;

x_goal = x;
y_goal = y;

dir = "down";

function set_position()
{
	x = ease_get_val(ease_out_cubic(action_time),x_prev,x_goal);
	y = ease_get_val(ease_out_cubic(action_time),y_prev,y_goal);
}

function create_hair()
{
	if(instance_exists(obj_hair))
	{
		with(obj_hair)
		{
			if(child == noone)
			{
				var _inst = instance_create_depth(x,y,depth,obj_hair);
				_inst.parent = id;
				child = _inst;
				break;
			}
		}
	}
	else
	{
		var _inst = instance_create_depth(x,y,depth,obj_hair);
		_inst.parent = id;
		child = _inst;
	}
}

function pull_hair()
{
	with(obj_hair)
	{
		if(child == noone)
		{
			follow();
			break;
		}
	}
}