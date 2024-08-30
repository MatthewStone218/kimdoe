/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

focused = false;

register_click_func(
	function(){ return focused },
	function()
	{
		if(input_check("ok")){ ok(); }
		else if(input_check("left")){ if(instance_exists(navigation.left)){ navigation.left.focused = true; focused = false; } }
		else if(input_check("right")){ if(instance_exists(navigation.right)){ navigation.right.focused = true; focused = false; } }
		else if(input_check("up")){ if(instance_exists(navigation.up)){ navigation.up.focused = true; focused = false; } }
		else if(input_check("down")){ if(instance_exists(navigation.down)){ navigation.down.focused = true; focused = false; } }
	}
);