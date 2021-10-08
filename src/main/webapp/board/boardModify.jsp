<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.ezen.myapp.domain.*" %> 
<%BoardVo bv = (BoardVo)request.getAttribute("bv");%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
	}
</script>

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
	}else if (fm.writer.value == ""){
		alert("작성자를 입력하세요");
		fm.writer.focus();
		return false;
	}else if (fm.pwd.value == ""){
		alert("비번을 입력하세요");
		fm.pwd.focus();
		return false;
	}		
	
	fm.action="<%=request.getContextPath()%>/board/boardModifyAction.do";
	fm.method="post";
	fm.submit();	
	return;
}
</script>
</head>
<body>
<form name="frm">
<table border=1 style="width:500px">
	<input type="hidden" name="bidx" value="<%=bv.getBidx()%>">
	<tr>
		<td>제목</td>
		<td>
		<input type="text" name="subject" value="<%=bv.getSubject()%>">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
		<textarea name="contents" cols=50  rows=5><%=bv.getContents()%></textarea>
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>
		<input type="text" name="writer" value="<%=bv.getWriter()%>">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
		<input type="password" name="pwd" >
		</td>
	</tr>
	<tr>
		<td colspan=2>
		<button name="btn1" onclick="check();return false;">확인</button>
		<button name="btn2" onclick="reset();">리셋</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>