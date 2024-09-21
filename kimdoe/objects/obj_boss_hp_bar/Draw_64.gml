/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다


draw_set_color(c_white);
draw_set_font(ft_text);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(960,56,"모발의 요정",0.6,0.6,0);

var _hp_frame_spr = spr_boss_hp_bar_1;
var _hp_spr = spr_boss_hp_bar_2;

draw_sprite(spr_boss_hp_bar_1,0,x,y);
draw_sprite_part(spr_boss_hp_bar_2,1,0,0,sprite_get_width(_hp_spr)*(obj_boss.hp/100),sprite_get_height(_hp_spr),x+(sprite_get_width(_hp_frame_spr)-sprite_get_width(_hp_spr))/2,y+(sprite_get_height(_hp_frame_spr)-sprite_get_height(_hp_spr))/2);