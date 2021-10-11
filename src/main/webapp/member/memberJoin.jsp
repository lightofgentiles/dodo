<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoDo Girl 회원가입</title>
 <link rel="stylesheet" href="${path}/css/join.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/js/join.js" defer> </script>

<script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);	
</script>

<script>

function join(){
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
	
$("#member_id").blur(function() {
	// id = "id_reg" / name = "userId"
	var user_id = $('#member_id').val();
	$.ajax({
		url : '${path}/member/memberIdChk.do?member_id='+ user_id,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if(idJ.test(user_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						$("#reg_submit").attr("disabled", false);
			
					} else if(user_id == ""){
						
						$('#id_check').text('아이디를 입력해주세요 :)');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						
						$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});
	
</script>


</head>
<body>

 <!-- header -->
  <div id="header">
    <a><img src="${path}/img/DODO_CI.png" id="logo" /></a>
  </div>
<form name="frm" class="joinForm">
<!-- wrapper -->
    <div id="wrapper">
      <!-- content-->
      <div id="content">
        <!-- ID -->
        <div>
          <h3 class="join_title">
            <label for="id">아이디</label>
          </h3>
          <span class="box int_id">
            <input name="member_id" type="text" id="member_id" class="int" maxlength="20" placeholder="아이디" required />
			<div class="check_font" id="id_check"></div>
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- PW1 -->
        <div>
          <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
          <span class="box int_pass">
            <input name="member_pw" type="text" id="pswd1" class="int" maxlength="20" />
            <span id="alertTxt">사용불가</span>
            <img src="${path}/img/m_icon_pass.png" id="pswd1_img1" class="pswdImg" />
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- PW2 -->
        <div>
          <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
          <span class="box int_pass_check">
            <input name="member_pw2" type="text" id="pswd2" class="int" maxlength="20" />
            <img
              src="${path}/img/m_icon_check_disable.png"
              id="pswd2_img1"
              class="pswdImg"
            />
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- NAME -->
        <div>
          <h3 class="join_title"><label for="name">이름</label></h3>
          <span class="box int_name">
            <input name="member_name" type="text" id="name" class="int" maxlength="20" />
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- BIRTH -->
        <div>
          <h3 class="join_title"><label for="yy">생년월일</label></h3>

          <div id="bir_wrap">
            <!-- BIRTH_YY -->
            <div id="bir_yy">
              <span class="box">
                <input name="birth_year"
                  type="text"
                  id="yy"
                  class="int"
                  maxlength="4"
                  placeholder="년(4자)"
                />
              </span>
            </div>

            <!-- BIRTH_MM -->
            <div id="bir_mm">
              <span class="box">
                <select name="birth_month"id="mm" class="sel">
                  <option>월</option>
                  <option value="01">1</option>
                  <option value="02">2</option>
                  <option value="03">3</option>
                  <option value="04">4</option>
                  <option value="05">5</option>
                  <option value="06">6</option>
                  <option value="07">7</option>
                  <option value="08">8</option>
                  <option value="09">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
              </span>
            </div>

            <!-- BIRTH_DD -->
            <div id="bir_dd">
              <span class="box">
                <input
                  type="text" name="birth_day"
                  id="dd"
                  class="int"
                  maxlength="2"
                  placeholder="일"
                />
              </span>
            </div>
          </div>
          <span class="error_next_box"></span>
        </div>

        <!-- address -->
        <div>
          <h3 class="join_title"><label for="address">주소</label></h3>
          <span class="address_code">
            <div class="zipcode_btns">
              <input type="text" id="member_zipcode" name="member_zipcode" class="zipcode" placeholder="우편번호"/>
              <input type="button" id="zipcode_btn" class="zipcode_btn" onclick="javascript:execDaumPostcode()" value="우편번호 찾기"/>
            </div>
            <br />
            <input type="text" id="member_address1" name="member_address1" class="address1" placeholder="주소"/>
            <input type="text" id="member_address2" name="member_address2" class="address2" placeholder="상세주소"/>
          </span>
          <span class="error_next_box">필수 정보입니다.</span>
        </div>

        <!-- EMAIL -->
        <div>
          <h3 class="join_title">
            <label for="email">이메일</label>
          </h3>
          <span class="box int_email">
            <input type="text" name="member_email" id="email" class="int" maxlength="100" />
          </span>
          <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
        </div>

        <!-- MOBILE -->
        <div>
          <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
          <span class="box int_mobile">
            <input type="tel" name="member_hp" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력"/>
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- JOIN BTN-->
        <div class="btn_area"> 
          <button type="button" id="btnJoin" onclick="join();return false;" /><span>가입하기</span></button>           
        </div>
      </div>
      <!-- content-->
    </div>
    <!-- wrapper -->
</form>
</body>
</html>