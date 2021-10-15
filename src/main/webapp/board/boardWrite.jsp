<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 문의 하기</title>
<link rel="stylesheet" type="text/css" href="${path}/css/board.css">
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script type="text/javascript">
function check(){
	var fm = document.frm;
	
	if (fm.subject.value == ""){
		alert("제목을 입력하세요");
		fm.subject.focus();
		return false;
	}else if (fm.contents.value == ""){
		alert("내용을 입력하세요");
		fm.contents.focus();
		return false;
	}else if (fm.pwd.value == ""){
		alert("비번을 입력하세요");
		fm.pwd.focus();
		return false;
	}	
	
	fm.action="${path}/board/boardWriteAction.do";
	fm.method="post";
	//ultipart library에서 muti recate가 넘어간다
	//fm.enctype="multipart/form-data";

	fm.submit();
	
	return;
}
</script>
</head>
<body style="padding-top: 1rem;">
	<div class="navbar">
		<div class="navbar-brand">고객 문의 하기</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
	</div>
	<main role="main" class="container">
		<form name="frm">
			<div class="pt-1">
				<input type="text" name="subject" placeholder="제목을 입력하세요" style="border-radius:5px; width:100%; padding:5px;">
			</div>
			<div class="pt-1">
				<textarea id="summernote" name="contents"></textarea>
			</div>
			<script>
			$('#summernote').summernote({
			placeholder: '내용을 입력해주세요',
			tabsize: 2,
			height: 300
			});
			</script>
			<div class="pt-1">
				<input type="password" name="pwd" placeholder="비밀번호" style="border-radius:5px; width:20%; padding:5px;">
			</div>
			<div class="pt-1 text-right">
				<button name="btn1"class="btn btn btn-success" style="width:10%; padding:5px;"" onclick="check();return false;">제출</button>
			</div>
		</form>
	</main>
</body>
</html>