<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<div class="info_section">
			<ul class="info_list">
				<li><a href="${path}/main/main.do"><img src="${path}/images/s_images/info_icon_01.png" alt="HOME"></a></li>
	         	<li><a href="${path}/member/memberLoginout.do"><img src="${path}/images/s_images/info_icon_02_1.png" alt="로그아웃"></a></li>
			</ul>
		</div>
		
		<header class="header">
			<h1 class="logo">
				<a href="#">관리자<br>페이지</a>
			</h1>
			<nav class="nav">
				<ul class="gnb">
					<li><a href="#">상품관리</a></li>
					<li><a href="#">주문현황</a></li>
					<li><a href="#">고객요청</a></li>
				</ul>
			</nav>
			<span class="menu_toggle_btn">전체 메뉴 토글 버튼</span>
		</header>
