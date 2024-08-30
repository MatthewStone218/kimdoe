// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function draw_text_kor_transformed(xx,yy,text,xscale,yscale,sep = 39){
	
	var _x = 0;
	var _y = 0;
	
	var ha = draw_get_halign();
	var va = draw_get_valign();
	
	draw_set_font(ft_super_0);
	
	if(ha == fa_center){_x = -string_width_ext(text,sep,100000)*xscale*0.5;}
	else if(ha == fa_right){_x = -string_width_ext(text,sep,100000)*xscale;}
	
	//if(va == fa_middle){_y = -string_height_ext(text,sep,100000)*yscale/2;}
	//else if(va == fa_bottom){_y = -string_height_ext(text,sep,100000)*yscale;}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	for(var i = 0; i < string_length(text); i++)
	{
		var str_prev = string_copy(text,1,i);
		draw_set_font(ft_super_0);
		var width = string_width(str_prev)*xscale;
		var height = string_count("\n","str_prev")*sep*yscale;
		
		draw_set_font(ft_super_1);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_2_1);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_2_2);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_2_3);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_2_4);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_2_5);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_3_1);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_3_2);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_3_3);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_3_4);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_3_5);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_4);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
		draw_set_font(ft_super_5);
		draw_text_ext_transformed(xx + _x + width, yy + _y + height,string_copy(text,i+1,1),sep,100000,xscale,yscale,0);
	}
	
	draw_set_halign(ha);
	draw_set_valign(va);
}