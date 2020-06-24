<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${cnt>0 }">
	<script>
		alert("카테고리 업데이트 성공");
		location.href="<%=request.getContextPath()%>/admin/productCategory";
	</script>
</c:if>
<c:if test="${cnt<=0 }">
	<script>
		alert("카테고리 업데이트 실패");
		location.href="<%=request.getContextPath()%>/admin/productCategory";
	</script>
</c:if>