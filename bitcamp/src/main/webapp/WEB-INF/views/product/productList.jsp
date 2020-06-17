<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<DIV style="margin-top:300px">
		<ul>
		<c:forEach var="vo" items="${lst}">
			<li>제목:<a href="/bitcamp/productView?p_no=${vo.p_no }">글번호:${vo.p_no},글 상세 이동</a></li>
		</c:forEach>
		</ul>
	</DIV>
</body>
</html>