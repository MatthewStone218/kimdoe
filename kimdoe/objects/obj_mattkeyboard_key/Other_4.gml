/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(is_string(key))
{
	global.__kortext_language = "en";
	text[0] = [kortext().input(string_lower(key)).get_text(),kortext().input(string_upper(key)).get_text()];
	global.__kortext_language = "kr";
	text[1] = [kortext().input(string_lower(key)).get_text(),kortext().input(string_upper(key)).get_text()];
	global.__kortext_language = "en";
}
