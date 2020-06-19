<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE Bitcamp</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
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
	href="<%=request.getContextPath()%>/css/product/product_view.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product/review_in_productPage.css" />
<script src="<%=request.getContextPath()%>/js/product/product_view.js"></script>
</head>
<body >


	<div class="container" id="productWrap" style="margin-top:100px">
	
		<!-- 제품 사진,옵션 -->
		<div class="row">
			<!-- 왼쪽 제품 사진  -->
			<div class="col-6" id="productImage" class="productImage" style="text-align:center">
				<img class="bigImage" src="/bitcamp/upload/${product.p_filename1 }">
				<div class="listImage_wrap" id="listImage_wrap" >
						<button type="button" class="prevBtn" >이전</button>
						<button type="button" class="nextBtn" >다음</button>
					
					<div class="listImage" >
						<ul style="width:1100px;position:absolute;left:10px;top:0px;">
							<li class="image_li"><c:if test="${product.p_filename1!=null }">
								<img class="thumbImage" src="/bitcamp/upload/${product.p_filename1 }"><br>
							</c:if></li>
							<li class="image_li"><c:if test="${product.p_filename2!=null }">
								<img class="thumbImage" src="/bitcamp/upload/${product.p_filename2 }"><br>
							</c:if></li>
							<li class="image_li"><c:if test="${product.p_filename3!=null }">
								<img class="thumbImage" src="/bitcamp/upload/${product.p_filename3 }"><br>
							</c:if></li>
							<li class="image_li"><c:if test="${product.p_filename4!=null }">
								<img class="thumbImage" src="/bitcamp/upload/${product.p_filename4 }"><br>
							</c:if></li>
							<li class="image_li"><c:if test="${product.p_filename5!=null }">
								<img class="thumbImage" src="/bitcamp/upload/${product.p_filename5 }"><br>
							</c:if></li>
						</ul>
					</div>
				</div>
			</div>
			
			
			<!-- 오른쪽 구매 설정 시작 -->
			<div class="col-6" id="productOption">
			
			<!-- 상단 가격,제품명 -->
				<div class="productName">
					<div class="price-wrap">
						<div >
							<span style="color:#8d8d8d;">${product.c_name}</span>
						</div>
						<div>
							<span class="price"><strong>${product.price } 원</strong></span>
						</div>
					</div>
					<h1 class="title-wrap">
						<span  data-name="이지캠프 티피텐트 4-5인용">${product.p_name}</span>
					</h1>
				</div>
				<hr>
			<!-- 옵션 선택 -->
				<div class="optionChoice" onchange="optionChoice()">
<form method="post" action="/bitcamp/orderDirect?p_no=${product.p_no }">


					<ul>
						<li><span class="spanWidth150 col-4">상품명</span>${product.p_name}</li>
						<li><span class="spanWidth150 col-4">배송방법</span>택배</li>
						<li><span class="spanWidth150 col-4">배송비</span>${product.delivery_fee }원</li>
						<li><span class="spanWidth150 col-4">배송비결제</span>
						<select class="col-8" id="product_payment" name="product_payment">
								<option value disabled selected class="optionvaluedisabled">결제 방법을 선택해주세요</option>
								<option value="방문 수령">방문 수령</option>
								<option value="주문시 결제">주문시 결제</option>
								<option value="착불">착불</option>
						</select></li>
						<li>
							<span class="spanWidth150 col-4">대여기간</span>
							<select class="col-8" style="width:100%" id="product_borrow_period" name="product_borrow_period" onchange="period_change(this.value)">
									<option value disabled selected class="optionvaluedisabled">대여기간</option>
									<option value="3">2박3일</option>
									<option value="4">3박4일(+15,000원)</option>
									<option value="5">4박5일(+30,000원)</option>
									<option value="6">5박6일(+45,000원)</option>
							</select>
							<select style="display:none" id="product_borrow_period_price" name="product_borrow_period_price">
								<option value="0">0</option>
								<option value="15000">15000</option>
								<option value="30000">30000</option>
								<option value="45000">45000</option>
							</select>
						</li>
						<!-- 대여 시작일 -->
						<li class="row" id="borrow_start_wrap" style="margin:0;display:none">
							<span class="spanWidth150" style="padding-left:15px;padding-right:15px">대여 시작일</span>
							<input id="borrow_start" name="orderStart" onkeydown="donotusekeyboard(event)" onchange="changeEndDay(this.value);optionChoice()"/>
							<script>
								var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
								$('#borrow_start').datepicker({
									uiLibrary : 'bootstrap4.4.1',
									format : "yyyy-mm-dd",
									minDate : function() {
							            var date = new Date();
							            date.setDate(date.getDate()+7);
							            return new Date(date.getFullYear(), date.getMonth(), date.getDate());
							        }
								});
							</script>
						</li>
						<!-- 대여 마지막날 -->
						<li class="row" id="borrow_end_wrap" style="margin:0;display:none">
							<span class="spanWidth150" style="padding-left:15px;padding-right:15px">대여 종료일</span>
							<input id="borrow_end" name="orderEnd"  onkeyup="defaultday()"/>
							<script>
								var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
								$('#borrow_end').datepicker({
									uiLibrary : 'bootstrap4.4.1',
									format : "yyyy-mm-dd",
									minDate : function() {
										var date = new Date(borrow_start.value);
							            date.setDate(date.getDate()+parseInt(product_borrow_period.value));
							            return new Date(date.getFullYear(), date.getMonth(), date.getDate());
									},
									maxDate : function() {
							            var date = new Date(borrow_start.value);
							            date.setDate(date.getDate()+parseInt(product_borrow_period.value));
							            return new Date(date.getFullYear(), date.getMonth(), date.getDate());
									}
								});
							</script>
						</li>
					</ul>
					<!-- 주문 옵션 끝 -->
					<!-- 결제수량,구매,장바구니,관심상품 등록 -->
					<hr>
					<div class="container" id="finalOpt"><!-- 최종 옵션 -->
						<div class="row" id="orderDetail_wrap" >
			                <span class="col-6">${product.p_name }</span>
			                <span class="col-6" id="borrow_period"></span>
						</div>
						<div class="row quantity_wrap">
							<span class="quantity_span">수량</span>
							<button class="btn minus productQty" type="button" ><i class="icon-minus"></i></button>
							<input type="text" id="currentQty" name="currentQty" class="currentQty input_noclick transparent" value="1"  readonly >
							<button class="btn plus productQty" type="button" ><i class="icon-plus" ></i></button>
						</div>
						<div class="quantity_msg">
							<span>9개까지 구매 가능 합니다.</span>
						</div>
					</div>
					<div class="container"><!-- 구매,장바구니,관심상품 버튼들 -->
					<!-- 대여시작일,대여종료일,수량,가격,배송료 -->
						<input type="submit" id="buySubmit" style="display:none;">
						<a class="buyRightNow" style="color:#fff"><label for="buySubmit" style="width: 100%;cursor: pointer;">바로 구매하기</label></a>
						<a class="cartAndInterest"style="margin-right:2%" >장바구니 담기</a>
						<a class="cartAndInterest">관심상품 등록</a>
					</div>
</form>
				</div>
			</div>
		</div>
	</div><!-- 제품 사진,옵션 끝 -->
	
	<!-- 탭메뉴들 시작 -->
	<div class="container" id="tab_wrap_parent" style="margin:0 auto;text-align:center;padding-left: 0px; padding-right: 0px;">
		<div class="tab_wrap ">
		  <div class="tab_menu_container">
		    <a class="tab_menu_btn1 tab_menu_btn on" type="button" href="#product_information">상세정보</a>
		    <a class="tab_menu_btn2 tab_menu_btn" type="button" href="#product_review">리뷰</a>
		    <a class="tab_menu_btn3 tab_menu_btn" type="button" href="#product_QA">Q&A</a>
		    <a class="tab_menu_btn4 tab_menu_btn" type="button" href="#product_returnExchange">반품/교환정보</a>
		  </div> <!-- 탭메뉴 컨테이너 끝-->
		</div> <!--탭 끝 -->
	
		<!-- 상품 설명란 -->
  		<div>
		<p id="product_information"><span><h1>상세정보</h1></span></p>
			상품설명:${product.p_commnet }<hr>
		</div>
		
		<!-- 리뷰란 -->
		<p id="product_review"><span><h1>REVIEW</h1></span> </p>
		<div class="ReviewWrap">
			<ul class = "reviewList" style="margin:0;padding:0">
				<li class="ListTop list1">작성일</li>
				<li class="ListTop list2">제목</li>
				<li class="ListTop list3">작성자</li>
				<li class="ListTop list4">조회수</li>
				<li class="ListTop list5">추천</li>
				<li class="ListTop list6">평점</li>
			</ul>
			<ul class="reviewList" style="margin:0;padding:0"><!-- 반복문 돌릴부분 -->
				<li class="list1">2020-06-10</li>
				<li class="list2" onclick="showMoreText(this)">
					<a href="javascript:;" role="button" >제목1</a>
				</li>
				<li class="list3">작성자1</li>
				<li class="list4">조회수1</li>
				<li class="list5">추천1</li>
				<li class="list6">평점1</li>
				<div class="moreText">
					<span class="text_info">leez****/</span>
		            <span class="text_info">20.05.15~20.05.20/</span>
		            <p class="moreTextStatus">옵션 : 모델명: hd10 / 컬러: 화이트 / 용량: 32GB</p>
		            <div class="moreTextContents">제품 참 좋네요~~</div>
				</div>
			</ul><!-- 반복문 돌릴부분 -->
		</div>
		<div>
			<ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link bg-dark text-white" href="javascript:void(0);">&lt;</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			    <li class="page-item"><a class="page-link bg-dark text-white" href="javascript:void(0);">&gt;</a></li>
			</ul>
		</div>
	
		<!-- 질문란 -->
		<p id="product_QA"><span><h1>Q&A</h1></span> </p>
		<div class="QAWrap">
			<ul class = "QAList" style="margin:0;padding:0">
				<li class="ListTop list1">작성일</li>
				<li class="ListTop list2">제목</li>
				<li class="ListTop list3">작성자</li>
				<li class="ListTop list4">조회수</li>
				<li class="ListTop list5">추천</li>
				<li class="ListTop list6">평점</li>
			</ul>
			<ul class="QAList" style="margin:0;padding:0"><!-- 반복문 돌릴부분 -->
				<li class="list1">2020-06-10</li>
				<li class="list2" onclick="showMoreText(this)">
					<a href="javascript:;" role="button" >제목1</a>
				</li>
				<li class="list3">작성자1</li>
				<li class="list4">조회수1</li>
				<li class="list5">추천1</li>
				<li class="list6">평점1</li>
				<div class="moreText"><!-- 상세보기창 -->
					<span class="text_info">leez****/</span>
		            <span class="text_info">20.05.15~20.05.20/</span>
		            <p class="moreTextStatus">옵션 : 모델명: hd10 / 컬러: 화이트 / 용량: 32GB</p>
		            <div class="moreTextContents">이거 내구도 좋은가요</div>
				</div>
			</ul><!-- 반복문 돌릴부분 -->
				<ul class="QAList" style="margin:0;padding:0"><!-- 반복문 돌릴부분 -->
				<li class="list1">2020-06-10</li>
				<li class="list2" onclick="showMoreText(this)">
					<a href="javascript:;" role="button" >제목1</a>
				</li>
				<li class="list3">작성자1</li>
				<li class="list4">조회수1</li>
				<li class="list5">추천1</li>
				<li class="list6">평점1</li>
				<div class="moreText"><!-- 상세보기창 -->
					<span class="text_info">leez****/</span>
		            <span class="text_info">20.05.15~20.05.20/</span>
		            <p class="moreTextStatus">옵션 : 모델명: hd10 / 컬러: 화이트 / 용량: 32GB</p>
		            <div class="moreTextContents">이거 내구도 좋은가요</div>
				</div>
			</ul><!-- 반복문 돌릴부분 -->
				<ul class="QAList" style="margin:0;padding:0"><!-- 반복문 돌릴부분 -->
				<li class="list1">2020-06-10</li>
				<li class="list2" onclick="showMoreText(this)">
					<a href="javascript:;" role="button" >제목1</a>
				</li>
				<li class="list3">작성자1</li>
				<li class="list4">조회수1</li>
				<li class="list5">추천1</li>
				<li class="list6">평점1</li>
				<div class="moreText"><!-- 상세보기창 -->
					<span class="text_info">leez****/</span>
		            <span class="text_info">20.05.15~20.05.20/</span>
		            <p class="moreTextStatus">옵션 : 모델명: hd10 / 컬러: 화이트 / 용량: 32GB</p>
		            <div class="moreTextContents">이거 내구도 좋은가요</div>
				</div>
			</ul><!-- 반복문 돌릴부분 -->
				<ul class="QAList" style="margin:0;padding:0"><!-- 반복문 돌릴부분 -->
				<li class="list1">2020-06-10</li>
				<li class="list2" onclick="showMoreText(this)">
					<a href="javascript:;" role="button" >제목1</a>
				</li>
				<li class="list3">작성자1</li>
				<li class="list4">조회수1</li>
				<li class="list5">추천1</li>
				<li class="list6">평점1</li>
				<div class="moreText"><!-- 상세보기창 -->
					<span class="text_info">leez****/</span>
		            <span class="text_info">20.05.15~20.05.20/</span>
		            <p class="moreTextStatus">옵션 : 모델명: hd10 / 컬러: 화이트 / 용량: 32GB</p>
		            <div class="moreTextContents">이거 내구도 좋은가요</div>
				</div>
			</ul><!-- 반복문 돌릴부분 -->
		</div>
		<div>
			<ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link bg-dark text-white" href="javascript:void(0);">&lt;</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			    <li class="page-item"><a class="page-link bg-dark text-white" href="javascript:void(0);">&gt;</a></li>
			</ul>
		</div>
		
		
        <p id="product_returnExchange"><span><h1>반품/교환정보</h1></span></p>	
 	    <img src="<%=request.getContextPath()%>/resources/products/notice.jpg" width="30%">	  
	</div>
	
</body>
</html>