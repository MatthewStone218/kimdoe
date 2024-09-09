/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
draw_set_font(ft_text);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_set_alpha(image_alpha);

draw_text_transformed(x,y,text,image_xscale*0.6,image_yscale*0.6,0);

draw_set_alpha(1);