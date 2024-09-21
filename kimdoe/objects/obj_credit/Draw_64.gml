/// @description Insert description here
// You can write your code in this editor

draw_set_font(ft_text);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_set_alpha(image_alpha);

draw_text_transformed(960,540,credit[num],image_xscale*0.6,image_yscale*0.6,0);

draw_set_alpha(1);