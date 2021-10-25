package com.ezen.myapp.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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
import com.ezen.myapp.util.MediaUtils;
import com.ezen.myapp.util.UploadFileUtiles;



@Controller
public class AdminController {
	@Autowired
	AdminService as;
	
	@Resource(name="uploadPath")
	private String uploadPath;	
	
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
			RedirectAttributes rttr, //이 클래스에 주소창에 넣어서 값이 들어가지 않고 hidden으로 한번만 사용한다.
			@RequestParam("p_code") String p_code,
			@RequestParam("p_category") String p_category,
			@RequestParam("p_name") String p_name,	
			@RequestParam("p_price") String p_price,
			@RequestParam("p_qty") String p_qty,
			@RequestParam("p_indate") String p_indate,	
			@RequestParam("uploadfile") String p_img,
			@RequestParam("p_text") String p_text	
			
			) {
			
		int result = as.AdminProductInsert(p_code, p_category, p_name, p_price, p_qty, p_indate, p_img, p_text);
		
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
	
	@ResponseBody
	@RequestMapping(value="/board/uploadAjax.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		
	
		String uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, 
				file.getOriginalFilename(), 
				file.getBytes());
		
		
		ResponseEntity<String> entity = null;
		entity = new ResponseEntity<String>(uploadedFileName,HttpStatus.CREATED);
		
		//  /2018/05/30/s-dfsdfsdf-dsfsff.jsp
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/board/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
	//	System.out.println("fileName:"+fileName);
		
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
		
	//	logger.info("FILE NAME :"+fileName);
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();		
			 
			in = new FileInputStream(uploadPath+fileName);
			
			
			if(mType != null){
				headers.setContentType(mType);
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	} 
	

	
	
	
	
	
	
}
