<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bitcamp/css/bootstrap.min.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/bitcamp/js/bootstrap.min.js"></script>
<style>
.wrap{
	margin:170px 100px 0 100px;
}
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	font-size:36px;
	margin: 8px 0px;
}
.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}

/*sidebar*/
.sidebar ul, .sidebar li, .product-list ul, .product-list li{
	margin:0;
	padding:0;
	list-style-type:none;  
}
a:link, a:visited{
	text-decoration:none;
	color:#222;
}
.sidebar{
	position:fixed;
	width:200px;
	margin-top:100px;
	padding:20px;
	float:left; 
}
.sidebar>span{font-size:26px;}
.sidemenu{ 
	border-top:1px solid rgba(12, 1, 69, 0.2);
	border-bottom:1px solid rgba(12, 1, 69, 0.2);		  
	padding:20px 0;
}
.minus-icon{
	float:right;
	margin-top:7px;
	width:10px;
	height:10px;  
	display:block;
}
.plus-icon{
	float:right;
	margin-top:7px;
	width:10px;
	height:10px; 
	display:none;
}
.sidemenu, .dep2{margin-top:20px;}
.dep2 li:first-child ~ li a:hover{
	text-decoration:none;
	color:#BDBDBD;
}

/*product-list*/
.product-list>div:first-child{
	width:200px; 
	height:34px; 
	position:relative;
	left:1220px;
}
#sort{
	width:100%;
	height:100%; 
	padding:0 10px;	
}
/*셀렉트박스 기본 화살표 지우기*/
select{
	-webkit-appearance: none; /*for chrome*/
	-moz-appearance: none; /*for firefox*/
	appearance: none;
	background-image:url(${ctx}/resources/category/arrow_icon.png);
	background-repeat:no-repeat;
	background-position:right 10px center;
}
select::-ms-expand{
	display: none; /*for IE10,11*/
}
select:focus {
  outline: none;
}
.product-list{ 	
	width:1440px; 
	float:left; 
	margin:100px 0 0 240px;
}
.product-list li{
	position:relative;
	float:left;	
	width:33.3%;
	height:600px;
	padding:30px;
	box-sizing:border-box;  /*padding 값을 너비값에 포함시키는 것*/
	/*width:32%;*/
	/*margin-left:2%;*/
}
/*
.product-list li:first-child{margin-left:0;}
.product-list li:nth-child(3n+1){margin-left:0;}
*/
.product-list li div{
	text-align:center;
	margin-bottom:5px;
}
	/*마우스 오버시 이미지 확대 효과*/
.product-img{
	overflow:hidden; /*부모 크기를 벗어나지 않고 내부 이미지 확대 */
	height:440px; 
}
.product-img img{
	width:100%;
	/*마우스가 이미지를 벗어났을때도 자연스럽게 크기가 줄어들게 하기 위함*/
	transform:scale(1.0);
	transition:all 0.5s ease-in-out;
}
.product-img img:hover{
    -webkit-transform:scale(1.1); /*for chrome*/
    -moz-transform:scale(1.1); /*for firefox*/
    -o-transform:scale(1.1); /*for opera*/
    transform:scale(1.1);
    transition: transform 0.5s;
    -o-transition: transform 0.5s;
    -moz-transition: transform 0.5s;
    -webkit-transition: transform 0.5s;
}
.btn_heart{
	position:relative;
	right:-140px;
	top:-380px;
	width:45px;
	height:45px;
	border:none;
	border-radius:50%;	
	background:rgb(246,246,246) no-repeat 50% 50%;
	background-image:url(${ctx}/resources/category/heart_icon.png);
	transition:all ease 1s;
}
.btn_heart:focus{
	outline:none;
}
.btn_toggle{
	background-image:url(${ctx}/resources/category/color_heart_icon.png);
	transform:rotate(720deg);
}
.add-cart{
    position:absolute;
    top:420px;
	width:420px; 
	height:50px;
	line-height:50px;
	background-color:rgb(219, 22, 58);
	transition-property:transform;
	transition-duration:399ms;
	/*display:none;*/
	visibility:hidden;
}
.add-cart a{
	color:#fff; 
}
.product-item-name{
	font-size:20px;
	color:#333;
}
.price{
	font-size:17px;
	font-weight:bolder;
	color:#5D5D5D;
}
.desc{
	font-size:13px;
	color:#666; 
}

/*modal*/
.modal{
	width:100%;
	height:100%;
	position:fixed;
	left:0;
	top:0;
	z-index:100;
	background:rgba(0, 0, 0, 0.5);
}
.modal .modal_container{
	width:400px;
    height:500px;
    border-radius:6px;
    background-color:#fff;
	text-align:center;
	position:absolute;
	top:50%;
	margin-top:-250px;
	left:50%;
	margin-left:-200px;
	padding:30px; 
}
.layer_name{
	float:left;
    font-size:24px;
    padding-bottom:30px;
}
.btn_close{
    float:right;
    width:32px;
    height:32px;
    border:none;
    outline:none;
    background: url(${ctx}/resources/category/close_btn.png) no-repeat 50% 50%;
}
.tit_cart{
	float:left;
	width:100%;
	font-size:16px;
	text-align:left;
    padding-bottom:12px;
    border-bottom:2px solid #333;
    line-height:24px;
}
.group_btn button{
	width:49%;
	height:54px;
	font-weight:bold;
	border-radius:3px;
	outline:none;
}
.btn_cancel{
	float:left;
    border:1px solid #5D5D5D;;
    background-color:#fff;
    color:#5D5D5D;
}
.btn_cart{
	float:right;
    border:1px solid #DB163A;
    background-color:#DB163A;
    color:#fff;
}
.total{
	float:left;
	width:100%;
	font-size:16px;
	line-height:24px;
}
.price>strong{
	float:left;
}
.sum{
	float:right;
}
.num{
	font-size:24px;
}
</style>
<script>
$(function(){
	/*
	//sidebar floating
	$(window).scroll(function(){
		st = $(window).scrollTop()
		h = $(window).height()*0.5
		$(".sidebar").stop().animate({"top":st+h})
	})
	*/
	
	//sidebar toggle
	$(".minus-icon").on('click',function(){
		$(".dep2").slideUp();
		$(this).hide();
		$(".plus-icon").show();
	});
	$(".plus-icon").on('click',function(){
		$(".dep2").slideDown();
		$(this).hide();
		$(".minus-icon").show();
	});
	
	//selectbox option
	var tagOption=["Sort by", "Newest", "Name A-Z", "Price(low to high)", "Price(high to low)"];    
	var tag="";
	for(i=0; i<tagOption.length; i++){
		tag += "<option>"+tagOption[i]+"</option>";
	}
	document.getElementById("sort").innerHTML = tag;	
	
	//btn-heart toggle
	$(".btn_heart").click(function(){
		$(this).toggleClass("btn_toggle");
	});

	//장바구니 fadeToggle
	$(".product-list>ul li").hover(function(){
		//마우스 오버일때
		$(this).children(".add-cart").css("visibility","visible").slideDown(3000);;
	},function(){
		//마우스 아웃일때
		$(this).children(".add-cart").css("visibility","hidden");
	});
	
	//장바구니 hover
	$(".add-cart").hover(function(){
		$(this).css("opacity","0.7");
	},function(){
		$(this).css("opacity","1");
	});
	
	//장바구니 카운트
	var cnt = 1;
	$(".btn_cart").click(function(){
		$(".badge").html(cnt++);
	});	
	
	//팝업창
	$('.add-cart a').click(function(){
		$('.modal').css('display','block');
	});
	
	$('.modal .btn_close, .btn_cancel').click(function(){
		$('.modal').css('display','none');
	});
});
</script>
</head>

<body>
<div class="wrap">
	<div class="hr-sect">SHOP</div>

	<div class="sidebar">
		<span>Filter by</span>
		<nav class="sidemenu">
			<ul>
				<li class="dep1"><a href="#">Collection</a> <img src="<%=request.getContextPath()%>/resources/category/minus_icon.png" alt="마이너스 아이콘" class="minus-icon"><img src="<%=request.getContextPath()%>/resources/category/plus_icon.png" alt="플러스 아이콘" class="plus-icon">
					<!-- 서브메뉴 -->
					<ul class="dep2">
						<li><a href="#"><b>All</b></a></li>
						<li><a href="#">Camping Package</a></li>
						<li><a href="#">Tent/Tarp</a></li>
						<li><a href="#">Mat/Sleeping bag</a></li>
						<li><a href="#">Coppell/Burner/Cooking</a></li>
						<li><a href="#">Chair/Table/etc.</a></li>
						<li><a href="#">Brazier/BBQ</a></li>
						<li><a href="#">Backpacking</a></li>
					</ul>
				</li>  <!-- .dep1 -->
			</ul>
		</nav>
	</div>

	<div class="product-list"> 
		<div>
			<select id="sort" name="sort">
			</select>
		</div>
		
		<ul>
			<li>
				<div class="product-img">		
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_01.png" alt=""></a>
					<button type="button" class="btn_heart"></button>				
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>코베아 문리버2 4인 캠핑세트</strong></a></div>
				<div class="price">158,850원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
				</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_02.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>3인 컴팩트 세트</strong></a></div>
				<div class="price">93,600원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_03.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_01.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_02.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_03.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_01.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_02.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_03.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_01.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_02.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
			<li>
				<div class="product-img">
					<a href="#"><img src="<%=request.getContextPath()%>/resources/category/product_03.png" alt=""></a>
					<button type="button" class="btn_heart"></button>
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>4인 기본세트</strong></a></div>
				<div class="price">53,550원(10%할인)</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
		</ul>
	</div>
	
	<div class="modal">
		<div class="modal_container">
        	<strong class="layer_name">상품 선택</strong>
        	<button type="button" class="btn_close"></button>
        	<div class="inner_option">
		    	<strong class="tit_cart">코베아 문리버2 4인 캠핑세트</strong>
		    	<div class="total">
		    		<div class="price">
		    			<strong>합계</strong>
		    			<span class="sum">
		    				<span class="num">0</span>
		    				<span class="won">원</span>
		    			</span>
		    		</div>
		    	</div>
        	</div>
        	<div class="group_btn">
        		<button type="button" class="btn_cancel">취소</button>
        		<button type="button" class="btn_cart">장바구니 담기</button>
	        </div>
	    </div>
	</div>
</div>  <!-- wrap -->
</body>
</html>