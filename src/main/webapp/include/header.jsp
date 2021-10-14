<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="info_section">
			<ul class="info_list">
				<li><a href="${path}/main/main.do"><img src="${path}/images/s_images/info_icon_01.png" alt="HOME"></a></li>
				<c:if test="${sessionScope.memberId != null}">
<<<<<<< HEAD
<<<<<<< HEAD
         			<li><a href="${path}/member/memberLoginout.do"><img src="${path}/images/s_images/info_icon_02_1.png" alt="로그아웃"></a></li>
=======
         			<li><a href="${path}/member/memberLogin.do"><img src="${path}/images/s_images/info_icon_02_1.png" alt="로그아웃"></a></li>
>>>>>>> 452954e0f0ef749ce033c1355f1d7131cc49ca79
=======
         			<li><a href="${path}/member/memberLoginout.do"><img src="${path}/images/s_images/info_icon_02_1.png" alt="로그아웃"></a></li>
         			<li><a href="${path}/member/memberJoin.do"><img src="${path}/images/s_images/info_icon_03.png" alt="회원가입"></a></li>
>>>>>>> 8c4bf57b103bc87eec43cf1045e1fe0ca22cbbf3
         			<li><a href="${path}/board/boardList.do"><img src="${path}/images/s_images/info_icon_04.png?ver=1" alt="고객문의"></a></li>
      			</c:if>      
      			<c:if test="${sessionScope.memberId == null}">
     	 			<li><a href="${path}/member/memberLogin.do"><img src="${path}/images/s_images/info_icon_02.png" alt="로그인"></a></li>
<<<<<<< HEAD
<<<<<<< HEAD
					<li><a href="${path}/member/memberJoin.do"><img src="${path}/images/s_images/info_icon_03.png" alt="회원가입"></a></li>
					<li><a href="${path}/board/boardList.do"><img src="${path}/images/s_images/info_icon_04.png?ver=1" alt="고객문의"></a></li>			
=======
					<li><a href="${path}/member/memberJoin.do"><img src="${path}/images/s_images/info_icon_03.png" alt="회원가입"></a></li>			
>>>>>>> 452954e0f0ef749ce033c1355f1d7131cc49ca79
=======
					<li><a href="${path}/member/memberJoin.do"><img src="${path}/images/s_images/info_icon_03.png" alt="회원가입"></a></li>
					<li><a href="${path}/board/boardList.do"><img src="${path}/images/s_images/info_icon_04.png?ver=1" alt="고객문의"></a></li>
>>>>>>> 8c4bf57b103bc87eec43cf1045e1fe0ca22cbbf3
      			</c:if>

			</ul>
		</div>
		<header class="header">
			<h1 class="logo">
<<<<<<< HEAD
<<<<<<< HEAD
				<a href="${path}/main/main.do">DODO<br>GIRL</a>
=======
				<a href="index.html">DODO<br>GIRL</a>
>>>>>>> 452954e0f0ef749ce033c1355f1d7131cc49ca79
=======
				<a href="${path}/main/main.do">DODO<br>GIRL</a>
>>>>>>> 8c4bf57b103bc87eec43cf1045e1fe0ca22cbbf3
			</h1>
			<nav class="nav">
				<ul class="gnb">
					<li><a href="${path}/main/main.do">HOME</a></li>
<<<<<<< HEAD
<<<<<<< HEAD
					<li><a href="#">NEW10%</a></li>
=======
                    <li><a href="#">NEW10%</a></li>
>>>>>>> 8c4bf57b103bc87eec43cf1045e1fe0ca22cbbf3
					<li><a href="#">BEST</a></li>
					<li><a href="#">OUTER</a></li>
				    <li><a href="#">TOP</a></li>
				    <li><a href="#">BLOUSE</a></li>
					<li><a href="#">SKIRT</a></li>	
<<<<<<< HEAD
					<li><a href="#">PANTS</a></li>					
=======
					<li><a href="introudce.html">NEW10%</a></li>
					<li><a href="gallery.html">BEST</a></li>
					<li><a href="board.html">OUTER</a></li>
				    <li><a href="board.html">TOP</a></li>
				    <li><a href="board.html">BLOUSE</a></li>
					<li><a href="board.html">SKIRT</a></li>	
					<li><a href="board.html">PANTS</a></li>					
>>>>>>> 452954e0f0ef749ce033c1355f1d7131cc49ca79
=======
					<li><a href="#">PANTS</a></li>
>>>>>>> 8c4bf57b103bc87eec43cf1045e1fe0ca22cbbf3
					<!-- <li><a href="board.html">PANTS</a><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span></li> -->
				</ul>
			</nav>
			<span class="menu_toggle_btn">전체 메뉴 토글 버튼</span>
		</header>
