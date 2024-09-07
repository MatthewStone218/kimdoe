// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function get_hair_radius(num){
	var _max_radius = 9;
	var _min_radius = 3;
	return (_min_radius-_max_radius)*num/instance_number(obj_hair) + _max_radius;
}