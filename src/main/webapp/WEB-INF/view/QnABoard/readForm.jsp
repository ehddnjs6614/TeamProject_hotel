<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnABoardRead.css?after">
<title>글쓰기</title>
</head>
<body>

<div class="header"><jsp:include page="../include/nav.jsp" /></div>
<img src="${pageContext.request.contextPath}/resources/image/hotelqna.jpg">
<div class="container">
<div align="center" class="div_form">
<form action="refWrite" method="post">	
	<c:forEach var="item" items="${qnaBoardVO }" varStatus="status">	
	<div class="div_title">${item.title}</div>
	<div class="div_id">ID : ${item.id}</div>
	<div class="div_board">${item.board}</div>
	<a href="writerUpdate?no=${item.no }"><input type="button" class="button" value="수정"></a>
	</c:forEach>
</form>
</div>
</div>
<div><%@include file="../include/footer.jsp" %></div>

</body>
</html>