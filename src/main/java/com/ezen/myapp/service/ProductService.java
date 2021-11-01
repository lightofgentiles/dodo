package com.ezen.myapp.service;

import java.util.ArrayList;

import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface ProductService {

	int productOuterTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productOuterSelectAll(SearchCriteria scri);

	int productBlouseTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productBlouseSelectAll(SearchCriteria scri);

	int productTopTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productTopSelectAll(SearchCriteria scri);

	int productPantsTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> productPantsSelectAll(SearchCriteria scri);


	



	
}
