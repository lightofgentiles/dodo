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
import org.springframework.web.bind.annotation.ModelAttribute;
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
			RedirectAttributes rttr, 
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
		
		String MyString = contents;
		MyString = MyString.replace("<p>", ""); 
		contents = MyString.replace("</p>", "");
		
			
		int result = bs.boardInsert(subject, contents, b_member_id, b_member_name, pwd, ip);
		
		String path = null;
		if (result==1) {
			rttr.addFlashAttribute("msg", "글이 작성되었습니다.");
			path = "/board/boardList.do";
		}else {
			rttr.addFlashAttribute("msg", "다시 작성해주세요");
			path = "/board/boardWrite.do";
		}		
		
		return "redirect:/"+path;
	}
	
	@RequestMapping(value="/board/boardList.do")
	public String boardList(
			SearchCriteria scri,
			Model  model
			) {
		
		int cnt = bs.boardTotalCount(scri);
			
		ArrayList<BoardVo> alist = bs.boardSelectAll(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);		
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/board/boardContents.do")
	public String boardContents(
			@RequestParam("bidx") int bidx,		
			Model model) {		

		BoardVo bv = bs.boardSelectOne(bidx);
		model.addAttribute("bv", bv);
	
		
		return "board/boardContents";
	}
	
	@RequestMapping(value="/board/boardModify.do")
	public String boardModify(
			@RequestParam("bidx") int bidx, 
			Model model) {
		
		System.out.println("/board/boardModify.do : bidx " + bidx);

		BoardVo bv = bs.boardSelectOne(bidx);
		model.addAttribute("bv", bv);		
		
		return "board/boardModify";
	}
	
	@RequestMapping(value="/board/boardModifyAction.do")
	public String boardModifyAction(
			@RequestParam("bidx") int bidx,
			@RequestParam("subject") String subject,
			@RequestParam("contents") String contents,
			@RequestParam("pwd") String pwd,
			RedirectAttributes rttr
			) {
		
		int value = bs.boardModify(bidx, subject, contents,pwd);
		
		String movelocation = null;
		if (value ==0) {			
			movelocation = "redirect:/board/boardModify.do?bidx="+bidx;			
		}else {
			rttr.addFlashAttribute("msg", "수정되었습니다.");
			movelocation = "redirect:/board/boardContents.do?bidx="+bidx;			
		}
		
		return movelocation;
	}
	
	@RequestMapping(value="/board/boardDelete.do")
	public String boardDelete(
			@ModelAttribute("bidx") int bidx,Model model) {
		
		//boardService占쏙옙 占쌍댐옙 占쌨소듸옙 호占쏙옙
		BoardVo bv = bs.boardSelectOne(bidx);
		model.addAttribute("bv", bv);		
		
		return "board/boardDelete";
	}
	
	@RequestMapping(value="/board/boardDeleteAction.do")
	public String boardDeleteAction(
			@RequestParam("bidx") int bidx,			
			@RequestParam("pwd") String pwd,
			RedirectAttributes rttr
			) {
		
			//占쌨소듸옙 호占쏙옙占싼댐옙
		int value = bs.boardDelete(bidx, pwd);
		rttr.addFlashAttribute("msg", "삭제되었습니다.");
		
		
		return "redirect:/board/boardList.do";
	}
	
	
	
}
