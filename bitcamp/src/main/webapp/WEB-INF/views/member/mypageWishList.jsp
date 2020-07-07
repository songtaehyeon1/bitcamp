<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/mypageWishList.css" type = "text/css">
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2>관심상품</h2>
	<hr>
	<div class = "mypageWishList_main">
		<ul>
			<li>이미지</li>
			<li>상품이름</li>
			<li>판매가</li>
			<li>적립금</li>
			<li>삭제</li>
			<c:forEach var = "list" items = "${list}">
				<li><img src = "/bitcamp/resources/products/${list.p_filename1}" alt = ""></li>
				<li class = "mypageWishList_go" onclick = "location.href = '/bitcamp/productView?p_no=${list.p_no}';">${list.p_name}</li>
				<li>${list.price}</li>
				<li>${list.mileage}</li>
				<li><button class = "mypageWishList_btn" onclick = "location.href = '/bitcamp/mypageWishListDel?p_no=${list.p_no}';">삭제</button></li>
			</c:forEach>
		</ul>
		<c:if test = "${list == '[]'}">
			<div class = "mypageWishList_nothing">관심상품 내역이 없습니다.</div>
		</c:if>
	</div>
	<button class = "mypageWishList_main_btn" onclick = "location.href = '/bitcamp/mypage';">MY PAGE</button>
</div>
