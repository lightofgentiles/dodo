package com.ezen.myapp.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private int displayPageNum = 10; 
	private boolean prev;
	private boolean next;
	private SearchCriteria scri;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();		
	}

	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	
	public void calcData() {
		
		endPage =(int)(Math.ceil(scri.getPage()/(double)displayPageNum)*displayPageNum); //�떎 �삱由� 泥섎━瑜� �븳�떎. �떎�쓬 �럹�씠吏��룄 �븯�굹 data留� �엳�뼱�룄 ceil �궗�슜
		
		startPage = (endPage-displayPageNum)+1;
		
				
		int tempEndPage = (int)Math.ceil(totalCount/(double)scri.getPerPageNum()); //endPage媛� �엫�떆 �럹�씠吏�蹂대떎 �넂�쓣�븣 �엫�떆�럹�씠吏�媛� endPage �릺寃�
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage*scri.getPerPageNum() >= totalCount ? false : true;		

	}
	

	//�궎�썙�뱶媛� 源⑥��뒗 諛⑹�
	public String encoding(String keyword) {
		String keyword2=null;
		if(keyword == null || keyword.trim().length()==0){
			keyword2 = "";
		}
		
		try {
			keyword2=URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			keyword2="";
		}		
		
		
		return keyword2;
	}
}
