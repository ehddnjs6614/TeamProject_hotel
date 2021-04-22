<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/QnAwrite.css">
<title>글쓰기</title>
</head>
<jsp:include page="../include/nav.jsp" />
<div class="QnAwriter">
<form action="refWrite" method="post">
<img src="${pageContext.request.contextPath}/resources/image/bg.jpg">
<h2>Q n A 글 작 성 </h2>
<table>
<tr>
	<td> ${sessionScope.id } 
	<input type="hidden" name="id" value="${sessionScope.id }">
	</td>
</tr>
<tr>
	<td>
	<input class="title" type="text" name="title" placeholder="제목을 입력하세요">
	</td>
</tr>
<tr >
	<td>
	<textarea rows="40" cols="117" name="board" placeholder="내용을 입력하세요"></textarea>
	</td>
</tr>
<tr>
	<td>
	<input type="submit" value="작성완료">&nbsp;&nbsp;
	</td>
</tr>
</table>
</form>
</div>
<%@include file="../include/footer.jsp" %>
</html>