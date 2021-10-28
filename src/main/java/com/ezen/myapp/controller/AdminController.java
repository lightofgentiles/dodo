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
			RedirectAttributes rttr //이 클래스에 주소창에 넣어서 값이 들어가지 않고 hidden으로 한번만 사용한다.

			
			) throws IOException {
		
	


		//업로드 파일 경로
		String uploadPath = request.getServletContext().getRealPath("resources/");
		
		
		System.out.println("uploadPath " + uploadPath);
		//저장되는 파일
		String  savedPath="images";
		//if(p_category.equals("outer")) {
		//	savedPath ="outer";
			
		//} else if(p_category.equals("blouse")){
		//	savedPath ="blouse";	
			
		//}else if(p_category.equals("pants")){
		//	savedPath ="pants";		

		//}else {
		//	savedPath ="top";
			
		//}

		//저장된 총 경로
		String saveFullPath = uploadPath+	savedPath;
		//저장 용량
		int sizeLimit = 1024*1024*15;	
		
		MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit,"UTF-8",new DefaultFileRenamePolicy());
		
		//열거자에 저장된 파일을 담은 객체를 생성한다
		Enumeration files = multi.getFileNames();
		//열거자에 담은 파일의 다음 값을 꺼낸다
		String file = (String) files.nextElement();
		//저장되는 파일이름
		String p_img = multi.getFilesystemName(file);
		//원래 파일이름
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
			rttr.addFlashAttribute("msg", "다시 작성해주세요~");
			path = "admin/adminProductWrite.do";
		}		
		
		return "redirect:/"+path;
	}	
	
}
