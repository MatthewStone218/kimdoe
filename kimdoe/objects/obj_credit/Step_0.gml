/// @description Insert description here
// You can write your code in this editor

if(fade_step == 0)
{
	image_alpha += 0.01;
	if(image_alpha > 3)
	{
		fade_step = 1;
	}
}
else if(fade_step == 1)
{
	image_alpha -= 0.01;
	if(image_alpha <= -2)
	{
		fade_step = 0;
		num++;
		if(num >= array_length(credit))
		{
			num = array_length(credit)-1;
			room_goto_f(rm_main,ST.MAIN);
		}
	}
}