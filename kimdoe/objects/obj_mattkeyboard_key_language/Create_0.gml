/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
depth = -10001;

clicked = false;

y = ystart+obj_mattkeyboard_bg.sprite_height;


function click()
{
	if(is_struct(global.__mattkeyboard_focus__))
	{
		if(global.__kortext_language == "en")
		{
			global.__kortext_language = "kr";
		}
		else
		{
			global.__kortext_language = "en";
		}
	}
}