package com.ezen.myapp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.PageMaker;
import com.ezen.myapp.domain.ProductVo;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.service.AdminService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@Controller
public class AdminController {
	@Autowired
	AdminService as;
	
	
	@Autowired
	PageMaker pm;
	
	
	
	@RequestMapping(value="/admin/main.do")
	public String Adminmain(
			SearchCriteria scri,
			Model  model
			) {
		
		int cnt = as.AdminProductTotalCount(scri);
		
		ArrayList<ProductVo> alist = as.AdminProductSelectAll(scri);
		
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);		
		
	
		return "admin/admin_goods_list";
		
	}
		
	
	@RequestMapping(value="admin/adminProductWrite.do")
	public String adminProductWrite() {		
	
		return "admin/admin_goods_write";
		
	}
		
		
	@RequestMapping(value="/admin/adminProductWriteAction.do")
	public String adminProductWriteAction(
			HttpServletRequest request,
			HttpServletResponse response, 
			Object handler,
			RedirectAttributes rttr 

			
			) throws IOException {
		
		System.out.println("p_category : uploadfile ");
		
		String uploadPath = "D:\\YJobs\\dodo\\src\\main\\webapp\\images\\";		
		
		String  savedPath="p_images";

		String saveFullPath = uploadPath+	savedPath;
		int sizeLimit = 1024*1024*15;	
		
		MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit,"UTF-8",new DefaultFileRenamePolicy());
		

		Enumeration files = multi.getFileNames();

		String file = (String) files.nextElement();

		String p_img = multi.getFilesystemName(file);

		String originFileName = multi.getOriginalFileName(file);	
					
		String p_code = multi.getParameter("p_code");
		String p_category = multi.getParameter("p_category");
		String p_name = multi.getParameter("p_name");
		String p_price = multi.getParameter("p_price");
		String p_qty = multi.getParameter("p_qty");
		String p_indate = multi.getParameter("p_indate");
		String p_text = multi.getParameter("p_text");
		

			
		int result = as.AdminProductInsert(p_code, p_category, p_name, p_price, p_qty, p_indate, p_img, p_text);
		
		String path = null;
		if (result==1) {
			rttr.addFlashAttribute("msg", "상품이 등록되었습니다.");
			rttr.addFlashAttribute("flag", "1");
			path = "/admin/main.do";
		}else {
			rttr.addFlashAttribute("msg", "다시 작성하세요");
			path = "admin/adminProductWrite.do";
		}		
		
		return "redirect:/"+path;
	}	
	
}
