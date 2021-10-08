<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %> 
<%@ page import ="com.ezen.myapp.domain.*" %> 

<%ArrayList<BoardVo> alist = (ArrayList<BoardVo>) request.getAttribute("alist"); %>    
 <%PageMaker pm = (PageMaker)request.getAttribute("pm"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!--  Bootstrap css -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css?ver=1">

<script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
	}
</script>

</head>
<body>
<div class="container">
	<br>
	<h1 class="text-center"><a href="#">공지사항</a></h1>
	<br>
	<br>
</div>

<form name="frm" class="form-inline my-2 my-lg-0" action="<%=request.getContextPath()%>/board/boardList.do" method="post">

<table class="table table-bordered" style="border:1px solid;">
	<tr>
		<td>
			<select name="searchType">
				<% if(pm.getScri().getSearchType().equals("subject")){ %>
				<option value="subject" selected>제목</option>
				<option value="writer">작성자</option>
				<%}
				else if (pm.getScri().getSearchType().equals("writer")){ %>
				<option value="subject">제목</option>
				<option value="writer" selected>작성자</option>
				<%} %>
			</select>
		</td>
		
		<td>
		<input type="text" class="form-control mr-sm-2" name="keyword" placeholder="Search" size="10">
		</td>		
		<td>      
		<button class="btn btn-outline-success my-2 my-sm-0" name="submit" type="submit">검색</button>   
		</td>
	</tr>
</table>
</form>


<table class="table table-striped" style="border:1px solid;">
	<tr>
		<td>게시물번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>날짜</td>
		<td>파일</td>
	</tr>
	
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
			<a href="<%=request.getContextPath()%>/board/boardContents.do?bidx=<%=bv.getBidx()%>"><%=bv.getSubject() %></a>
		</td>
		<td><%=bv.getWriter() %></td>
		<td><%=bv.getWriteday() %></td>
		<td>
		<%if(bv.getFilename()!=null) {%>
		<a href ="<%=request.getContextPath()%>/board/fileDownload.do?filename=<%=bv.getFilename()%>"><img src="../image/file.gif" alt=""></a>
		<%} %>
		</td>
	</tr>
	<%} %>
</table>

<a href="<%=request.getContextPath() %>/board/boardWrite.do" class="btn btn-default pull-right">글쓰기</a>
<table border=1 style="width:500px">
	<tr>
		<td>
		<% if(pm.isPrev()==true){ %>
		<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getStartPage()-1 %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>">이전</a>
		<%}%>
		</td>
			<td>
				<div class="text-center">
				<ul class="pagination">
				<li>
				<% for(int i =pm.getStartPage();i<=pm.getEndPage();i++){%>
				<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=i %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>"><%=i %></a>
				<%}%>
				</li>
				</ul>
				</div>		
			</td>
		<td><%if (pm.isNext() && pm.getEndPage()>0) { %>
			<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getEndPage()+1 %>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>&searchType=<%=pm.getScri().getSearchType()%>">다음</a>
			<%}%>
		</td>
	</tr>
</table>

</body>
</html>