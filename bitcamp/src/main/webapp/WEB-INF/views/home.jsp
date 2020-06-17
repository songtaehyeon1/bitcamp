<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#content {
	min-height: 100%;
	flex: 1;
}

#main-img {
	text-align: center;
}

#main-img img {
	width: 100%;
	min-width: 1300px
}

#main-img p {
	position: absolute;
	text-align: center;
	width: 100%;
	color: white;
	margin-top: 260px;
	font-size: 70px;
	min-width: 1300px
}

#main-img i {
	margin-top: 50px;
}

#content a:hover {
	text-decoration: none;
	color: #A29C9C;
}

#content a {
	color: white;
}

#second-img div {
	min-width: 700px;
}

#second-img div:first-child {
	width: 50%;
	height: 700px;
	float: left;
	background: black;
	text-align: center;
	padding-top: 270px;
}

#third-img div {
	width: 34%;
	height: 500px;
	float: left;
	background: black;
	text-align: center;
	transform: scale(1);
	overflow: hidden;
	color: white;
	line-height: 500px;
	font-size: 2em;
}

#third-img img {
	transition: all 0.7s ease-in-out;
	width: 100%;
	height: 500px;
}

#third-img>div>div {
	width: 100%;
	background: black;
	opacity: 0.6;
	position: absolute;
	display: none;
	z-index: 10;
	transition: all 0.7s ease-in-out;
}

#fourth-img {
	width: 100%;
	height: 700px;
	float: left
}

#fourth-img img {
	position: absolute;
	width: 100%;
	height: 700px
}

#fourth-img div {
	position: absolute;
	background: black;
	line-height: 10px;
	opacity: 0.6;
	padding-top: 200px;
	padding-right: 30px;
	width: 50%;
	height: 700px;
	color: white;
	text-align: right;
}

#fourth-img div p {
	font-size: 2em
}

#fourth-img div>p:first-child {
	font-size: 3em;
	margin-bottom: 50px
}

.product-list>div:first-child {
	width: 200px;
	height: 34px;
	position: relative;
	left: 1220px;
}

#sort {
	width: 100%;
	height: 100%;
	padding: 0 10px;
}

.product-list {
	width: 100%;
	float: left;
	margin: 0;
}

.product-list li {
	position: relative;
	float: left;
	width: 33.3%;
	height: 600px;
	padding: 30px;
	box-sizing: border-box;
}

.product-list li div {
	text-align: center;
	margin-bottom: 5px;
}
/*마우스 오버시 이미지 확대 효과*/
.product-img {
	overflow: hidden; /*부모 크기를 벗어나지 않고 내부 이미지 확대 */
	height: 440px;
}

.product-img img {
	width: 100%;
	/*마우스가 이미지를 벗어났을때도 자연스럽게 크기가 줄어들게 하기 위함*/
	transform: scale(1.0);
	transition: all 0.5s ease-in-out;
	height: 440px;
}

.product-img img:hover {
	-webkit-transform: scale(1.1); /*for chrome*/
	-moz-transform: scale(1.1); /*for firefox*/
	-o-transform: scale(1.1); /*for opera*/
	transform: scale(1.1);
	transition: transform 0.5s;
	-o-transition: transform 0.5s;
	-moz-transition: transform 0.5s;
	-webkit-transition: transform 0.5s;
}

.product-list ul, .product-list li {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.product-item-name strong {
	color: black;
}

.product-list a:link, .product-list a:visited {
	text-decoration: none;
	color: #222;
}

.product-item-name {
	font-size: 20px;
	color: #333;
}

.price {
	font-size: 17px;
	font-weight: bolder;
	color: #5D5D5D;
}

.desc {
	font-size: 13px;
	color: #666;
}

.go-list {
	position: absolute;
	top: 390px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: black;
	color: #fff;
	transition-property: transform;
	transition-duration: 399ms;
	/*display:none;*/
	visibility: hidden;
}
</style>
<script>
	$(function() {
		$("#third-img>div").hover(function() {
			$(this).children("img").css("transform", "scale(1.1)");
			$(this).children("div").css("display", "block");
		}, function() {
			$(this).children("img").css("transform", "scale(1)");
			$(this).children("div").css("display", "none");
		});

		$(".product-list>ul li").hover(
				function() {
					//마우스 오버일때
					$(this).children(".go-list").css("visibility", "visible")
							.animate().slideDown(3000);

				}, function() {
					//마우스 아웃일때
					$(this).children(".go-list").css("visibility", "hidden");
				});
		
		$('#arrow').click(function(){

			var offset = $('#second-img').offset();

 
	        $('html').animate({scrollTop : offset.top-100}, 400);

		});


	});
</script>
<div id="content">
	<div id="main-img">
		<p>
			<span class="shadow-lg">PLAN YOUR ADVENTURE</span><br /> <span
				style="font-size: 30px; top: -20px"><a href="#">shop now</a></span><br />
			<a
				id="arrow"><i
				class="fas fa-chevron-down"></i></a>
		</p>
		<img src="<%=request.getContextPath()%>/resources/main/mainimg.jpg" />
	</div>
	<div id="second-img"
		style="width: 100%; height: 700px; display: inline-flex;">
		<div>
			<span class="shadow-lg" style="color: white; font-size: 70px;">NEW
				ARRIVALS</span><br /> <span style="font-size: 30px; top: -20px"><a
				href="/bitcamp/order">shop now</a></span>
		</div>
		<div
			style="width: 50%; height: 700px; float: left; display: inline-flex;">
			<img src="<%=request.getContextPath()%>/resources/main/secondimg.jpg"
				style="width: 100%; height: 100%" />
		</div>
	</div>

	<div id="third-img"
		style="width: 100%; height: 500px; display: inline-flex;">
		<div>
			<div>텐트</div>
			<img src="<%=request.getContextPath()%>/resources/main/tent.jpg" />
		</div>
		<div>
			<div>BBQ/그릴</div>
			<img src="<%=request.getContextPath()%>/resources/main/grill.jpg" />
		</div>
		<div>
			<div>코펠/버너</div>
			<img src="<%=request.getContextPath()%>/resources/main/coppel.jpg" />
		</div>
	</div>

	<div class="product-list">
		<ul>
			<li>
				<div class="product-img">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/category/product_01.png"
						alt=""></a>
				</div>
				<div class="go-list">
					<a href="#">상품 보러가기</a>
				</div>

				<div class="product-item-name">
					<a href="#"><strong>코베아 문리버2 4인 캠핑세트</strong></a>
				</div>
				<div class="price">158,850원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/category/product_02.png"
						alt=""></a>
				</div>
				<div class="go-list">
					<a href="#">상품 보러가기</a>
				</div>
				<div class="product-item-name">
					<a href="#"><strong>3인 컴팩트 세트</strong></a>
				</div>
				<div class="price">93,600원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img
						src="<%=request.getContextPath()%>/resources/category/product_03.png"
						alt=""></a>

				</div>
				<div class="go-list">
					<a href="#">상품 보러가기</a>
				</div>
				<div class="product-item-name">
					<a href="#"><strong>4인 기본세트</strong></a>
				</div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
		</ul>
	</div>



	<div id="fourth-img">
		<img src="<%=request.getContextPath()%>/resources/main/campingus.jpg" />
		<div>
			<p>SLEEP UNDER THE STARS</p>
			<br />
			<p>Start planning your next adventure</p>
			<br />
			<p>Become one with nature</p>
			<br />
			<p>Everything you need for the perfect travel experience</p>
			<br />
		</div>
	</div>



</div>
