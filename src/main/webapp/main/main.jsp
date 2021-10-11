<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <title>You are a pretty girl</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${path}/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${path}/css/auto_slide.css" />
    <link rel="stylesheet" type="text/css" href="${path}/css/header.css" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
    <script src="${path}/js/header.js" defer> </script>
    <script src="${path}/js/auto_slide.js" defer> </script>
    <script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
	}
	</script>
	
  </head>
  <body>  

<%@ include file="/include/header.jsp" %>

<div class="slideshow-container">

  <div class="mySlides fade">
    <img src="${path}/img/p-img/slide01.jpg" >
  </div>

  <div class="mySlides fade">
    <img src="${path}/img/p-img/slide02.jpg" >
  </div>

  <div class="mySlides fade">
    <img src="${path}/img/p-img/slide03.jpg" >
  </div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>    
    <br>
    <br>
    <br>
      <!--Main -->
      <h1 class="main_text">Best Item</h1>
      <div class="table-wrap">
          <div class="item1">
              <img src="${path}/img/p-img/best1.gif"/>
              <p>빌리 배색체크 자켓 정장세트</p>
              <p>99,900원</p>
            </div>
            <div class="item2">
              <img src="${path}/img/p-img/best2.gif"/>
              <p>코코 수술 트위드자켓</p>
              <p>99,900원</p>
            </div>
            <div class="item3">
              <img src="${path}/img/p-img/best3.gif"/>
              <p>콤비제인 스판 자켓</p>
              <p>59,900원</p>
            </div>
            <div class="item4">
              <img src="${path}/img/p-img/best4.gif"/>
              <p>릴리프 배색 정장세</p>
              <p>129,000원</p>
            </div>
            <div class="item5">
              <img src="${path}/img/p-img/best5.jpg"/>
              <p>밀러스 더블 정장 자켓</p>
              <p>39,900원</p>
            </div>
            <div class="item6">
              <img src="${path}/img/p-img/best6.gif"/>
              <p>골지 배색 후드 집업</p>
              <p>49,900원</p>
          </div>
       </div>     
    </div>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
