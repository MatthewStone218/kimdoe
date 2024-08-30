/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(!get_mattkeyboard_showen())
{
	if(mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,id))
	{
		with(obj_textbox){focused = false;}
		focused = true;
		keyboard_string = "";
		show_mattkeyboard();
		set_mattkeyboard_focus(text)
	}
}
	
if(focused)
{
	text.input(keyboard_string);
	if(keyboard_check(vk_backspace)){text.input(-1);}
	keyboard_string = "";
}