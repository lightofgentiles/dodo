<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">
  <div>
    <ul class="hdGnb">
      <c:if test="${sessionScope.memberId != null}">
         <li><a href="<%=request.getContextPath()%>/member/memberLoginout.do">로그아웃</a></li>
      </c:if>      
      <c:if test="${sessionScope.memberId == null}">
     	 <li><a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인</a></li>
      </c:if>

      <li><a href="<%=request.getContextPath()%>/member/memberJoin.do">회원가입</a></li>
      <li><a href="#">장바구니</a></li>
      <li><a href="#">마이쇼핑</a></li>
      <li><a href="<%=request.getContextPath()%>/board/boardList.do">고객문의</a></li>
    </ul>
  </div>

  <nav class="navbar">
    <div class="navbar_logo">
      <i class="fas fa-socks"></i>
      <a href="">DoDo Girls</a>
    </div>

    <ul class="navbar_menu">
      <li><a href="#">HOME</a></li>
      <li><a href="#">NEW10%</a></li>
      <li><a href="#">BEST</a></li>
      <li><a href="outer.jsp">OUTER</a></li>
      <li><a href="#">TOP</a></li>
      <li><a href="#">BLOUSE</a></li>
      <li><a href="#">SKIRT</a></li>
      <li><a href="#">PANTS</a></li>
      <li><a href="#">CONTACT US</a></li>
    </ul>

    <a href="" class="navbar_toogleBtn">
      <i class="fas fa-bars"></i>
    </a>
  </nav>
</header>
