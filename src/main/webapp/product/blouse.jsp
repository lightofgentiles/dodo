<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.ArrayList" %> 
<%@ page import ="com.ezen.myapp.domain.*" %> 
<%PageMaker pm = (PageMaker)request.getAttribute("pm"); %> 
<%ArrayList<ProductVo> alist = (ArrayList<ProductVo>) request.getAttribute("alist"); %>  

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <title>You are a pretty girl</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${path}/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${path}/css/header.css?ver=1" />
    <link rel="stylesheet" type="text/css" href="${path}/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${path}/css/product.css" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
    <script src="${path}/js/header.js" defer> </script>
    <script src="${path}/js/auto_slide.js" defer> </script>
    <script src="${path}/js/jquery.min.js" defer></script>
	<script src="${path}/js/flat.min.js" defer></script>
    <script type="text/javascript">
	var msg ="${msg}";
	if(msg){
		alert(msg);
	}
	</script>
	
  </head>
  <body>  

	<%@ include file="/include/header.jsp" %>

	<div style="text-align:center">
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	</div>    
    <br>

      <!--Main -->
	  <div style="text-align : center;"><img src="${path}/images/s_images/blouse.jpg" ></div>
      <div class="table-wrap">
	      	<div class="table-box table-box--vertical">
		      <c:set var="i" value="0" /> 
		      <c:set var="j" value="3" /> 
			      <table border="2" class="table table--vertical" cellspacing="0" cellpadding="0"> 
					<% for(ProductVo pv : alist) { %>  
				      	<c:if test="${i%j == 0 }"> 
					      	<tr> 
					      	</c:if> 
					      		<td>
							      <img src="${path}/images/p_images/<%=pv.getP_img()%>">
					              <p><%=pv.getP_name()%></p>
					              <p><%=pv.getP_price()%></p>
			              		</td>
					      	<c:if test="${i%j == j-1 }"> 
					      	</tr> 
				      	</c:if> <c:set var="i" value="${i+1 }" /> 
					<%} %>
			      </table>
	         </div>
      </div>     
       
       <%@ include file="/include/footer.jsp" %>

  </body>
</html>
