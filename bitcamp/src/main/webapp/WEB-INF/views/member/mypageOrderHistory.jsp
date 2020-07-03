<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/mypageOrderHistory.css" type = "text/css">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script>
	$(function(){
		
		//대여 시작일
		var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$('#mypage_orderHistory_start').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd"
		});
		
		//대여 종료일
		var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$('#mypage_orderHistory_end').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd"
		});
	});
</script>
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2>주문조회</h2>
	<hr>
	<div class = "mypage_order_main">
		<select class = "mypage_order_select">
			<option value = "all" selected>주문상태 전체</option>
			<option value = "before">입금전</option>
			<option value = "ready">배송준비중</option>
			<option value = "ing">배송중</option>
			<option value = "end">배송완료</option>
			<option value = "cancel">취소</option>
			<option value = "return">반품</option>
		</select>
		<input id="mypage_orderHistory_start" name="mypage_orderHistory_start" readonly/>
		<input id="mypage_orderHistory_end" name="mypage_orderHistory_end" readonly/>
		<button class = "mypage_order_btn">조회</button>
	</div>
	<div class = "mypage_order_precautions">
		<ul>
			<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
			<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			<li>취소/반품 신청은 주문완료일 기준 30일까지 가능합니다.</li>
		</ul>
	</div>
	<h6>주문 상품 정보</h6>
	<div class = "mypage_order_product_info">
		<ul class = "mypage_order_product_info_ul">
			<li><div>주문일자</div><div>[주문번호]</div></li>
			<li>이미지</li>
			<li>상품정보</li>
			<li>수량</li>
			<li>상품구매금액</li>
			<li>주문처리상태</li>
			<li>취소/반품</li>
		</ul>
	</div>
</div>