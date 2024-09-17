/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

function kicked(dir)
{	
	var _moved = false;
	var _dir = 0;
	
	switch(dir)
	{
		case "left":
			var _dir = 180;
		break;
		case "right":
			var _dir = 0;
		break;
		case "up":
			var _dir = 90;
		break;
		case "down":
			var _dir = 270;
		break;
	}
	
	instance_create_depth(x,y,depth,obj_kicked_block_bossfight,{direction: _dir});
	
	instance_destroy();
}

function die()
{
	repeat(6){instance_create_depth(x,y,depth,obj_ef_block_part)};
	instance_destroy();
}