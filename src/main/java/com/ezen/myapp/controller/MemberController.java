package com.ezen.myapp.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.myapp.domain.MemberVo;
import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.PageMaker;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.service.BoardService;
import com.ezen.myapp.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	MemberService ms;	
	
	@RequestMapping(value="/main/main.do")
	public String main() {
				
		return "main/main";
	}
	
	@RequestMapping(value="/member/memberLogin.do")
	public String memberLogin() {
				
		return "member/login";
	}
	
	@RequestMapping(value="/member/memberLoginAction.do")
	public String memberLoginAction(
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw,
			RedirectAttributes rttr //이 클래스에 주소창에 넣어서 값이 들어가지 않고 hidden으로 한번만 사용한다.
			) {
		
		
		MemberVo mv = ms.memberLogin(member_id,member_pw);
				
		String path = null;
		if(mv==null) {
			rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다");
			path = "redirect:/member/memberLogin.do";
			
		}else {
			
			rttr.addAttribute("memberId", mv.getMember_id());
			rttr.addAttribute("member_name", mv.getMember_name());
			rttr.addAttribute("member_level", mv.getMember_level());
			rttr.addFlashAttribute("msg", "로그인되었습니다.");
			path = "redirect:/main/main.do";
		}
		
		return path;
	}
	
	@RequestMapping(value="/member/memberLoginout.do")
	public String memberLoginout(
			HttpServletRequest request,
			HttpServletResponse response, 
			RedirectAttributes rttr, //이 클래스에 주소창에 넣어서 값이 들어가지 않고 hidden으로 한번만 사용한다.
			Object handler
			) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("memberId")  != null) {
			session.removeAttribute("memberId");
			session.removeAttribute("member_name");
			session.invalidate();
			rttr.addFlashAttribute("msg", "로그아웃되었습니다.");
		}
				
		return "redirect:/main/main.do";
	}
	
	
	@RequestMapping(value="/member/memberJoin.do")
	public String memberJoin() {
	
				
		return "member/memberJoin";
	}
	
    @ResponseBody
	@RequestMapping(value="/member/memberIdChk.do")
	public HashMap<String,Integer> memberIdChk(
			@RequestParam("member_id") String member_id
			) {

    	
		int result = ms.memberIdChk(member_id);	

		
		HashMap<String,Integer> hm = new HashMap<String,Integer>();
		hm.put("result", result);
		
		return hm;		
		
	}
	
	
	@RequestMapping(value="/member/memberJoinAction.do")
	public String memberJoinAction(
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw,
			@RequestParam("member_name") String member_name,
			@RequestParam("member_zipcode") String member_zipcode,
			@RequestParam("member_address1") String member_address1,
			@RequestParam("member_address2") String member_address2,
			@RequestParam("birth_year") String birth_year,
			@RequestParam("birth_month") String birth_month,
			@RequestParam("birth_day") String birth_day,
			@RequestParam("member_hp") String member_hp,
			@RequestParam("member_email") String member_email,
			RedirectAttributes rttr //이 클래스에 주소창에 넣어서 값이 들어가지 않고 hidden으로 한번만 사용한다.
			) {	
		String birth_month1=null;
		String birth_day1=null;
		String member_birth=null;
		if(birth_month.length()==1 && birth_day.length()==1 ) {
			birth_month1="0"+birth_month;
			birth_day1="0"+birth_day;
			member_birth = birth_year +"-"+ birth_month1 + "-" + birth_day1;		
		}else if(birth_month.length()==1){
			birth_month1="0"+birth_month;
			member_birth = birth_year +"-"+ birth_month1 + "-" + birth_day;
		}else if(birth_day.length()==1) {
			birth_day1="0"+birth_day;
			member_birth = birth_year +"-"+ birth_month + "-" + birth_day1;
		}else {
			member_birth = birth_year +"-"+ birth_month + "-" + birth_day;
		}
          
		
		
		int result = ms.memberInsert(member_id,member_pw,member_name,member_zipcode,member_address1,member_address2,member_birth,member_hp,member_email);
		
	
		
		String path = null;
		if (result==1) {
			
		rttr.addAttribute("memberId", member_id);
		rttr.addFlashAttribute("msg", "회원가입 되었습니다.");
			
			path = "redirect:/main/main.do";
		}
		
		
		return path;
	}
	
	
}
