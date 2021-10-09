<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

@charset "UTF-8";
*{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
      background: #f8f8f8;
        padding: 60px 0;
}

#login-form > div {
        margin: 15px 0;
    }

.loginForm {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h2{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}



</style>

<script type="text/javascript">

function check(){

	var fm = document.frm;
	
	if (fm.member_id.value == ""){
		alert("아이디");
	    fm.member_id.focus();
	    return false;		
	}else if (fm.member_pw.value ==""){
		alert("비밀번호");
		fm.member_pw.focus();
		return false;
	}
	
	fm.action="<%=request.getContextPath()%>/member/memberLoginAction.do";
	fm.method="post";
	fm.submit();	
	return;
}

</script>

	<script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
		}
	</script>


</head>
<body width="100%" height="100%">
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title"></div>
            </div>
            <div class="panel-body">
				<form name="frm" class="loginForm">
				 <h2>Login</h2>
				      <div class="idForm">
				        <input type="text" name="member_id" class="id" placeholder="ID">
				      </div>
				      <div class="passForm">
				        <input type="password" name="member_pw" class="pw" placeholder="PW">
				      </div>
				      <button type="button" class="btn" onclick="check(); return false;">
				        로 그 인
				      </button>
				          <div class="bottomText">
				        Don't you have ID? <a href="<%=request.getContextPath()%>/member/memberJoin.do">회원 가입</a>
				      </div>
				      
				</form>
</body>
</html>