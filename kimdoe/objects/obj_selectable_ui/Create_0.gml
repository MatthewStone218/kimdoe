/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

focused = false;

register_click_func(
	function(){ return global.state == my_state && focused && (input_check_pressed("ok") || input_check_pressed("left") || input_check_pressed("right") || input_check_pressed("up") || input_check_pressed("down")) },
	function()
	{
		if(input_check_pressed("ok")){ audio_stop_sound(snd_option_select); audio_play_sound(snd_option_select,1,0); ok(); }
		else if(input_check_pressed("left")){ if(instance_exists(navigation.left)){ audio_play_sound(snd_option_select,1,0); navigation.left.focused = true; navigation.left.focus(); lose_focus(); focused = false; } }
		else if(input_check_pressed("right")){ if(instance_exists(navigation.right)){ audio_play_sound(snd_option_select,1,0); navigation.right.focused = true; navigation.right.focus(); lose_focus(); focused = false; } }
		else if(input_check_pressed("up")){ if(instance_exists(navigation.up)){ audio_play_sound(snd_option_select,1,0); navigation.up.focused = true; navigation.up.focus(); lose_focus(); focused = false; } }
		else if(input_check_pressed("down")){ if(instance_exists(navigation.down)){ audio_play_sound(snd_option_select,1,0); navigation.down.focused = true; navigation.down.focus(); lose_focus(); focused = false; } }
	}
);