package com.ezen.myapp.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.persistence.ProductService_Mapper;

@Service("ProductServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	SqlSession sqlSession; //Mybatis 

	@Override
	public int productOuterTotalCount(SearchCriteria scri) {
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);

		int cnt = psm.productOuterTotalCount(scri);
	
		return cnt;
	}

	@Override
	public ArrayList<ProductVo> productOuterSelectAll(SearchCriteria scri) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("f_str", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("e_str", scri.getPage()*scri.getPerPageNum());
		
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);	
		ArrayList<ProductVo> alist = psm.productOuterSelectAll(hm);
		return alist;
	}

	@Override
	public int productBlouseTotalCount(SearchCriteria scri) {
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);

		int cnt = psm.productBlouseTotalCount(scri);
	
		return cnt;
	}

	@Override
	public ArrayList<ProductVo> productBlouseSelectAll(SearchCriteria scri) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("f_str", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("e_str", scri.getPage()*scri.getPerPageNum());
		
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);	
		ArrayList<ProductVo> alist = psm.productBlouseSelectAll(hm);
		return alist;
	}

	@Override
	public int productTopTotalCount(SearchCriteria scri) {
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);

		int cnt = psm.productTopTotalCount(scri);
	
		return cnt;
	}

	@Override
	public ArrayList<ProductVo> productTopSelectAll(SearchCriteria scri) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("f_str", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("e_str", scri.getPage()*scri.getPerPageNum());
		
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);	
		ArrayList<ProductVo> alist = psm.productTopSelectAll(hm);
		return alist;
	}

	@Override
	public int productPantsTotalCount(SearchCriteria scri) {
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);

		int cnt = psm.productPantsTotalCount(scri);
	
		return cnt;
	}

	@Override
	public ArrayList<ProductVo> productPantsSelectAll(SearchCriteria scri) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("f_str", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("e_str", scri.getPage()*scri.getPerPageNum());
		
		ProductService_Mapper psm =sqlSession.getMapper(ProductService_Mapper.class);	
		ArrayList<ProductVo> alist = psm.productPantsSelectAll(hm);
		return alist;
	}
	
	
	

	

}
