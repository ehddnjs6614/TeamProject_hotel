<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<form action="update" method="post">
<c:forEach var="item" items="${qnaBoardVO }" varStatus="status">
<tr>
	<th>id</th>
	<th><input type="text" name="id" value="${item.id }"></th>
</tr>
<tr>
	<th>제목</th>
	<th><input type="text" name="title" value="${item.title }"></th>
</tr>
<tr>
	<th>내용</th>
	<th><input type="text" name="board" value="${item.board }"></th>
</tr>
<tr>
	<th><input type="submit" value="수정 완료"></th>
</tr>

<input type="hidden" name="no" value="${item.no }">
</c:forEach>
</form>
</table>
</body>
</html>