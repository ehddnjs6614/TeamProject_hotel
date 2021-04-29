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

<!-- 빈칸 입력 알림 -->
<script type="text/javascript">
	function goPost1() {
		// 1. 데이터 세팅
		var ruserName = document.getElementsByName('ruserName')[0].value;
		var ruserPhone = document.getElementsByName('ruserPhone')[0].value;
		var ruserCount = document.getElementsByName('ruserCount')[0].value;
		var checkIn = document.getElementsByName('checkIn')[0].value;
		var checkOut = document.getElementsByName('checkOut')[0].value;
		
		
		// 2. 데이터 검증
		if (ruserName == "") {
			alert("예약자 이름을 입력하여 주세요.");
			return;
		}
		else if (ruserPhone == "") {  
			alert("예약자 연락처를 입력하여 주세요.");
			return;
		}
		else if (ruserCount == ''){
			alert("인원 수를 입력하여 주세요.");
			return;
		}
		else if (checkIn == ''){
			alert("체크인 날짜를 입력하여 주세요.");
			return;
		}
		else if (checkOut == ''){
			alert("체크아웃 날짜를 입력하여 주세요.");
			return;
		}
		
			
		// 3. Form 연결
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "test");
		
		
		formInput(form, "ruserName", ruserName);
		formInput(form, "ruserPhone", ruserPhone);
		formInput(form, "ruserCount", ruserCount);
		formInput(form, "checkIn", checkIn);
		formInput(form, "checkOut", checkOut);
		formInput(form, "roomType", "스탠다드");
		formInput(form, "ruserPrice", "100000"); 
		
		// 4. 전송
		document.body.appendChild(form);
		form.submit();
	}
	
	//자바스크립트 폼에 값입력
	function formInput(form, name, value) {
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", name);
		hiddenField.setAttribute("value", value);
		form.appendChild(hiddenField);
	}
</script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css">
<meta charset="UTF-8" name="viewport" content="initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<div class="header"><%@include file="../include/nav.jsp" %></div>

<hr class="hr">
<div class="item1">	
	<div class="item1_1">	
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
        	<img src="${pageContext.request.contextPath}/resources/image/hotelqna.jpg" alt="Los Angeles">
      		</div>
      		<div class="item">
        	<img src="${pageContext.request.contextPath}/resources/image/hotelqna.jpg" alt="Chicago">
      		</div>    
      		<div class="item">
        	<img src="${pageContext.request.contextPath}/resources/image/hotelqna.jpg" alt="New york">
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
	  	
	  	<div align="center">
	  	<table class="type">
  		<thead>
  		<tr>
   		 <th>객실정보</th>
   		 <th>객실가격</th>
  		</tr>
  		</thead>
  		<tbody>
  		<tr>
   		 <th scope="row">스탠다드</th>
   		 <td>100,000원</td>
  		</tr>
  		<tr>
   		 <th scope="row">디럭스</th>
   		 <td>200,000원</td>
 		 </tr>
  		<tr>
   		 <th scope="row">스위트</th>
   		 <td>500,000원</td>
 		 </tr>
 		 <tr>
   		 <th scope="row">프레스티지</th>
   		 <td>1,000,000원</td>
  		</tr>
 		 </tbody>
		</table>
		</div>
		</div>

		<div class="item1_2">
			<input type="text" name="ruserName" class="input" placeholder="예약자 이름"><br>
			<input type="text" name="ruserPhone" class="input" placeholder="예약자 연락처"><br>
			<input type="text" name="ruserCount" class="input" placeholder="인원 수"><br>
			<input type="text" name="checkIn" class="input" id="datepicker1" placeholder="예약 시작일"><br>
		 	<input type="text" name="checkOut" class="input" id="datepicker2" placeholder="예약 종료일"><br>
		 	
		</div>
		</div>		
		<div class="item3">
		<input type="submit" value="예약하기" class="button" onClick="goPost1()">
		</div>
		
		<hr class="hr">	
		
	
	

<div><%@include file="../include/footer.jsp" %></div>

</body>
</html>