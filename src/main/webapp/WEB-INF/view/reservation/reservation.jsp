<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 슬라이드이미지api -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css">
<meta charset="UTF-8" name="viewport" content="initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<div class="header"><jsp:include page="../include/nav.jsp" /></div>

<div >	
<div class="item1">
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
	
	<div class="item2">
		<div class="item2_1">
			<input type="text" value="이름">
		</div>
		<div class="item2_2">
			<input type="text" value="날짜">
		</div>
	</div>

	<div class="item3">
		<input type="submit" value="예약하기" onClick="goPost()">
		<input type="reset" value="취소" >
	</div>
</div>

<div><%@include file="../include/footer.jsp" %></div>

</body>
</html>