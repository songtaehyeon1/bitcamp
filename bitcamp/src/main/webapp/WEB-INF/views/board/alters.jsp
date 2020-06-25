<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	var str = "${str}";
	if(str == "notice_writeForm"){
		alert("공지사항이 작성되었습니다.");
		location.href = "/bitcamp/boardNotice";
	}else if(str == "notice_editOk"){
		alert("공지사항이 수정되었습니다.");
		location.href = "/bitcamp/boardNotice";
	}else if(str == "enquiry_writeForm"){
		alert("고객문의가 작성되었습니다.");
		location.href = "/bitcamp/boardEnquiry";
	}else if(str == "secret"){
		alert("글이 잠겨있습니다.");
		location.href = "/bitcamp/boardEnquiry";
	}else if(str == "review_writeForm"){
		alert("상품후기가 작성되었습니다.");
		location.href = "/bitcamp/boardReview";
	}
</script>