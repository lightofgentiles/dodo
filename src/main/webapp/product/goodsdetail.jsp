<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ page import ="com.ezen.myapp.domain.*" %>   
<%ProductVo pv = (ProductVo)request.getAttribute("pv");%>    


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="${path}/css/header.css?ver=1" />
	    <link rel="stylesheet" type="text/css" href="${path}/css/reset.css" />
	    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
	    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script src="${path}/js/header.js" defer> </script>
	    <script src="${path}/js/jquery.min.js" defer></script>
		<script src="${path}/js/flat.min.js" defer></script>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/css/gooddetall.css" rel="stylesheet" />
    <script>
    
	    $(document).ready(function(){
	    	document.getElementById("total_price").innerHTML=<%=pv.getP_price()%>;
	    	document.getElementById("total_price1").value=<%=pv.getP_price()%>;
	    });	
    
    
	    function check(){	    	
	    	var x = document.getElementById("inputQuantity").value;
	    	if(x>=1){
	    		document.getElementById("total_price").innerHTML=x*<%=pv.getP_price()%>;
	    		document.getElementById("total_price1").value=x*<%=pv.getP_price()%>;
	    	}else{
	    		document.getElementById("inputQuantity").value = 1;
	    	}	    	
	    }  
    
    </script>    
    
        
        
    </head>
    <body>
       
       	<%@ include file="/include/header.jsp" %>
       
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-5"><img class="card-img-top mb-5 mb-md-0" src="${path}/images/p_images/<%=pv.getP_img()%>" alt="..." /></div>
                    <div class="col-md-6 ms-auto">
                        <div class="small mb-1">상품코드: <%=pv.getP_code()%></div>
                        <h6 class="display-6 fw-bolder"><%=pv.getP_name()%></h6> 
                        <div>
	                        <br>
	                        <br>
                        <br>
	                        <br>
	                        <br>	
                        </div>                  
							<div id="item_option">
								<table>
									<tr>
										<td><select name="ColorList" id="ColorList" class='total_cartAdd'
											style="width: 600px; height: 30px;">
												<option value="">==(필수)옵션: 색상 선택 ==</option>
												<c:forEach var="ColorList" items="${Color}" varStatus="index">
													<option value="${ColorList}">${ColorList}</option>
												</c:forEach>
										</select></td>
										
				
									</tr>
				
									<tr>
										<td><select name="SizeList" id="SizeList" class='total_cartAdd'
											style="width: 600px; height: 30px;">
												<option value="">==(필수)옵션: 사이즈 선택 ==</option>
												<c:forEach var="SizeList" items="${Size}" varStatus="index">
													<option value="${SizeList}">${SizeList}</option>
												</c:forEach>
										</select></td>
									
									</tr>
								</table>
							</div>
						 <div>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
	                        <br>
                        </div>	
                        
                         <div class="fs-5 mb-5">
                         	<label class="total_price">총상품금액 : </label>&nbsp;&nbsp;
                            <!--<span class="text-decoration-line-through">$45.00</span>-->
                            <label class="total_price" id="total_price"></label>원&nbsp;&nbsp;
              				<input type="hidden" class="total_price" id="total_price1"/>
                        </div>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="number" value="1" style="max-width: 3rem" onchange="check()"/>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                               	 	장바구니
                            </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                              	<i class="bi bi-bag-fill"></i>
                                	구매하기
                            </button>
                        </div>

        
                        	
                    </div>
                </div>
            </div>
      
        </section>
        
        <div style="clear: both;"></div>

	<br><br><br><br><br>
	<div align="center">
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 60%">
			<li class="nav-item" role="presentation" style="width: 25%" id="f1"><a
				class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
				role="tab" aria-controls="home" aria-selected="true" onClick="fnMove(1)">상세정보</a></li>
			<li class="nav-item" role="presentation" style="width: 25%"><a
				 id="profile-tab"  href="#profile"
				role="tab" aria-controls="profile" aria-selected="false" onClick="fnMove(2)">상품문의</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="contact-tab"  href="#contact"
				role="tab" aria-controls="contact" aria-selected="false" onClick="fnMove(3)">쇼핑가이드</a></li>
			<li class="nav-item" role="presentation" style="width: 25%"><a
				 id="contact-tab"  href="#re"
				role="tab" aria-controls="re" aria-selected="false" onClick="fnMove(4)">상품평</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">${list.GOODS_CONTENT}</div>
			<!-- 상세정보 -->

	</div>
</div>
	<br>
	<br>

	<div align="center">
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 60%">
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="home-tab"  href="#home1"
				role="tab" aria-controls="home1" aria-selected="false" onClick="fnMove(1)">상세정보</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" id="f2"><a
				class="nav-link active" id="profile-tab" data-toggle="tab"
				href="#profile1" role="tab" aria-controls="profile1"
				aria-selected="true" onClick="fnMove(2)">상품문의</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="contact-tab"  href="#contact1"
				role="tab" aria-controls="contact1" aria-selected="false" onClick="fnMove(3)">쇼핑가이드</a>
			</li>
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="contact-tab"  href="#re1"
				role="tab" aria-controls="re1" aria-selected="false" onClick="fnMove(4)">상품평</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">

			<div class="tab-pane fade show active" id="profile1" role="tabpanel"
				aria-labelledby="profile-tab1">
				<!-- 상품문의 -->

				<table align="center" class="board_list">
					<colgroup>
						<col width="9%" />
						<col>
						<col width="15%" />
						<col width="14%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>문의</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
				</table>
				<table class="board_list2">

					<tbody id="board_list1" name="board_list1">
					<colgroup>
						<col width="9%" />
						<col>
						<col width="10%" />
						<col width="13%" />
						<col width="13%" />
					</colgroup>

					</tbody>
				</table>
				<br>
				<div style="margin-left: 1050px">
					<button type="button" class="btn btn-secondary btn-sm"
						onclick="fn_Qna()">상품문의</button>
				</div>



			</div>
</div>
	</div>

	<br>
	<br>

	<div align="center">
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 60%">
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="home-tab"  href="#home2"
				role="tab" aria-controls="home2" aria-selected="false" onClick="fnMove(1)">상세정보</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="profile-tab"  href="#profile2"
				role="tab" aria-controls="profile2" aria-selected="false" onClick="fnMove(2)">상품문의</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" id="f3"><a
				class="nav-link active" id="contact-tab" data-toggle="tab"
				href="#contact2" role="tab" aria-controls="contact2"
				aria-selected="true" onClick="fnMove(3)">쇼핑가이드</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="contact-tab"  href="#re2"
				role="tab" aria-controls="re2" aria-selected="false" onClick="fnMove(4)">상품평</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			
			
			<div class="tab-pane fade show active" id="contact2" role="tabpanel"
				aria-labelledby="contact-tab" align="left"
				style="margin-left: 400px">
				<!-- 쇼핑가이드 -->
				<%@ include file="/product/guide.jsp"%>
			</div>
			
	</div>
</div>

	<br>
	<br>

	<div align="center">
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 60%">
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="home-tab"  href="#home3"
				role="tab" aria-controls="home3" aria-selected="false" onClick="fnMove(1)">상세정보</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="profile-tab"  href="#profile3"
				role="tab" aria-controls="profile3" aria-selected="false" onClick="fnMove(2)">상품문의</a></li>
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="contact-tab"  href="#contact3"
				role="tab" aria-controls="contact3" aria-selected="false" onClick="fnMove(3)">쇼핑가이드</a>
			</li>
			<li class="nav-item" role="presentation" style="width: 25%" id="f4"><a
				class="nav-link active" id="contact-tab" data-toggle="tab"
				href="#re3" role="tab" aria-controls="re3" aria-selected="true" onClick="fnMove(4)">상품평</a>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			
			
			<div class="tab-pane fade show active" id="re3" role="tabpanel"
				aria-labelledby="contact-tab">
				<!-- 상품평 -->

				<div class="xans-element- xans-product xans-product-review">
					<div class="ec-base-table typeList">
						<br>
						<h3>REVIEW</h3>
						<p class="desc">상품의 사용후기를 적어주세요.</p>
						<table border="1" width="60%">
							<caption></caption>
							<colgroup>
								<col style="width: 70px;">
								<col style="width: auto">
								<col style="width: 120px;">
								<col style="width: 120px;">
								<col style="width: 80px;" class="displaynone">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th colspan="2"scope="col">작성일</th>
	
									<th scope="col" class="displaynone">평점</th>
								</tr>
							</thead>

							<tbody id="reviewList" name="reviewList">
							</tbody>

						</table>
					</div>
				</div>

				<div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
				<div style="margin-left: 1050px">
					<button type="button" class="btn btn-secondary btn-sm"
						onclick="fn_Review()">WRITE</button>
				</div>

			</div>
		</div>
	
        

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>