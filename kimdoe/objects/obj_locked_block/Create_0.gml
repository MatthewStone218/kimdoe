/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

depth = -y;

function unlock()
{
	global.key--;
	instance_create_depth(x,y,depth-1000,obj_ef_gain_item);
	instance_destroy();
}