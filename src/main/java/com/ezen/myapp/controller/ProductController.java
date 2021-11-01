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
import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.service.ProductService;



@Controller
public class ProductController {
	@Autowired
	ProductService ps;	
	
	@Autowired
	PageMaker pm;
	
	@RequestMapping(value="/product/outer.do")
	public String outer(
			SearchCriteria scri,
			Model  model
			) {	
		
		int cnt = ps.productOuterTotalCount(scri);
		
		ArrayList<ProductVo> alist = ps.productOuterSelectAll(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);	
	
		return "product/outer";
		
	}
	
	@RequestMapping(value="/product/blouse.do")
	public String blouse(
			SearchCriteria scri,
			Model  model
			) {	
		
		int cnt = ps.productBlouseTotalCount(scri);
		
		ArrayList<ProductVo> alist = ps.productBlouseSelectAll(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);	
	
		return "product/blouse";
		
	}
	
	@RequestMapping(value="/product/top.do")
	public String top(
			SearchCriteria scri,
			Model  model
			) {	
		
		int cnt = ps.productTopTotalCount(scri);
		
		ArrayList<ProductVo> alist = ps.productTopSelectAll(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);	
	
		return "product/top";
		
	}
	
	@RequestMapping(value="/product/pants.do")
	public String pants(
			SearchCriteria scri,
			Model  model
			) {	
		
		int cnt = ps.productPantsTotalCount(scri);
		
		ArrayList<ProductVo> alist = ps.productPantsSelectAll(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);	
	
		return "product/pants";
		
	}

	
	
	
	
	
	
}
