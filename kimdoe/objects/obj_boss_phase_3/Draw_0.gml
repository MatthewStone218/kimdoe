/// @description Insert description here
// You can write your code in this editor

if(blink or (global.state == ST.GAME && hit > 0))
{
	shader_set(shd_white);
	draw_self();
	shader_reset();
}
else
{
	draw_self();
}