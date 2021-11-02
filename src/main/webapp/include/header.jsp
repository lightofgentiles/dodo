<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="info_section">
			<ul class="info_list">
				<li><a href="${path}/main/main.do"><img src="${path}/images/s_images/info_icon_01.png" title="HOME"></a></li>
				<c:if test="${sessionScope.memberId != null}">	
	         			<li><a href="${path}/member/memberLoginout.do"><img src="${path}/images/s_images/info_icon_02_1.png" title="로그아웃"></a></li>
	         			<li><a href="${path}/member/memberJoin.do"><img src="${path}/images/s_images/info_icon_03.png" title="회원가입"></a></li>
	         			<li><a href="${path}/board/boardList.do"><img src="${path}/images/s_images/info_icon_04.png?ver=1" title="고객문의"></a></li>
	         		<c:if test="${sessionScope.member_level eq 'admin'}" >	
	         			<li><a href="${path}/admin/main.do"><img src="${path}/images/s_images/admin.png?ver=1" title="관리자"></a></li>
         			</c:if>
      			</c:if>      
      			<c:if test="${sessionScope.memberId == null}">
     	 			<li><a href="${path}/member/memberLogin.do"><img src="${path}/images/s_images/info_icon_02.png" title="로그인"></a></li>
					<li><a href="${path}/member/memberJoin.do"><img src="${path}/images/s_images/info_icon_03.png" title="회원가입"></a></li>
					<li><a href="${path}/board/boardList.do"><img src="${path}/images/s_images/info_icon_04.png?ver=1" title="고객문의"></a></li>			
      			</c:if>

			</ul>
		</div>
		<header class="header">
			<h1 class="logo">
				<a href="${path}/main/main.do">DODO<br>GIRL</a>
			</h1>
			<nav class="nav">
				<ul class="gnb">
					<li><a href="${path}/main/main.do">HOME</a></li>
					<li><a href="#">NEW10%</a></li>
					<li><a href="#">BEST</a></li>
					<li><a href="${path}/product/outer.do">OUTER</a></li>
					    <li><a href="${path}/product/blouse.do"">BLOUSE</a></li>
					<li><a href="${path}/product/top.do"">TOP</a></li>
					<li><a href="${path}/product/pants.do"">PANTS</a></li>
					<!-- <li><a href="board.html">PANTS</a><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span></li> -->
				</ul>
			</nav>
			<span class="menu_toggle_btn">전체 메뉴 토글 버튼</span>
		</header>
