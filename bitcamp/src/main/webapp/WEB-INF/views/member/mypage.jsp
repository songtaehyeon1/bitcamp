<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/mypage.css" type = "text/css">
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2>MY PAGE</h2>
	<hr>
	<div id = "mypage_save_main">
		<div class = "mypage_main_div">
			<div class = "mypage_main_div_div">
				<span>＞</span><span class = "mypage_font">가용적립금</span>
				<div><span class = "mypage_font" style = "color : red;">2000원</span><button class = "mypage_btn mypage_font">조회</button></div>
			</div>
			<div class = "mypage_main_div_div">
				<span>＞</span><span class = "mypage_font">사용적립금</span>
				<div><span class = "mypage_font">0원</span></div>
			</div>
		</div>
		<div class = "mypage_main_div">
			<div class = "mypage_main_div_div">
				<span>＞</span><span class = "mypage_font">총적립금</span>
				<div><span class = "mypage_font">2000원</span></div>
			</div>
			<div class = "mypage_main_div_div">
				<span>＞</span><span class = "mypage_font">총주문</span>
				<div><span class = "mypage_font">0원(0회)</span></div>
			</div>
		</div>
	</div>
	<div id = "mypage_order_main">
		<div id = "mypage_order_span"><span class = "mypage_font">나의 주문처리 현황</span></div>
		<div id = "mypage_order_div">
			<div class = "mypage_center"><div><span class = "mypage_font">입금전</span></div><div><span><a href = "#">0</a></span></div></div>
			<div class = "mypage_center"><div><span class = "mypage_font">배송준비중</span></div><div><span><a href = "#">0</a></span></div></div>
			<div class = "mypage_center"><div><span class = "mypage_font">배송중</span></div><div><span><a href = "#">0</a></span></div></div>
			<div class = "mypage_center"><div><span class = "mypage_font">배송완료</span></div><div><span><a href = "#">0</a></span></div></div>
			<div>
				<ul id = "mypage_order_ul">
					<li><span class = "mypage_font">취소&emsp;:&emsp;</span><span class = "mypage_font"><a href = "#">0</a></span></li>
					<li><span class = "mypage_font">반품&emsp;:&emsp;</span><span class = "mypage_font"><a href = "#">0</a></span></li>
				</ul>
			</div>
		</div>
	</div>
	<div id = "mypage_menu">
		<div class = "mypage_menu_div" onclick = "location.href = '/bitcamp/mypageOrderHistory'">
			<span>ORDER</span><span>주문내역 조회</span><hr>
			<span class = "mypage_font">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.<br>비회원인 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.</span>
		</div>
		<div class = "mypage_menu_div" onclick = "location.href = '/bitcamp/pwdChkFrm?str=update'">
			<span>PROFILE</span><span>회원정보</span><hr>
			<span class = "mypage_font">회원이신 고객님의 개인정보를 관리하는 공간입니다.<br>개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</span>
		</div>
		<div class = "mypage_menu_div" onclick = "">
			<span>WISHLIST</span><span>관심상품</span><hr>
			<span class = "mypage_font">관심상품으로 등록하신 상품의 목록을 보여드립니다.</span>
		</div>
		<div class = "mypage_menu_div" onclick = "">
			<span>MILEAGE</span><span>적립금</span><hr>
			<span class = "mypage_font">적립금은 상품 구매 시 사용하실 수 있습니다.<br>적립된 금액은 현금으로 환불되지 않습니다.</span>
		</div>
		<div class = "mypage_menu_div" onclick = "location.href = '/bitcamp/mypageboard';">
			<span>BOARD</span><span>게시물 관리</span><hr>
			<span class = "mypage_font">고객님께서 작성하신 게시물을 관리하는 공간입니다.<br>고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.</span>
		</div>
		<div class = "mypage_menu_div" onclick = "location.href = '/bitcamp/mypageshipping';">
			<span>ADDRESS</span><span>배송 주소록 관리</span><hr>
			<span class = "mypage_font">자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.</span>
		</div>
	</div>
</div>