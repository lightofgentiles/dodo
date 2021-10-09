package com.ezen.myapp.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.PageMaker;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.service.BoardService;


@Controller
public class BoardController {
	@Autowired
	BoardService bs;
	
	@Autowired
	PageMaker pm;
	
	
	@RequestMapping(value="/board/boardWrite.do")
	public String boardWrite() {
		
	
		return "boardWrite";
		
	}
	
	@RequestMapping(value="/board/boardWriteAction.do")
	public String boardWriteAction(
			@RequestParam("subject") String subject,
			@RequestParam("contents") String contents,
			@RequestParam("writer") String writer,
			@RequestParam("pwd") String pwd		
			) {
		String ip=null;
		
		
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int midx =41 ;
		
			
		int result = bs.boardInsert(subject, contents, writer, pwd, ip, midx);
		
		String path = null;
		if (result==1) {
		path = "/board/boardList.do";
		}else {
			//path = "/board/boardReply.do?bidx="+bidx+"&orginbidx="+orginbidx+"&updown="+updown+"&leftright="+leftright;
		}
		
		
		return "redirect:/"+path;
	}
	
	@RequestMapping(value="/board/boardList.do")
	public String boardList(SearchCriteria scri, Model  model) {
		
		int cnt = bs.boardTotalCount(scri);
		//System.out.println("cnt"+cnt);
		
		ArrayList<BoardVo> alist = bs.boardSelectAll(scri);
		
		//System.out.println("alist"+alist);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);	
		
		
		return "boardList";
	}
	
	
	
}
