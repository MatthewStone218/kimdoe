/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
image_index = irandom(sprite_get_number(sprite_index)-1);
image_speed = 0;

gravity = 1;
hspeed = random_range(-10,10);
vspeed = random_range(-5,-40);

angle_spd = irandom_range(-10,10);