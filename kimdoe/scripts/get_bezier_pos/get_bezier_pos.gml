// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function get_bezier_pos(t,x1,y1,x2,y2,x3,y3){
	var _x1 = (x2-x1)*t + x1;
	var _y1 = (y2-y1)*t + y1;
	
	var _x2 = (x3-x2)*t + x2;
	var _y2 = (y3-y2)*t + y2;
	
	var _x3 = (_x2-_x1)*t + _x1;
	var _y3 = (_y2-_y1)*t + _y1;
	
	return [_x3,_y3];
}