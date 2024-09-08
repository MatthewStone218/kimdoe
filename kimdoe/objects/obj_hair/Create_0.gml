/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

child = noone;
parent = noone;

move_time = 1;
hair_x = x;
hair_y = y;
x_prev = x;
y_prev = y;
x_goal = x;
y_goal = y;

function die(chain_parent)
{
	repeat(100)
	{
		instance_create_depth(x+random_range(-20,20),y+random_range(-20,20),depth,obj_ef_hair_die);
	}
	
	if(child != noone)
	{
		with(child)
		{
			die(false);
		}
	}
	
	if(chain_parent)
	{
		parent.set_death_timer(5);
	}
	
	instance_destroy();
}

function set_death_timer(frame)
{
	alarm[0] = frame;
}

function follow()
{
	move_time = 0;
	x_prev = x;
	y_prev = y;
	x_goal = parent.x;
	y_goal = parent.y;
	
	x = parent.x;
	y = parent.y;
	if(parent.object_index == obj_hair)
	{
		with(parent){follow();}
	}
}

function draw_hair()
{
	if(global.state == ST.DYING)
	{
		draw_set_color(c_white);
	}
	else
	{
		draw_set_color(c_black);
	}
	
	draw_set_alpha(1);
	
	if(parent.hair_index == 0)
	{
		var _accuracy = 10;
		
		var _pos_prev = [hair_x,hair_y];
		
		for(var i = 1; i <= _accuracy; i++)
		{
			var _pos = get_bezier_pos(i/_accuracy,hair_x,hair_y,parent.hair_x,parent.hair_y+30,parent.hair_x,parent.hair_y);
			var _radius_1 = (get_hair_radius(0)-get_hair_radius(1))*(i-1)/_accuracy + get_hair_radius(1);
			var _radius_2 = (get_hair_radius(0)-get_hair_radius(1))*i/_accuracy + get_hair_radius(1);
			
			draw_hair_part(_pos_prev[0],_pos_prev[1],_radius_1,_pos[0],_pos[1],_radius_2);
			
			_pos_prev = _pos;
		}
	}
	else
	{
		var _radius = get_hair_radius(hair_index);
		var _parent_radius = get_hair_radius(parent.hair_index);
	
		draw_hair_part(hair_x,hair_y,_radius,x_goal,y_goal,_parent_radius);
		draw_hair_part(x_goal,y_goal,_radius,parent.hair_x,parent.hair_y,_parent_radius);
	}
}

function draw_hair_part(x1,y1,r1,x2,y2,r2)
{
	draw_circle(x1,y1,r1,0);

	draw_triangle(
		x1+lengthdir_x(r1,point_direction(x1,y1,x2,y2)+90)
		,y1+lengthdir_y(r1,point_direction(x1,y1,x2,y2)+90)
		,x2+lengthdir_x(r2,point_direction(x1,y1,x2,y2)+90)
		,y2+lengthdir_y(r2,point_direction(x1,y1,x2,y2)+90)
		,x1+lengthdir_x(r1,point_direction(x1,y1,x2,y2)-90)
		,y1+lengthdir_y(r1,point_direction(x1,y1,x2,y2)-90)
		,0
	)

	draw_triangle(
		x2+lengthdir_x(r2,point_direction(x1,y1,x2,y2)-90)
		,y2+lengthdir_y(r2,point_direction(x1,y1,x2,y2)-90)
		,x2+lengthdir_x(r2,point_direction(x1,y1,x2,y2)+90)
		,y2+lengthdir_y(r2,point_direction(x1,y1,x2,y2)+90)
		,x1+lengthdir_x(r1,point_direction(x1,y1,x2,y2)-90)
		,y1+lengthdir_y(r1,point_direction(x1,y1,x2,y2)-90)
		,0
	)
}