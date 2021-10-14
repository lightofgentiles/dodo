<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
        }
        table.table2 tr {
                 width: 50px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 50px;
                 padding: 10px;
                 vertical-align: top;
                 border-bottom: 1px solid #ccc;
        }
 
</style>
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
	
	fm.action="<%=request.getContextPath()%>/board/boardWriteAction.do";
	fm.method="post";
	//ultipart library에서 muti recate가 넘어간다
	//fm.enctype="multipart/form-data";

	fm.submit();
	
	return;
}
</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Form</h2>
<form name="frm">
 			<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

					<input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요">

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">TAG</label>

					<input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">

				</div>
</form>

			<div >

				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>

		</div>

	</article>


</body>
</html>