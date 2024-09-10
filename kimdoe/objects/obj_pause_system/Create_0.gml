/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

prev_state = ST.MAIN;

register_click_func(
	function(){return global.state != ST.MAIN && input_check_pressed("pause");},
	function()
	{
		if(global.state == ST.PAUSE)
		{
			global.state = prev_state;
			obj_ui_pause_resume.focused = true;
			obj_ui_pause_goto_main.focused = false;
		}
		else
		{
			prev_state = global.state;
			global.state = ST.PAUSE;
			obj_ui_pause_resume.focused = true;
			obj_ui_pause_goto_main.focused = false;
		}
	}
)