/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

speed *= 0.95;

image_angle += angle_spd;

image_alpha += alpha_spd;
if(image_alpha <= 0){instance_destroy();}