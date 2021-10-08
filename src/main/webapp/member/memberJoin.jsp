<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css?ver=1">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">
		var msg ="${msg}";
		if(msg){
			alert(msg);
		}
	</script>

<style>
@charset "UTF-8";
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

label {
    display: inline-block;
    width: 90%;
    font-size:110%;
    text-align: left;
    border-radius: 15px;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.textlabel {
  position:absolute;
  padding: 30px, 20px;
  font-size:120%;
  text-align:left;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.id {
  width: 70%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  text-align:left;
  height:25px;
  background: none;
}

.zipcode {
  width: 50%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  text-align:left;
  height:25px;
  background: none;
}

.gender{
  width: 25%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.address1, .address2{
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw, .pw2 {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email{
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.tel {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.hp {
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

.btnbasic {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16% 32%;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}

.btnbasic1 {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  text-align: center;
  width: 100%;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}

.btn1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.btn1:hover {
  background-color: #4CAF50;
  color: white;
}

.btn2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.btn2:hover {
  background-color: #008CBA;
  color: white;
}

.btn3 {
  background-color: white; 
  color: black; 
  border: 2px solid #f44336;
}

.btn3:hover {
  background-color: #f44336;
  color: white;
}

.btn4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.btn4:hover {background-color: #e7e7e7;}

.btn5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}

.btn5:hover {
  background-color: #555555;
  color: white;
}

</style>



<script>

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
	}else if (fm.member_pw2.value ==""){
		alert("비밀번호 확인");
		fm.mpwd2.focus();
		return false;
	}else if (fm.member_pw.value != fm.member_pw2.value){
		alert("비밀번호 일치");
		fm.member_pw2.value = "";
		fm.member_pw2.focus();
		return false;
	}else if(fm.member_name.value == ""){
		alert("이름");
		fm.member_name.focus();
		return false;
	}else if(fm.member_zipcode.value == ""){
		alert("우편번호");
		fm.member_zipcode.focus();
		return false;	
	}else if(fm.member_address2.value == ""){
		alert("상세 주소");
		fm.member_address2.focus();
		return false;	
	}else if(fm.member_birth.value == ""){
		alert("생년월일");
		fm.member_birth.focus();
		return false;		
	}else if (fm.member_hp.value == ""){
		alert("휴대폰번호");
		fm.member_hp.focus();
		return false;
	}else if (fm.member_email.value == ""){
	    alert("이메일입력해주세요");
		fm.member_email.focus();
		return false;
	}else{
		var emailVal = fm.member_email.value;
		var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!regExp.test(emailVal)) {
		    alert("올바른 이메일 주소를 입력하세요.");
		    return false;		    
		  }	
		
	}
	
	var idChkVal = $("#idChk").val();
	if(idChkVal == "N"){
		alert("중복확인 버튼을 눌러주세요.");
	}else if(idChkVal == "Y"){
		$("#regForm").submit();
	}
		

	fm.action="<%=request.getContextPath()%>/member/memberJoinAction.do";
	fm.method ="post";
	fm.submit();
		
	return;
}

function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('member_zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('member_address1').value = fullRoadAddr;

       
    }
  }).open();
}

function fn_idChk(){
	$.ajax({
		url : "<%=request.getContextPath()%>/member/memberIdChk.do",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
 }	
</script>

<script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
	}
</script>

</head>
<body>

<form name="frm" class="joinForm">
      <h2>회원가입</h2>
      <div class="textForm">
        <input class="id" type="text" id="userId" name="member_id" placeholder="아이디"/>
		<button class="btn-primary:focus" type="button" id="idChk" onclick="fn_idChk();return false;" value="N">중복확인</button>
      </div>
      <div class="textForm">
        <input name="member_pw" type="password" class="pw" placeholder="비밀번호">
      </div>
       <div class="textForm">
        <input name="member_pw2" type="password" class="pw2" placeholder="비밀번호 확인">
      </div>
      <div class="textForm">
        <input name="member_name" type="text" class="name" placeholder="이름">
      </div>

       <div class="textForm">      
		<input type="text" id="member_zipcode" name="member_zipcode" class="zipcode" placeholder="우편번호" ><input type="button" onclick="javascript:execDaumPostcode()" value="우편번호 찾기" class="btn-primary:focus"><br><br>
		<input  type="text" id="member_address1" name="member_address1" class="address1" placeholder="주소"><br><br>
		<input  type="text" id="member_address2" name="member_address2" class="address2" placeholder="상세주소">        
      </div>
      
       <div class="textForm">       
        <label for="name" class="labelbirth">생년월일</label>
 		<input name="member_birth" type="date" class="btnbasic1 btn5">
	  </div>
      
       <div class="textForm">
        	<input name="member_hp" type="text" class="hp" placeholder="휴대폰 예시)01044442222">
      </div>
      
       <div class="textForm">
        <input id="member_email" name="member_email" type="text" class="email" placeholder="이메일 예시)abcde@mail.com">
	   </div>
       <button onclick="check();return false;" class="btn" >J O I N</button>
</form>
</body>
</html>