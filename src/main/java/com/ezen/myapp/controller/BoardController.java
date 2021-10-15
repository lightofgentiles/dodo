package com.ezen.myapp.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
	
		return "board/boardWrite";
		
	}
	
	@RequestMapping(value="/board/boardWriteAction.do")
	public String boardWriteAction(
			HttpServletRequest request,
			HttpServletResponse response, 
			Object handler,
			RedirectAttributes rttr, //이 클래스에 주소창에 넣어서 값이 들어가지 않고 hidden으로 한번만 사용한다.
			@RequestParam("subject") String subject,
			@RequestParam("contents") String contents,
			@RequestParam("pwd") String pwd	
			) {
		String ip=null;
		
		
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		String b_member_id = (String)session.getAttribute("memberId");
		String b_member_name = (String)session.getAttribute("member_name");
		
		
			
		int result = bs.boardInsert(subject, contents, b_member_id, b_member_name, pwd, ip);
		
		String path = null;
		if (result==1) {
			rttr.addFlashAttribute("msg", "글을 작성했습니다.");
			path = "/board/boardList.do";
		}else {
			rttr.addFlashAttribute("msg", "다시 작성해주세요~");
			path = "/board/boardWrite.do";
		}		
		
		return "redirect:/"+path;
	}
	
	@RequestMapping(value="/board/boardList.do")
	public String boardList(SearchCriteria scri, Model  model) {
		
		int cnt = bs.boardTotalCount(scri);
			
		ArrayList<BoardVo> alist = bs.boardSelectAll(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);	
		
		
		return "board/boardList";
	}
	
	
	
}
