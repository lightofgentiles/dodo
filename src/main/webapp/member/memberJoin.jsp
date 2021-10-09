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

	<script type="text/javascript">
		var msg ="${msg}";
		if(msg){
			alert(msg);
		}
	</script>

<script>




//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
	
		$.ajax({
			url : "<%=request.getContextPath()%>/member/memberIdChk.do?member_id="+ user_id,
			type : "get",
			success : function(data) {	
				
				if (data.result == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
				}else {
						
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
});
</script>

</head>
<body>

 <!-- header -->
  <div id="header">
    <a><img src="${path}/images/DODO_CI.png" id="logo" /></a>
  </div>

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
            <input name="member_id" type="text" id="id" class="int" maxlength="20" />
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- PW1 -->
        <div>
          <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
          <span class="box int_pass">
            <input name="member_pw" type="text" id="pswd1" class="int" maxlength="20" />
            <span id="alertTxt">사용불가</span>
            <img src="${path}/images/m_icon_pass.png" id="pswd1_img1" class="pswdImg" />
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- PW2 -->
        <div>
          <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
          <span class="box int_pass_check">
            <input type="text" id="pswd2" class="int" maxlength="20" />
            <img
              src="${path}/images/m_icon_check_disable.png"
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
              <input
                type="text"
                id="member_zipcode"
                name="member_zipcode"
                class="zipcode"
                placeholder="우편번호"
              /><input
                type="button"
                class="btn"
                onclick="javascript:execDaumPostcode()"
                value="우편번호 찾기"
              />
            </div>
            <br />
            <input
              type="text"
              id="member_address1"
              name="member_address1"
              class="address1"
              placeholder="주소"
            />
            <input
              type="text"
              id="member_address2"
              name="member_address2"
              class="address2"
              placeholder="상세주소"
            />
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
            <input type="tel" name="member_hp"
              id="mobile"
              class="int"
              maxlength="16"
              placeholder="전화번호 입력"
            />
          </span>
          <span class="error_next_box"></span>
        </div>

        <!-- JOIN BTN-->
        <div class="btn_area">
          <button type="button" id="btnJoin">
            <span>가입하기</span>
          </button>
        </div>
      </div>
      <!-- content-->
    </div>
    <!-- wrapper -->
    <script src="${path}/js/join.js"></script>
</body>
</html>