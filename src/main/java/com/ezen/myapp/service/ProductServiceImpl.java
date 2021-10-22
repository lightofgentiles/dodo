package com.ezen.myapp.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.persistence.BoardService_Mapper;

@Service("ProductServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	SqlSession sqlSession; //Mybatis 
	
	
	

	

}
