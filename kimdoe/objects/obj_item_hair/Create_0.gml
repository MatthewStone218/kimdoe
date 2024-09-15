/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
function gain()
{
	instance_create_depth(x,y,depth-200,obj_ef_gain_item);
	with(obj_player)
	{
		gain_hair();
	}
	
	instance_destroy();
}

function set_scale(_time)
{
	image_xscale = ease_get_val(ease_out_cubic(_time),0,1);
	image_yscale = ease_get_val(ease_out_cubic(_time),0,1);
}

time = 0;