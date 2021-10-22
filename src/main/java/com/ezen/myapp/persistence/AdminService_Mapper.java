package com.ezen.myapp.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface AdminService_Mapper {

	int AdminProductTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> AdminProductSelectAll(HashMap<String, Object> hm);
	
	
}
