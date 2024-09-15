/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

depth = 0;

struct_now = {};

function set_dialogue(struct)
{
	struct_now = struct;
	global.state = ST.DIALOGUE;
	
	if(!instance_exists(obj_ui_dialogue_bg_1))
	{
		instance_create_depth(0,0,-400,obj_ui_dialogue_bg_1);
	}
	if(!instance_exists(obj_ui_dialogue_bg_2))
	{
		instance_create_depth(0,0,-410,obj_ui_dialogue_bg_2);
	}
	if(!instance_exists(obj_ui_dialogue_bg_3))
	{
		instance_create_depth(0,0,-450,obj_ui_dialogue_bg_3);
	}
		
	if(variable_struct_exists(struct_now,"bg"))
	{
		obj_ui_dialogue_bg_1.sprite_index = struct_now.bg;
	}

	instance_destroy(obj_ui_dialogue_text);
	instance_destroy(obj_ui_dialogue_choice);
	instance_destroy(obj_ui_dialogue_name);
	
	if(variable_struct_exists(struct_now,"no_belt") and struct_now.no_belt)
	{
		instance_destroy(obj_ui_dialogue_bg_1);
		instance_destroy(obj_ui_dialogue_bg_3);
	}
	
	if(variable_struct_exists(struct_now,"type"))
	{
		if(variable_struct_exists(struct_now,"image"))
		{
			var _spr = -1;
			with(obj_ui_dialogue_character)
			{
				_spr = sprite_index;
			}
			
			if(_spr != struct_now.image)
			{
				instance_destroy(obj_ui_dialogue_character);
				instance_create_depth(960,540,-440,obj_ui_dialogue_character,{sprite_index: struct_now.image});
			}
		}
		else
		{
			with(obj_ui_dialogue_character)
			{
				die();
			}
		}
		
		if(variable_struct_exists(struct_now,"name"))
		{
			instance_create_depth(960,750,-480,obj_ui_dialogue_name,{text: struct_now.name});
		}
		
		if(struct_now.type == "text")
		{
			instance_create_depth(960,900,-480,obj_ui_dialogue_text,{text: struct_now.text});
		}
		else if(struct_now.type == "choice")
		{
			var _prev_obj = noone;

			for(var i = 0; i < array_length(struct_now.choice); i++)
			{
				var _inst = instance_create_depth(960,900-(array_length(struct_now.choice)-1)*110/2+i*110,-480,obj_ui_dialogue_choice,{text: struct_now.choice[i][0], my_func: struct_now.choice[i][1]});
	
				if(i == 0)
				{
					_inst.focused = true;
					_inst.focus();
				}
				else
				{
					_prev_obj.navigation.down = _inst;
					_inst.navigation.up = _prev_obj;
				}
	
				_prev_obj = _inst;
			}
		}
		else if(struct_now.type == "code")
		{
			struct_now.func();
		}
	}
}

function kill_dialogue()
{
	with(obj_ui_dialogue_bg_1){die();}
	with(obj_ui_dialogue_bg_2){die();}
	with(obj_ui_dialogue_bg_3){die();}
	with(obj_ui_dialogue_character){die();}
	instance_destroy(obj_ui_dialogue_name);
	instance_destroy(obj_ui_dialogue_text)
	instance_destroy(obj_ui_dialogue_choice)
}

register_click_func(
	function(){ return global.state == ST.DIALOGUE && input_check_pressed("ok"); }
	,
	function(){
		if(variable_struct_exists(struct_now,"type"))
		{
			if(struct_now.type == "text")
			{
				set_dialogue(struct_now.next_struct());
			}
		}
	}
)