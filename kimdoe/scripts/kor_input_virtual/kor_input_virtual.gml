/// @description kor_input()
function kor_input_virtual(str) {
	if str == "backspace"
	{
	    if string_length(kor_buffer)
	    {
	        kor_buffer = string_delete(kor_buffer, string_length(kor_buffer), 1);
	    }
	    else
	    {
	        kor_string = string_delete(kor_string, kor_cursor, 1);
	        kor_cursor = max(kor_cursor - 1, 0);
	    }
	}
	else
	{
		kor_buffer += str;
	}
}
