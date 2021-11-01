package com.ezen.myapp.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.CommentVo;
import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface ProductService_Mapper {

	int productOuterTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productOuterSelectAll(HashMap<String, Object> hm);

	int productBlouseTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productBlouseSelectAll(HashMap<String, Object> hm);

	int productTopTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productTopSelectAll(HashMap<String, Object> hm);

	int productPantsTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productPantsSelectAll(HashMap<String, Object> hm);
	

	
	
}
