<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script>
    $.datepicker.setDefaults({
        dateFormat: 'yymmdd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

    $(function() {
        $("#datepicker1").datepicker();
    });

</script>

<script type="text/javascript">


function check(){
	var fm = document.frm;
	
	if (fm.p_code.value == ""){
		alert("상품코드 입력하세요");
		fm.p_code.focus();
		return false;
	}else if (fm.p_name.value == ""){
		alert("상품명을 입력하세요");
		fm.p_name.focus();
		return false;
	}else if (fm.p_price.value == ""){
		alert("상품가격을 입력하세요");
		fm.p_price.focus();
		return false;
	}	
	
	fm.action="${path}/admin/adminProductWriteAction.do";
	fm.method="post";
	//ultipart library에서 muti recate가 넘어간다
	//fm.enctype="multipart/form-data";

	fm.submit();
	
	return;
}
</script>

<script>
function addFilePath(msg){
	alert(msg);	
}

function checkImageType(fileName){
	
	var pattern = /jpg$|gif$|png$|jpeg$/i;
	alert(fileName.match(pattern));
	
	return fileName.match(pattern);
}

function getOriginalName(fileName){
//	alert(fileName);
	//이미지파일이면 원본이름 안쓴다
	if (checkImageType(fileName)) {
		return;
	}
	
	var idx = fileName.lastIndexOf("_")+1;
	
	alert(idx);
	return fileName.substr(idx);
}

//파일이 이미지일경우
function getImageLink(fileName){
	if (!checkImageType(fileName)) {
		return;
	}
	//위치 폴더뽑기
	var front = fileName.substr(0,12);
	//파일이름뽑기
	//_는 빼고
	var end = fileName.substr(14);
	
	return front+end;	
}
</script>
<script>
$(document).ready(function(){
	
	$(".fileDrop").on("dragenter dragover",function(event){
	
		event.preventDefault();		
	});
	
	$(".fileDrop").on("drop",function(event){
		
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);
	//	alert("file"+file);
		
		$.ajax({
			url:'<%=request.getContextPath()%>/board/uploadAjax.do',
			data: formData,
			dataType:'text',
			processData:false,
			contentType:false,
			type:'POST',
			error: function(){
				alert("에러입니다.");
			},
			success : function(data){
				
				//  /2018/05/30/s-sdsdsd-ssd22q.jpg
				alert(data);
			
				// input--> sdsdsd-ssd22q.jpg
				$("#uploadfile").val(data.replace("s-",""));		
				
				var str ="";
				
				if(checkImageType(data)){
					str ="<div>"
					+ "<a href='<%=request.getContextPath()%>/board/displayFile.do?fileName="+getImageLink(data)+"'>"
					+ "<img src='<%=request.getContextPath()%>/board/displayFile.do?fileName="+data+"' />"
					+ getImageLink(data) 
					+ "</a>"
					+ "</div>";
				}else{
					str = "<div>"
						+ "<a href='<%=request.getContextPath()%>/board/displayFile.do?fileName="+data+"'>"
						+ getOriginalName(data) 
						+ "</a>"
						+ "</div>";
				}
				
				$(".uploadedList").append(str);
				
			}		
			
		});	
		
	});	
	
});


</script>


</head>
<body >
		<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록 </h1>
		</div>
	</div>
	
	<div class="container">
		<form name="frm" class="form-horizontal">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="p_code" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-5">
					<input type="radio" name="p_category" value="outer" >
					OUTER
					<input type="radio" name="p_category" value="blouse" >
				    BLOUSE
					<input type="radio" name="p_category" value="skirt" >
					SKIRT
					<input type="radio" name="p_category" value="pants" >
					PANTS
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="p_name" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품가격(원)</label>
				<div class="col-sm-3">
				<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="p_price" class="form-control" >
				</div>
			</div>	
			
			<div class="form-group row">
				<label class="col-sm-2">재고 수량</label>
				<div class="col-sm-3">				
					<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="p_qty" class="form-control">
				</div>
			</div>			

			<div class="form-group row">
				<label class="col-sm-2">입고날짜</label>
				<div class="col-sm-3">
					<input type="text" name="p_indate" id="datepicker1" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">사진</label>
				<div class="col-sm-3">
					<input type="file" id ="uploadfile" name="uploadfile" class="btn btn-dark">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-3">
					<textarea name="p_text" cols="50" rows="2"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<button name="btn1"class="btn btn btn-success" style="width:10%; padding:5px;"" onclick="check();return false;">등록</button>
				</div>
			</div>
			
		</form>
		
	</div>
</body>
</html>