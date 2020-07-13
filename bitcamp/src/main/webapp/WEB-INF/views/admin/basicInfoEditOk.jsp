<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result > 0 }">
	<script>
		alert("기본정보 수정 성공");
		location.href="/bitcamp/admin/home";
	</script>
</c:if>

<c:if test="${result ==0 }">
	<script>
		alert("기본정보 수정 실패");
		history.back();
	</script>
</c:if>