// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function ease_out_back(time){
	var c1 = 1.70158;
	var c3 = c1 + 1;

	return 1 + c3 * power(time - 1, 3) + c1 * power(time - 1, 2);
}