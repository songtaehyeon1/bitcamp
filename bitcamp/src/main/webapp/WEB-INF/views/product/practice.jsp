<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 나중에 쓸것들 모아두기 -->

	<c:forTokens var="month" items="1,2,3,4,5,6,7,8,9,10,11,12" delims=",">
		<option value="${month }">${month }월</option>
	</c:forTokens>
<!-- 나중에 쓸것들 모아두기 -->
<script>
	function changeEndDay(startDay){
		var date = new Date(startDay);//주문 시작일을 받음.
		var period = parseInt(product_borrow_period.value);//대여기간
		date.setDate(date.getDate()+period);//주문 시작일 + 대여기간
		console.log(date)
		console.log(date.value)
		$("#borrow_end").datepicker('value', '2018-12-25')
		
	}
</script>





	
</body>
</html>