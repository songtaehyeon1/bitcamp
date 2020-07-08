<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result==0}">
	<script>
		alert("아이디와 비밀번호를 다시 확인해 주세요.");
		location.href="/bitcamp/loginFrm";
	</script>
</c:if>

<c:if test="${result==1}">
	<script>
		alert("해당 계정은 이미 탈퇴한 계정입니다.");
		location.href="/bitcamp/loginFrm";
	</script>
</c:if>

