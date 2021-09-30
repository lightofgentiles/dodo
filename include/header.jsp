<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="header"> 
  <div>
    <ul class="hdGnb"> 
      <li><a href="#">로그인</a></li>
      <li><a href="#">회원가입</a></li>
      <li><a href="#">장바구니</a></li>
      <li><a href="#">마이쇼핑</a></li>
      <li><a href="#">장바구니</a></li>
    </ul>
  </div>
  

                 
    <nav class="navbar">
      <div class="navbar_logo"> 
        <i class="fas fa-socks"></i>
        <a href="<%=request.getContextPath()%>/main/main.do">DoDo Girls</a>
      </div>
      
      <ul class="navbar_menu"> 
        <li><a href="<%=request.getContextPath()%>/main/main.do">HOME</a></li>
        <li><a href="#">NEW10%</a></li>
        <li><a href="#">BEST</a></li>
        <li><a href="#">OUTER</a></li>
        <li><a href="#">TOP</a></li>
        <li><a href="#">BLOUSE</a></li>
        <li><a href="#">SKIRT</a></li>
        <li><a href="#">PANTS</a></li>
        <li><a href="#">CONTACT US</a></li>	
      </ul>
      
      <ul class="navbar_icons"> 
        <i class="fab fa-twitter"></i>
        <i class="fab fa-facebook"></i>    	
      </ul>
      
      <a href="#" class="navbar_toogleBtn">
        <i class="fas fa-bars"></i>
      </a>
          
    </nav>         

  </header>