<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result==0}">
	<script>
		alert("존재하지 않는 주문입니다. 다시 한번 확인해주세요.");
		location.href="javascript:history.back()";
	</script>
</c:if>

