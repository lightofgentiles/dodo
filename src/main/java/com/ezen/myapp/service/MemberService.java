package com.ezen.myapp.service;

import java.util.ArrayList;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.MemberVo;
import com.ezen.myapp.domain.SearchCriteria;



public interface MemberService {
		
	public MemberVo memberLogin(String member_id, String member_pw);

	public int memberInsert(String member_id, String member_pw, String member_name, String member_zipcode,
			String member_address1, String member_address2, String member_birth, String member_hp, String member_email);

	public int memberIdChk(String member_id);
	
	}
