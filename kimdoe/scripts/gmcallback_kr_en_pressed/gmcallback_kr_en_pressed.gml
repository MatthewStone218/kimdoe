// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function gmcallback_kr_en_pressed(){
	if(global.__kortext_language == "en")
	{
		global.__kortext_language = "kr";
	}
	else
	{
		global.__kortext_language = "en";
	}
}