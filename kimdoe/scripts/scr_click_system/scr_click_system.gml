// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

#macro __click_system_manager__ obj_click_system_manager
global.__click_system_funcs__ = [];

instance_create_depth(0,0,0,__click_system_manager__);

function register_click_func(condition,func){
	
	var _arr = [condition,func];

	array_push(global.__click_system_funcs__,_arr);
	
	return _arr;
}

function remove_click_func(func)
{
	array_delete(global.__click_system_funcs__,array_get_index(global.__click_system_funcs__,func),1);
}

function click_system_step()
{
	for(var i = 0; i < array_length(global.__click_system_funcs__); i++)
	{
		if(!instance_exists(method_get_self(global.__click_system_funcs__[i][1])))
		{
			array_delete(global.__click_system_funcs__,i,1);
			i--;
		}
	}
	
	array_sort(global.__click_system_funcs__,function(a,b){
		var _result = method_get_self(a[1]).depth - method_get_self(b[1]).depth;
		if(_result == 0)
		{
			return real(method_get_self(b[1]).id) - real(method_get_self(a[1]).id);
		}
		return _result;
	})
	
	for(var i = 0; i < array_length(global.__click_system_funcs__); i++)
	{
		if(global.__click_system_funcs__[i][0]())
		{
			global.__click_system_funcs__[i][1]();
			break;
		}
	}
}