<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.ArrayList" %> 
<%@ page import ="com.ezen.myapp.domain.*" %> 
<%PageMaker pm = (PageMaker)request.getAttribute("pm"); %> 
<%ArrayList<ProductVo> alist = (ArrayList<ProductVo>) request.getAttribute("alist"); %>    

<html>
<head>
<meta charset="EUC-KR">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>You are a pretty girl</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/adminheader.css?ver=1" />
<link rel="stylesheet" type="text/css" href="${path}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${path}/css/admin.css">
<link rel="shortcut icon" href="${path}/images/favicon/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="${path}/images/icon/flat-design-touch.png">
<script src="${path}/js/header.js" defer> </script>
<script src="${path}/js/jquery.min.js" defer></script>
<script src="${path}/js/flat.min.js" defer></script>
<script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
	}
	
	var flag ="${flag}";
	if(flag){
		opener.parent.location.reload(); 
		window.close();
	}
	
</script>

<script type="text/javascript"> 
   
    function resOpenPopup(){
        var pop = window.open("${path}/admin/adminProductWrite.do?","resPopup","width=1100,height=900, scrollbars=yes, resizable=yes"); 
        pop.focus();
    }
        
</script>

<body>
<h1>상품목록</h1>
<%@ include file="/include/adminheader.jsp" %>

		<section class="sub_header_section">
			<h2>상품목록</h2>
		</section>
		<section class="content_section">
			<div class="content_row_2">
				<div class="search_box">
					<form name="frm" action="${path}/admin/main.do" method="post">
						<input type="search" name="gallery_search_window" class="search_window" placeholder="검색어">
						<div class="search_select_box">
							<span>검색 대상</span>
							<ul class="search_select_list">
								<li>제목</li>
								<li>내용</li>
								<li>제목+내용</li>
								<li>이름</li>
								<li>아이디</li>
							</ul>
						</div>	
					</form>
				</div>
				<div class="write_box">
					<a href="javascript:void(0);" onclick="resOpenPopup();return false;">상품등록</a>
				</div>
			</div>
			<div class="content_row_1">
				<table class="table table-hover" >
				 	<thead>
						<tr>						
							<th>상품번호</th>
							<th>상품코드</th>
							<th>카테고리</th>
							<th>상품명</th>
							<th>재고수량</th>
							<th>상품가격</th>
							<th>사진</th>
						    <th>상품입고날짜</th>
						    <td>수정/삭제</td>							
						</tr>
					</thead>
					<tbody>
					<% for(ProductVo pv : alist) { %>
					<tr>
						<td><%=pv.getP_idx() %></td>
						<td><a href="${path}/board/boardContents.do?bidx=<%=pv.getP_idx()%>" style="color:black;"><%=pv.getP_code()%></a></td>
						<td><%=pv.getP_category() %></td>
						<td><%=pv.getP_name()%></td>
						<td><%=pv.getP_qty()%></td>
						<td><%=pv.getP_price()%></td>										
						<td><img src="${path}/images/p_images/<%=pv.getP_img()%>"  width=10%, height=10% ></td>				
						<td><%=pv.getP_indate()%></td>
						<td><a href="#" style="color: orange;font-size: 1.0em;font-weight: bold;background: #efefef;">수정</a>
						/<a href="#" style="color: red;font-size: 1.0em;font-weight: bold;background: #efefef;">삭제</a></td>			
					</tr>
					<%} %>
					</tbody>
				</table>
			</div>

			<div class="content_row_3">
				<% if(pm.isPrev()==true){ %>
				<span class="list_prev_btn"><a href="${path}/admin/main.do?page=<%=pm.getStartPage()-1 %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>">문의사항 이전 버튼</a></span>
				<%}%>
				<% for(int i =pm.getStartPage();i<=pm.getEndPage();i++){%>
				<a href="${path}/admin/main.do?page=<%=i %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>"><%=i%></a>
				<%}%>
				<%if (pm.isNext() && pm.getEndPage()>0) { %>
				<span class="list_next_btn"><a href="${path}/admin/main.do?page=<%=pm.getEndPage()+1 %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>">문의사항 다음 버튼</a></span>
				<%}%>			
			</div>
		</section>
	</body>   
</table>
</body>
</html>

