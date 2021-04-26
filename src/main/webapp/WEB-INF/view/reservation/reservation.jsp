<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 슬라이드이미지api -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 예약기간선택 달력 api -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$.noConflict();
jQuery(document).ready(function( $ ){
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat: "yy-mm-dd",  //텍스트 필드에 입력되는 날짜
			minDate: 0,			     //오늘이전 날짜 블록처리
			changeYear: true,		 //년도 변경
			changeMonth: true,		 //월 변경
			showMonthAfterYear: true,//셀렉트 박스를 년,월 순으로 변경
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], //요일의 한글 형식
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //월의 한글 형식
		});
	});
</script>



<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css">
<meta charset="UTF-8" name="viewport" content="initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<div class="header"><jsp:include page="../include/nav.jsp" /></div>



<hr class="hr">
<div class="item1">	
	<div class="item1_1">
		<select class="select">
			<option>스탠다드룸</option>
			<option>디럭스룸</option>
			<option>스위트룸</option>
			<option>프레스티지룸</option>
		</select>		
  		<div id="myCarousel" class="carousel slide" data-ride="carousel">
    		<!-- Indicators -->
    		<ol class="carousel-indicators">
      		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      		<li data-target="#myCarousel" data-slide-to="1"></li>
      		<li data-target="#myCarousel" data-slide-to="2"></li>
   			</ol>
    	<!-- Wrapper for slides -->
    	<div class="carousel-inner">
      		<div class="item active">
        	<img src="${pageContext.request.contextPath}/resources/image/hotelqna.jpg" alt="Los Angeles" style="width:100%;">
      		</div>
      		<div class="item">
        	<img src="${pageContext.request.contextPath}/resources/image/hotelqna.jpg" alt="Chicago" style="width:100%;">
      		</div>    
      		<div class="item">
        	<img src="${pageContext.request.contextPath}/resources/image/hotelqna.jpg" alt="New york" style="width:100%;">
      		</div>
    	</div>
   	 	<!-- Left and right controls -->
   	 	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
      		<span class="glyphicon glyphicon-chevron-left"></span>
      		<span class="sr-only">Previous</span>
   		</a>
    	<a class="right carousel-control" href="#myCarousel" data-slide="next">
      		<span class="glyphicon glyphicon-chevron-right"></span>
      		<span class="sr-only">Next</span>
    	</a>
	  	</div>
	</div>

		<div class="item1_2">
			<input type="text" name="ruserName" class="input" placeholder="예약자 이름"><br>
			<input type="text" name="ruserPhone" class="input" placeholder="예약자 연락처"><br>
			<input type="text" name="ruserCount" class="input" placeholder="인원수 (숫자만 입력)">
			<input type="text" class="input" id="datepicker1" placeholder="예약 시작일">
		 	<input type="text" class="input" id="datepicker2" placeholder="예약 종료일"><br>
			<input type="text" class="input" placeholder="총 결제 금액"><br>
		</div>
		</div>
		
		
		<hr class="hr">	
		
	<div class="item3">
		<input type="submit" value="예약하기" class="button" onClick="goPost()">
	</div>
	

<div><%@include file="../include/footer.jsp" %></div>

</body>
</html>