/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다


draw_set_color(c_white);
draw_set_font(ft_text);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(480,28,"지  옥에서는 아무도 못 나가 해병님",0.3,0.3,0);

draw_sprite(sprite_index,0,x,y);
draw_sprite_part(sprite_index,1,0,0,sprite_get_width(sprite_index)*(obj_boss.hp/100),sprite_get_height(sprite_index),x,y);