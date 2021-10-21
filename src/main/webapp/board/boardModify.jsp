<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import ="com.ezen.myapp.domain.*" %> 
<%BoardVo bv = (BoardVo)request.getAttribute("bv");%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 문의 수정</title>
<link rel="stylesheet" type="text/css" href="${path}/css/board.css">
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
	}
</script>

<script type="text/javascript">
function check(){
	var fm = document.frm;		
	fm.action="<%=request.getContextPath()%>/board/boardModifyAction.do";
	fm.method="post";
	fm.submit();	
	return;
}
</script>
</head>
<body style="padding-top: 1rem;">
	<div class="navbar">
		<div class="navbar-brand">고객 Q/A 수정</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
	</div>
	<main role="main" class="container">
		<main role="main" class="container">
		<form name="frm">
			<div class="pt-1">
				<input type="text" name="subject" style="border-radius:5px; width:100%; padding:5px;" value="<%=bv.getB_subject()%>"/>
			</div>
			<div class="pt-1">
				<textarea id="summernote" name="contents" cols="10" rows="10" style="width:100%; height:100%;"><%=bv.getB_content()%></textarea>
			</div>
			<div class="pt-1">
				<input type="text" name="pwd_txt" style="color:white;background-color:black; width:10%;text-align: center;padding:5px;" value="비밀번호" readonly>
				<input type="password" name="pwd" style="border-radius:5px; width:20%; padding:5px;"/>
			</div>
			<div class="pt-1 text-right">
			<table  style="width:500px;text-align:right">
			<button name="btn1"class="btn btn btn-success" style="width:10%; padding:5px;" onclick="check(); return false;">확인</button>
			<input type="hidden" name="bidx" value="<%=bv.getBidx()%>">
			</div>
		</form>
	</main>
</body>
</html>