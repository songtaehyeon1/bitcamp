<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	var str = "${str}";
	if(str == "writeForm"){
		alert("공지사항이 작성되었습니다.");
		location.href = "/bitcamp/boardNotice";
	}
</script>