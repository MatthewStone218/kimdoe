// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function room_goto_f(rm, next_state){
	if(!instance_exists(obj_room_changer))
	{
		var incy = instance_create_depth(0,0,-1000,obj_room_changer,{next_state: next_state});
		incy.next_room = rm;
	}
}