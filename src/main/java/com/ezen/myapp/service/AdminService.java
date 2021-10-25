package com.ezen.myapp.service;

import java.util.ArrayList;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface AdminService {


	int AdminProductTotalCount(SearchCriteria scri);

	ArrayList<ProductVo> AdminProductSelectAll(SearchCriteria scri);


	int AdminProductInsert(String p_code, String p_category, String p_name, String p_price, String p_qty,
			String p_indate, String p_img, String p_text);



	
}
