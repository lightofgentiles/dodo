package com.ezen.myapp.service;

import java.util.ArrayList;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.CommentVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface BoardService {
	
	public int boardInsert(String subject, String contents, String b_member_id, String b_member_name, String pwd, String ip);
	
	public int boardTotalCount(SearchCriteria scri);
	
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);

	public BoardVo boardSelectOne(int bidx);
	
	public ArrayList<CommentVo> commentSelectAll(int bidx);

	public int commentInsert(String c_subject, String c_contents, String c_writer, int bidx, String ip, int midx);

	public int commentDelete(int cidx);

	public ArrayList<CommentVo> commentMore(int bidx, int page);

	public int commentTotalPage(int bidx);

	public int boardModify(String subject, String contents, String writer, int bidx, String pwd);

	public int boardDelete(int bidx, String pwd);

	public int boardReply(int originbidx, int depth, int nlevel, String subject, String contents, String writer,
			String ip, int midx, String pwd);


	
}
