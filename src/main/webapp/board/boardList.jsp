<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.ArrayList" %> 
<%@ page import ="com.ezen.myapp.domain.*" %> 
<%ArrayList<BoardVo> alist = (ArrayList<BoardVo>) request.getAttribute("alist"); %>    
<%PageMaker pm = (PageMaker)request.getAttribute("pm"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>You are a pretty girl</title>
<link rel="stylesheet" type="text/css" href="${path}/css/header.css?ver=1" />
<link rel="stylesheet" type="text/css" href="${path}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${path}/css/board.css">
<link rel="stylesheet" type="text/css" href="${path}/css/footer.css">
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
</script>

</head>
<body>

<%@ include file="/include/header.jsp" %>

		<section class="sub_header_section">
			<h2>고개 문의사항</h2>
		</section>
		<section class="content_section">
			<div class="content_row_1">
				<table class="board_table">
					<caption>문의사항 게시판</caption>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<% for(BoardVo bv : alist) { %>
					<tr>
						<td><%=bv.getBidx() %></td>
						<td>
							<%
							for(int i=1;i<=bv.getNlevel();i++){
								out.print("&nbsp;&nbsp;");
								if(i == bv.getNlevel()){
									out.print("ㄴ");
								}
							}
							
							%>
							<a href="${path}/board/boardContents.do?bidx=<%=bv.getBidx()%>"><%=bv.getB_subject()%></a>
						</td>
						<td><%=bv.getB_member_id()%></td>
						<td><%=bv.getViewcount()%>
						</td>
					</tr>
					<%} %>
					</tbody>
				</table>
			</div>
			<div class="content_row_2">
				<div class="search_box">
					<form name="frm" action="${path}/board/boardList.do" method="post">
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
					<a href="${path}/board/boardWrite.do">글 쓰기</a>
				</div>
			</div>
			<div class="content_row_3">
				<% if(pm.isPrev()==true){ %>
				<a href="${path}/board/boardList.do?page=<%=pm.getStartPage()-1 %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>"><span class="list_prev_btn">문의사항 이전 버튼</span></a>
				<%}%>
				<% for(int i =pm.getStartPage();i<=pm.getEndPage();i++){%>
				<a href="${path}/board/boardList.do?page=<%=i %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>"><%=i %></a>
				<%}%>
				<%if (pm.isNext() && pm.getEndPage()>0) { %>
				<a href="${path}/board/boardList.do?page=<%=pm.getEndPage()+1 %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>">	<span class="list_next_btn">문의사항 다음 버튼</span></a>
				<%}%>			
			</div>
		</section>
	    <%@ include file="/include/footer.jsp" %>
	</body>
</html>