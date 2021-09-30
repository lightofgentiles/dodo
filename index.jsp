<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <title>You are a pretty girl</title>
    <link rel="stylesheet" type="text/css" href="css/default.css" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
    <script src="/js/main.js" defer> </script>
  </head>
  <body>  

    <%@ include file="/include/header.jsp" %>
    <article class="slider">
      <div id="slideShow">
        <img src="images/p-images/slide01.jpg" alt="">
      </div>
    </article>
   
      
      <!--Main -->
      <h1 class="main_text"><img src="images/p-images/bestitems.png" alt=""></h1>
      <div class="table-wrap">
          <div class="item1">
              <img src="images/p-images/best1.gif"/>
              <p>빌리 배색체크 자켓 정장세트</p>
              <p>99,900원</p>
            </div>
            <div class="item2">
              <img src="images/p-images/best2.gif"/>
              <p>코코 수술 트위드자켓</p>
              <p>99,900원</p>
            </div>
            <div class="item3">
              <img src="images/p-images/best3.gif"/>
              <p>콤비제인 스판 자켓</p>
              <p>59,900원</p>
            </div>
            <div class="item4">
              <img src="images/p-images/best4.gif"/>
              <p>릴리프 배색 정장세</p>
              <p>129,000원</p>
            </div>
            <div class="item5">
              <img src="images/p-images/best5.jpg"/>
              <p>밀러스 더블 정장 자켓</p>
              <p>39,900원</p>
            </div>
            <div class="item6">
              <img src="images/p-images/best6.gif"/>
              <p>골지 배색 후드 집업</p>
              <p>49,900원</p>
          </div>
       </div>     
    </div>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
