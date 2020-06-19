<%@page import="kr.co.bitcamp.product.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product/product_cart.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product/review_in_productPage.css" />
<script src="<%=request.getContextPath()%>/js/product/product_cart.js"></script>




<div class="container" style="margin-top: 300px">
	<%
		String p_name = request.getParameter("p_name");
		String borrow_start = request.getParameter("borrow_start");
		String borrow_end = request.getParameter("borrow_end");
		//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.
		System.out.println(p_name);
		System.out.println(borrow_start);
		System.out.println(borrow_end);
	%>
	







	<table class="cartTable">
		<caption class="visualNone">장바구니</caption>
		<colgroup>
			<col width="100">
			<col width="100">
			<col width="*">
			<col width="100">
			<col width="100">
		</colgroup>
		<thead>
			<tr>
				<td colspan="10">
					<h2>장바구니 제품</h2>
				</td>
			</tr>
			<tr class="head">
				<th scope="col">
					<label>
						<input type="checkbox"><span>&nbsp;&nbsp;전체선택</span>
					</label>
				</th>
				<th scope="colgroup"colspan="2">상품정보</th>
				<th scope="col">상품금액</th>
				<th scope="col">배송비</th>
			</tr>
		</thead>

	<!-- ////////////////////////////////반복될 부분///////////////////////////////////////////// -->
		<tbody>
			<tr>
				<td>
					<input type="checkbox">
				</td>
				<td>
					<a href="javascript:;"> 
						<img src="//thumbnail10.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/images/2017/05/24/17/6/36b04e65-6745-4a3d-8a4b-5ec647d5a13a.jpg"
							width="78" height="78">
					</a>
				</td>
				<td>
					<div>
						<a href="javascript:;">로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루</a>
					</div>
					<div>
						<div>
							<span style="display: inline-block;">
									<span class="arrive-date-date">6/29</span>도착 예정
							</span>
						</div>
						<div>
							<span>제품 가격:32,900원</span>
							<span class="select-select">
								<select class="quantity-select">
										<option value="1" selected="selected">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
								</select>
							</span> 
							<span>선택 가격:32,900원</span>
							<a href="javascript:;">
								<img id="xBtn" src="/bitcamp/resources/products/xBtn.png"><label for="xBtn">상품삭제</label>
							</a>
						</div>
					</div>
					<div>
						<span>
							<em>최대 1,645원 적립</em>
						</span>
					</div>
				</td>
				<td>
					<div>32,900원</div>
				</td>
				<td>배송비</td>
			</tr>
			<tr class="summary">
				<td colspan="10">
					 상품가격 <span>0</span>원
					  배송비 <span>0</span>원 
					 주문금액<span>0</span>원
				</td>
			</tr>
			<!-- ///////////////////////////////////////////////////////////////////////////// -->
		
		
		
			<!-- ////////////////////////////////반복될 부분///////////////////////////////////////////// -->
		<tbody>
			<tr>
				<td>
					<input type="checkbox">
				</td>
				<td>
					<a href="javascript:;"> 
						<img src="//thumbnail10.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/images/2017/05/24/17/6/36b04e65-6745-4a3d-8a4b-5ec647d5a13a.jpg"
							width="78" height="78">
					</a>
				</td>
				<td>
					<div>
						<a href="javascript:;">로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루</a>
					</div>
					<div>
						<div>
							<span style="display: inline-block;">
									<span class="arrive-date-date">6/29</span>도착 예정
							</span>
						</div>
						<div>
							<span>32,900원</span>
							<span class="select-select">
								<select class="quantity-select">
										<option value="1" selected="selected">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
								</select>
							</span> 
							<span class="unit-price-area"><span class="unit-price"><span
									class="sr-only">구매가격</span>32,900원</span>
							</span> 
							<a href="javascript:;">
								<span class="sr-only">로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루 상품삭제</span>
							</a>
						</div>
					</div>
					<div>
						<span>
							<em>최대 1,645원 적립</em>
						</span>
					</div>
				</td>
				<td>
					<div>32,900원</div>
				</td>
				<td>배송비</td>
			</tr>
			<tr>
				<td colspan="10">
					 상품가격 <span	class="total-product-price number">0</span>원
					  배송비 <span class="delivery-charge number">0</span>원 
					 주문금액 <span class="total-order-price number">0</span>원
				</td>
			</tr>
			<!-- ///////////////////////////////////////////////////////////////////////////// -->
			
			
			
			
		</tbody>
	</table>
	
	<!-- 계속쇼핑하기/ 바로 구매하기 버튼들 -->
	<div class="container" style="text-align:center;">
		<a class="shopAndPurchaseBtn"style="margin-right:2%" >계속 쇼핑하기</a>
		<a class="shopAndPurchaseBtn">바로 구매하기</a>
	</div>
	
	
</div>
