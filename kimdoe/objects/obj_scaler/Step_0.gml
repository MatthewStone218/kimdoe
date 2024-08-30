/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다



if(os_browser != browser_not_a_browser)
{
	if(!view_enabled)
	{
		view_visible[0] = true;
		view_enabled = true;
		camera_apply(view_camera[0]);
		camera_set_view_size(view_camera[0],base_width/2,base_height/2);
		view_set_wport(view_camera[0],base_width);
		view_set_hport(view_camera[0],base_height);
	}

	if (browser_width != width or browser_height != height or density_prev == density)
	{
	    width = browser_width; width = round(width);
	    height = browser_height; height = round(height);
	
		var _aspect = (base_width / base_height);
	
		if(mode == SCALER.HV)
		{
			if ((width / _aspect) > height)
			{
				window_set_size((height *_aspect)*density, height*density);
			}
			else
			{
				window_set_size(width*density, (width / _aspect)*density);
			}
		}
		else
		{
			window_set_size(width*density, height*density);
		
			if(mode == SCALER.H)
			{
				camera_set_view_size(view_camera[0],base_width/2,(base_width/2)*(height/width));
			}
			else
			{
				camera_set_view_size(view_camera[0],(base_height/2)/(height/width),base_height/2);
			}
		}
	
		var _x = 0;
		if(align == SCALER.LEFT or align == SCALER.TOP){_x = 0;}
		else if(align == SCALER.CENTER){_x = median(0,(room_width/2)-(CM_W/2),room_width-CM_W);}
		else if(align == SCALER.MIDDLE){_x = median(0,(room_height/2)-(CM_H/2),room_height-CM_H);}
		else if(align == SCALER.RIGHT){_x = room_width-width*((base_height/2)/height);}
		else if(align == SCALER.BOTTOM){_x = room_height-height*((base_width/2)/width);}
	
		switch mode
		{
			case SCALER.H:
				camera_set_view_pos(view_camera[0],0,_x);
			break;
			case SCALER.V:
				camera_set_view_pos(view_camera[0],_x,0);
			break;
		}
	
		if (center)
		{
			window_center();
		}
	
		if(mode == SCALER.HV)
		{
			surface_resize(application_surface, window_get_width()*density, window_get_height()*density);
			browser_set_zoom(window_handle(),window_get_width()/density, window_get_height()/density);
		}
		else
		{
			surface_resize(application_surface, width*density, height*density);
			browser_set_zoom(window_handle(),width/density,height/density);
		}
	}
}
else
{
	if(!view_enabled)
	{
		view_visible[0] = true;
		view_enabled = true;
		camera_apply(view_camera[0]);
		camera_set_view_size(view_camera[0],base_width/2,base_height/2);
		view_set_wport(view_camera[0],base_width/2);
		view_set_hport(view_camera[0],base_height/2);
	}
}