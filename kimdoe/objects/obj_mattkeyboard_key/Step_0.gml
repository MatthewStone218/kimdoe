/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(global.__mattkeyboard_showen__)
{
	if(global.__mattkeyboard_showen_frame__ < 0 and mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,id))
	{
		clicked = true;
	}
	
	if(clicked and mouse_check_button_released(mb_left) and position_meeting(mouse_x,mouse_y,id))
	{
		click();
	}
	
	if(mouse_check_button(mb_left) and position_meeting(mouse_x,mouse_y,id))
	{
		image_blend = #555555;
	}
	else
	{
		image_blend = #FFFFFF;
		clicked = false;
	}
}
else
{
	clicked = false;
}

if(global.__mattkeyboard_showen__)
{
	y += (ystart-y)/5;
}
else
{
	y += (ystart+obj_mattkeyboard_bg.sprite_height+10-y)/5;
}