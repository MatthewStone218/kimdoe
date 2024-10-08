/// @description text_eng_to_hangul(eng text)
/// @param eng text
function text_eng_to_hangul(argument0) {
	var buf = argument0, result = "";

	tree_c = 0; // 조합리스트 초기화

	for(var i = 1; i <= string_length(buf); i++) // 글자 처음부터 끝까지 스캔
	{
	    if i < string_length(buf) // 마지막 글자가 아닐 경우
	    {
	        //모음
	        if (kor_search(1, string_copy(buf, i, 2)) != -1) 
	        {
	            if (tree_c != 0 && tree[tree_c - 1, 0] == 2 && kor_leng(2, tree[tree_c - 1, 1]) == 2) // 리스트의 처음이 아니고 앞에 겹받침이 있을 경우 
	            {
	                var s1 = string_copy(_han[2, tree[tree_c - 1, 1]], 1, 1);
	                var s2 = string_copy(_han[2, tree[tree_c - 1, 1]], 2, 1);
                
	                //겹받침 분리
	                tree[tree_c - 1, 1] = kor_search(2, s1);
                
	                tree[tree_c, 0] = 0;
	                tree[tree_c, 1] = kor_search(0, s2);
	                tree_c++;
	            }
	            else if (tree_c != 0 && tree[tree_c - 1, 0] == 2 && kor_leng(2, tree[tree_c - 1, 1]) == 1) // 리스트의 처음이 아니고 앞에 겹받침이 있을 경우 
	            {
	                var s = _han[2, tree[tree_c - 1, 1]];
                
	                //초성화
	                tree[tree_c - 1, 0] = 0;
	                tree[tree_c - 1, 1] = kor_search(0, _han[2, tree[tree_c - 1, 1]]);
	            }
	            //모음 추가
	            tree[tree_c, 0] = 1;
	            tree[tree_c, 1] = kor_search(1, string_copy(buf, i, 2));
	            i += kor_leng(1, tree[tree_c, 1]) - 1;
	            tree_c++;
            
	            continue;
	        }
	        //자음
	        if (tree_c > 0 && tree[tree_c - 1, 0] == 1) // 바로 앞이 모음이면
	        {
	            if (kor_search(2, string_copy(buf, i, 2)) != -1)
	            {
	                var ss = kor_search(2, string_copy(buf, i, 2));
	                //종성 추가
	                tree[tree_c, 0] = 2;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(2, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	            if (kor_search(0, string_copy(buf, i, 2)) != -1)
	            {
	                var ss = kor_search(0, string_copy(buf, i, 2));
	                //초성 추가
	                tree[tree_c, 0] = 0;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(0, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	        }
	        else
	        {
	            if (kor_search(0, string_copy(buf, i, 2)) != -1)
	            {
	                var ss = kor_search(0, string_copy(buf, i, 2));
	                //초성 추가
	                tree[tree_c, 0] = 0;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(0, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	            if (kor_search(2, string_copy(buf, i, 2)) != -1)
	            {
	                var ss = kor_search(2, string_copy(buf, i, 2));
	                //종성 추가
	                tree[tree_c, 0] = 2;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(2, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	        }
        
	    }
	    else { // 마지막 글자---------------------------//
	        //모음
	        if (kor_search(1, string_copy(buf, i, 1)) != -1) 
	        {
	            if (tree_c != 0 && tree[tree_c - 1, 0] == 2 && kor_leng(2, tree[tree_c - 1, 1]) == 2) // 리스트의 처음이 아니고 앞에 겹받침이 있을 경우 
	            {
	                var s1 = string_copy(_han[2, tree[tree_c - 1, 1]], 1, 1);
	                var s2 = string_copy(_han[2, tree[tree_c - 1, 1]], 2, 1);
                
	                //겹받침 분리
	                tree[tree_c - 1, 1] = kor_search(2, s1);
                
	                tree[tree_c, 0] = 0;
	                tree[tree_c, 1] = kor_search(0, s2);
	                tree_c++;
	            }
	            else if (tree_c != 0 && tree[tree_c - 1, 0] == 2 && kor_leng(2, tree[tree_c - 1, 1]) == 1) // 리스트의 처음이 아니고 앞에 겹받침이 있을 경우 
	            {
	                var s = _han[2, tree[tree_c - 1, 1]];
                
	                //초성화
	                tree[tree_c - 1, 0] = 0;
	                tree[tree_c - 1, 1] = kor_search(0, _han[2, tree[tree_c - 1, 1]]);
	            }
	            //모음 추가
	            tree[tree_c, 0] = 1;
	            tree[tree_c, 1] = kor_search(1, string_copy(buf, i, 1));
	            tree_c++;
            
	            continue;
	        }
	        //자음
	        if (tree_c > 0 && tree[tree_c - 1, 0] == 1) // 바로 앞이 모음이면
	        {
	            if (kor_search(2, string_copy(buf, i, 1)) != -1)
	            {
	                var ss = kor_search(2, string_copy(buf, i, 1));
	                //종성 추가
	                tree[tree_c, 0] = 2;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(2, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	            if (kor_search(0, string_copy(buf, i, 1)) != -1)
	            {
	                var ss = kor_search(0, string_copy(buf, i, 1));
	                //초성 추가
	                tree[tree_c, 0] = 0;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(0, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	        }
	        else
	        {
	            if (kor_search(0, string_copy(buf, i, 1)) != -1)
	            {
	                var ss = kor_search(0, string_copy(buf, i, 1));
	                //초성 추가
	                tree[tree_c, 0] = 0;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(0, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	            if (kor_search(2, string_copy(buf, i, 1)) != -1)
	            {
	                var ss = kor_search(2, string_copy(buf, i, 1));
	                //종성 추가
	                tree[tree_c, 0] = 2;
	                tree[tree_c, 1] = ss;
	                i += kor_leng(2, tree[tree_c, 1]) - 1;
	                tree_c++;
	                continue;
	            }
	        }
        
	    }
	}

	{
	    var status = -1, s1 = -1, s2 = -1, s3 = -1; // 조합 상태
	    for(var i = 0; i < tree_c; i++) // 글자 처음부터 끝까지 스캔
	    {
	        switch(tree[i, 0])
	        {
	            case 0:
	                if (status == -1)
	                {
	                    s1 = tree[i, 1];
	                    status = 0;
	                }
	                else if (status == 0)
	                {
	                    result += _gul[0, s1];
	                    s1 = tree[i, 1];
	                }
	                else
	                {
	                    result += chr($AC00 + (s1 * 28 * 21) + (s2 * 28) + (s3 + 1));
	                    s1 = tree[i, 1];
	                    s2 = -1;
	                    s3 = -1;
	                    status = 0;
	                }
	            break;
            
	            case 1:
	                switch(status)
	                {
	                    case -1:
	                        s1 = -1;
	                        s2 = -1;
	                        s3 = -1;
	                        status = -1;
	                        result += _gul[1, tree[i, 1]];
	                    break;
                    
	                    case 0:
	                        s2 = tree[i, 1];
	                        status = 1;
	                    break;
                    
	                    case 1:
	                        result += chr($AC00 + (s1 * 28 * 21) + (s2 * 28));
	                        s1 = -1;
	                        s2 = -1;
	                        s3 = -1;
	                        status = -1;
	                        result += _gul[1, tree[i, 1]];
	                    break;
                
	                    case 2:
	                        result += chr($AC00 + (s1 * 28 * 21) + (s2 * 28) + (s3 + 1));
	                        s1 = -1;
	                        s2 = -1;
	                        s3 = -1;
	                        status = -1;
	                        result += _gul[1, tree[i, 1]];
	                    break;
	                }
	            break;
            
	            case 2:
	                switch(status)
	                {
	                    case -1:
	                        s1 = -1;
	                        s2 = -1;
	                        s3 = -1;
	                        status = -1;
	                        result += _gul[2, tree[i, 1]];
	                    break;
                    
	                    case 0:
	                        result += _gul[0, s1];
	                        s1 = -1;
	                        s2 = -1;
	                        s3 = -1;
	                        status = -1;
	                        result += _gul[2, tree[i, 1]];
	                    break;
                    
	                    case 1:
	                        s3 = tree[i, 1];
	                        status = 2;
	                    break;
                
	                    case 2:
	                        result += chr($AC00 + (s1 * 28 * 21) + (s2 * 28) + (s3 + 1));
	                        s1 = -1;
	                        s2 = -1;
	                        s3 = -1;
	                        status = -1;
	                        result += _gul[2, tree[i, 1]];
	                    break;
	                }
	            break;
	        }
	    }
    
	    // 입력중 글자
	    switch(status)
	    {
	        case 0:
	            result += _gul[0, s1];
	        break;
	        case 1:
	        case 2:
	            result += chr($AC00 + (s1 * 28 * 21) + (s2 * 28) + (s3 + 1));
	        break;
	    }
	}
	return result;



}
