/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다


mode = SCALER.HV;

align = SCALER.CENTER;

base_width = room_width*2;
base_height = room_height*2;
width = base_width;
height = base_height;

density = 1;
density_prev = density;

center = 1;

fps_accumulated = 0;
fps_count = 0;

enum SCALER
{
	HV,
	H,
	V,
	LEFT,
	CENTER,
	RIGHT,
	TOP,
	MIDDLE,
	BOTTOM,
	CUSTOM
}