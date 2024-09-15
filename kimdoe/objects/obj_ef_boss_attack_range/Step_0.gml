/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

image_yscale = ease_get_val(ease_out_cubic(time),1,0);

time += 0.1;
if(time >= 1){instance_destroy();}