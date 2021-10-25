package com.ezen.myapp.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.persistence.AdminService_Mapper;
import com.ezen.myapp.persistence.BoardService_Mapper;

@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	SqlSession sqlSession; //Mybatis 

	@Override
	public int AdminProductTotalCount(SearchCriteria scri) {
		AdminService_Mapper asm =sqlSession.getMapper(AdminService_Mapper.class);

		int cnt = asm.AdminProductTotalCount(scri);
	
		return cnt;
	}

	@Override
	public ArrayList<ProductVo> AdminProductSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("f_str", (scri.getPage()-1)*scri.getPerPageNum()+1);
		hm.put("e_str", scri.getPage()*scri.getPerPageNum());
		
		AdminService_Mapper asm =sqlSession.getMapper(AdminService_Mapper.class);	
		ArrayList<ProductVo> alist = asm.AdminProductSelectAll(hm);
		return alist;
	}

	@Override
	public int AdminProductInsert(String p_code, String p_category, String p_name, String p_price, String p_qty,
			String p_indate, String p_img, String p_text) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("p_code", p_code);
		hm.put("p_category", p_category);
		hm.put("p_name", p_name);
		hm.put("p_price", p_price);
		hm.put("p_qty", p_qty);
		hm.put("p_indate", p_indate);
		hm.put("p_img", p_img);
		hm.put("p_text", p_text);
		
		AdminService_Mapper asm = sqlSession.getMapper(AdminService_Mapper.class);
		int result = asm.AdminProductInsert(hm);
		
		return result;
	}


	
	
	

	

}
