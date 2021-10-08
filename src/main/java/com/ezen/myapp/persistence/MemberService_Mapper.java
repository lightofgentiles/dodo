package com.ezen.myapp.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.MemberVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface MemberService_Mapper {
		
	public int memberInsert(HashMap<String, Object> hm);

	public MemberVo memberLogin(String member_id, String member_pw);

	public int memberIdChk(String member_id);


	}
