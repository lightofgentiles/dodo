package com.ezen.myapp.domain;

public class SearchCriteria extends Criteria {
	
	private String keyword; //�궎�썙�뱶
	private String searchType; //
	
	public SearchCriteria(){
		this.searchType = "subject";
		this.keyword = "";
	}
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	
}