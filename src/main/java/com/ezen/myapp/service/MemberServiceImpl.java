package com.ezen.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.myapp.persistence.MemberService_Mapper;
import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.MemberVo;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.persistence.BoardService_Mapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	//1. ���̹�Ƽ���� ���Թ޴´�
	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberVo memberLogin(String member_id, String member_pw) {
		
			MemberService_Mapper msm =sqlSession.getMapper(MemberService_Mapper.class);		
			MemberVo mv = msm.memberLogin(member_id, member_pw);
			
			return mv;
		}


	@Override
	public int memberInsert(String member_id, String member_pw, String member_name, String member_zipcode,
			String member_address1, String member_address2, String member_birth, String member_hp, String member_email) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("member_id", member_id);
		hm.put("member_pw", member_pw);
		hm.put("member_name", member_name);
		hm.put("member_zipcode", member_zipcode);
		hm.put("member_address1", member_address1);
		hm.put("member_address2", member_address2);
		hm.put("member_birth", member_birth);
		hm.put("member_hp", member_hp);
		hm.put("member_email", member_email);
		
		MemberService_Mapper msm =sqlSession.getMapper(MemberService_Mapper.class);	
		
		int result = msm.memberInsert(hm);	
		return result;
	}


	@Override
	public int memberIdChk(String member_id) {
		
		MemberService_Mapper msm =sqlSession.getMapper(MemberService_Mapper.class);	

		int result = msm.memberIdChk(member_id);
	
		return result;
	}
	
	
	
	
	
	

	
	}
