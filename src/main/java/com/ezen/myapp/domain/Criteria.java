package com.ezen.myapp.domain;

public class Criteria {
	//泥섏쓬�뿉�뒗 default �럹�씠吏� �닔�� �씠�룞�븯硫� �럹�씠吏�瑜� 留뚮뱾 媛��닔
	private int page=1; //�럹�씠吏� 媛믪쓣 諛쏅뒗 蹂��닔
	private int perPageNum = 15; //�솕硫� 由ъ뒪�듃 異쒕젰媛��닔
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	

}
