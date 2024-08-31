// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function unlock_stage(num){
	ini_open("save.ini");

	ini_write_real("system","cleared_stage",num);

	ini_close();
}