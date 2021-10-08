package com.ezen.myapp.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.CommentVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface BoardService_Mapper {
	
	public int boardInsert(HashMap<String,Object> hm);

	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);

	public int boardTotalCount(SearchCriteria scri);

	public BoardVo boardSelectOne(int bidx);

	public ArrayList<CommentVo> commentSelectAll(int bidx);

	public int commentInsert(HashMap<String, Object> hm);

	public int commentDelete(int cidx);

	public ArrayList<CommentVo> commentMore(HashMap<String,Object> hm);

	public int commentTotalCount(int bidx);

	public int boardModify(HashMap<String, Object> hm);

	public int boardDelete(HashMap<String, Object> hm);

	public void boardReplyUpdate(int originbidx, int depth);	
	
	
}
