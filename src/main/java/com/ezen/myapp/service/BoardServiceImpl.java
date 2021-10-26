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

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	SqlSession sqlSession; //Mybatis 
	
	
	
	@Override
	public int boardInsert(String subject, String contents, String b_member_id, String b_member_name, String pwd, String ip) {
		// �����κа� 
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("subject", subject);
		hm.put("contents", contents);
		hm.put("b_member_id", b_member_id);
		hm.put("b_member_name",b_member_name);
		hm.put("pwd", pwd);
		hm.put("ip", ip);
		
		System.out.println("boardInsert"+ hm);
		
		BoardService_Mapper bsm =sqlSession.getMapper(BoardService_Mapper.class);		
		int result=bsm.boardInsert(hm);
							
		return result;
	}



	@Override
	public int boardTotalCount(SearchCriteria scri) {


		BoardService_Mapper bsm =sqlSession.getMapper(BoardService_Mapper.class);

		int cnt = bsm.boardTotalCount(scri);
	
		return cnt;

	}



	@Override
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("f_str", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("e_str", scri.getPage()*scri.getPerPageNum());
		
		BoardService_Mapper bsm =sqlSession.getMapper(BoardService_Mapper.class);	
		ArrayList<BoardVo> alist = bsm.boardSelectAll(hm);
		return alist;
	}
	
	@Override
	public BoardVo boardSelectOne(int bidx) {
		//
		BoardService_Mapper bsm =sqlSession.getMapper(BoardService_Mapper.class);		
		BoardVo bv = bsm.boardSelectOne(bidx);
		
		return bv;
	}



	
	@Override
	public int boardModify(int bidx, String subject,  String contents, String pwd) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("subject", subject);
		hm.put("contents", contents);
		hm.put("bidx", bidx);
		hm.put("pwd", pwd);

		BoardService_Mapper bsm =sqlSession.getMapper(BoardService_Mapper.class);		
		int result=bsm.boardModify(hm);
							
		return result;
	}


	@Override
	public int boardDelete(int bidx, String pwd) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("bidx", bidx);
		hm.put("pwd", pwd);

		BoardService_Mapper bsm =sqlSession.getMapper(BoardService_Mapper.class);		
		int result=bsm.boardDelete(hm);
							
		return result;
	}


	@Transactional
	@Override
	public int boardReply(int originbidx, int depth, int nlevel, String subject, String contents, String writer,
			String ip, int midx, String pwd) {
		// TODO Auto-generated method stub
		
		HashMap<String,Object> hm =new HashMap<String,Object>();
		hm.put("originbidx", originbidx);
		hm.put("depth", depth);
		hm.put("nlevel", nlevel);
		hm.put("subject", subject);	
		hm.put("contents", contents);	
		hm.put("writer", writer);	
		hm.put("pwd", pwd);
		hm.put("ip", ip);
		hm.put("midx", midx);
		
		BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);	
		bsm.boardReplyUpdate(originbidx, depth);
		int value = bsm.boardInsert(hm);
		return value;
	}
	

}
