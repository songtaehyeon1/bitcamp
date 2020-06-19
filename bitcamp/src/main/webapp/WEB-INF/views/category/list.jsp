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
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
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

/*관심상품*/
.layerWish {
    position: fixed;
    top: 41%;
    left: 47%;
    z-index: 1000;
    width: 440px;
    max-width: 440px;
    height: 320px;
    margin: -72px 0 0 -150px;
    border: 1px solid #000;
    border-radius:6px;
    background: #fff;
    text-align: center;
    display:none;
}
.layerWish h1 {
    font-size: 21px;
    text-align: center;
    color: #000;
    font-weight: bold;
    margin: 60px auto 30px;
}
.layerWish .content p {
    color: #000;
    font-size: 16px;
    font-weight: 400;
    margin-bottom: 40px;
    line-height: 22px;
}
.layerWish .btnArea a {
    display: inline-block;
    padding: 10px 20px;
    color: #000;
    border: 1px solid #000;
    box-sizing: border-box;
    margin: 0 5px;
    font-size: 15px;
    font-weight: 500;
}
.layerWish .btnArea a.wishlist-confirm {
    background: #000;
    color: #fff;
}
.layerWish .close {
    position: absolute;
    right: 10px;
    top: 10px;
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
	display:block;
	width:100%; 
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
	float:left;
	text-align:left;
}
.layer_name{
    font-size:24px;
}
.btn_close{
    float:right;
    width:32px;
    height:32px;
    border:none;
    outline:none;
    background: url(${ctx}/resources/category/close_btn.png) no-repeat 50% 50%;
}
.inner_option, .group_btn{
	width:100%;
	padding-top:12px;
}
.tit_cart{
	width:100%;
	font-size:16px;
	text-align:left;
    padding-bottom:12px;
    border-bottom:2px solid #333;
    line-height:24px;
    display:inline-block;
}
.inner_option>div:first-of-type{
	  padding-top:12px;
}
#delivery-charge, #rental-period{float:right;}
.group_btn button{
	width:49%;
	height:54px;
	font-weight:bold;
	border-radius:3px;
	outline:none;
}
.total{
	width:100%;
	font-size:16px;
	line-height:24px;
}
.sum{
	float:right;
}
.num{
	font-size:24px;
}
.btn_cancel{
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
		//관심상품 창
		$(".btn_heart[class*=btn_toggle]").parents(".product-list").prev(".layerWish").css("display","block");
		
		/*
		//관심상품 창
		var idx = $(this).css("background-image").indexOf("color_heart_icon.png");
		if(idx<0){
			$(".layerWish").css("display","block");
		} 
		*/
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
	
	//장바구니 팝업창
	$('.add-cart a').click(function(){
		$('.modal').css('display','block');
	});
	
	$('.modal .btn_close, .btn_cancel').click(function(){
		$('.modal').css('display','none');
	});
	
	//배송비 결제 
	var optionTag=["- 결제 방식 선택 -", "방문 수령", "주문시 결제", "착불"];    
	var tag="";
	for(i=0; i<optionTag.length; i++){
		tag += "<option>"+optionTag[i]+"</option>";
	}
	document.getElementById("delivery-charge").innerHTML = tag;
	
	//대여 기간 
	/*
	var tagOption=["- 대여 기간 선택 -", "2박3일", "3박4일(+15,000원)", "4박5일(+30,000원)", "5박6일(+45,000원)"];    
	var tag="";
	for(i=0; i<tagOption.length; i++){
		tag += "<option>"+tagOption[i]+"</option>";
	}
	document.getElementById("rental-period").innerHTML = tag;
	*/
	
	var tagOption=["- 대여 기간 선택 -", "2박3일", "3박4일(+15,000원)", "4박5일(+30,000원)", "5박6일(+45,000원)"];    
	var tag="";
	for(i=0; i<tagOption.length; i++){
		tag += "<option value='"+(i+2)+"'>"+tagOption[i]+"</option>";  //value="2" 부터
	}
	document.getElementById("rental-period").innerHTML = tag;
	

	//대여 시작일
	var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
	$('#rental_start').datepicker({
		uiLibrary : 'bootstrap4.4.1',
		format : "yyyy-mm-dd",
		minDate : function() {
            var date = new Date();
            date.setDate(date.getDate()+7);
            return new Date(date.getFullYear(), date.getMonth(), date.getDate());
        }
	});
	
	//대여 종료일
	var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
	$('#rental_end').datepicker({
		uiLibrary : 'bootstrap4.4.1',
		format : "yyyy-mm-dd",
		minDate : function() {
			var date = new Date(rental_start.value);
            date.setDate(date.getDate()+parseInt($("#rental-period").val()));
            return new Date(date.getFullYear(), date.getMonth(), date.getDate());
		},
		maxDate : function() {
            var date = new Date(rental_start.value);
            date.setDate(date.getDate()+parseInt($("#rental-period").val()));
            return new Date(date.getFullYear(), date.getMonth(), date.getDate());
		}
	});
	
	
	
});
function period_change(period){
	if(period!=null||period!=''){
		$("#rental-period-container").css("display","flex")
	}
	var date = new Date(rental_start.value);// 주문 시작일을 받음.
	var period = parseInt(period);// 대여기간
	date.setDate(date.getDate()+period);// 주문 시작일 + 대여기간
	
	
	var year = date.getFullYear();// yyyy
	var month = (1 + date.getMonth());// mm
    month = month >= 10 ? month : '0' + month;// month 두자리로 저장
    var day = date.getDate();// dd
    day = day >= 10 ? day : '0' + day;// day 두자리로 저장
    var yyyymmdd = year + '-' + month + '-' + day;// '-' 추가하여 yyyy-mm-dd 형태 생성
	$("#rental_end").datepicker('value', yyyymmdd)
	
}
//주문 날짜 선택시 마감날짜도 자동 값적용
function changeEndDay(startDay){
	// 주문 시작일이 설정되면,마감날짜가 보이게 된다.
	if(rental_start.value!=null||rental_start.value!=''){
		$("#rental_end_wrap").css("display","flex")
		$("#orderDetail_wrap").css("display","flex")
	}
	console.log($("#rental-period"))	
	var date = new Date(startDay);// 주문 시작일을 받음.
	var period = parseInt($("#rental-period").val());// 대여기간
	console.log("주문날짜 선택===>"+period)
	
	date.setDate(date.getDate()+period);// 주문 시작일 + 대여기간
//	$("#rental_period").html(startDay+"~")//시작일
	var year = date.getFullYear();// yyyy
	var month = (1 + date.getMonth());// mm
    month = month >= 10 ? month : '0' + month;// month 두자리로 저장
    var day = date.getDate();// dd
    day = day >= 10 ? day : '0' + day;// day 두자리로 저장
    var yyyymmdd = year + '-' + month + '-' + day;// '-' 추가하여 yyyy-mm-dd 형태 생성
	$("#rental_end").datepicker('value', yyyymmdd)
//	$("#borrow_period").append(yyyymmdd)//종료일
	
}


// 대여종료일은 못바꾸게 해야함
function defaultday(){
	var date = new Date($("#rental_start").val());// 주문 시작일을 받음.
	var period = parseInt($("#rental-period").val());// 대여기간
	date.setDate(date.getDate()+period);// 주문 시작일 + 대여기간
	var year = date.getFullYear();// yyyy
	var month = (1 + date.getMonth());// mm
    month = month >= 10 ? month : '0' + month;// month 두자리로 저장
    var day = date.getDate();// dd
    day = day >= 10 ? day : '0' + day;// day 두자리로 저장
    var yyyymmdd = year + '-' + month + '-' + day;// '-' 추가하여 yyyy-mm-dd 형태 생성
	$("#rental_end").datepicker('value', yyyymmdd)
}
//키보드 입력 못하게 하기
function donotusekeyboard(event){
	event.preventDefault();
}
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
	
	<div class="layerWish">
	  <h1>관심상품 담기</h1>
	  <div class="content">
	    <p>선택하신 상품을 관심상품에 담았습니다. <br>지금 관심상품을 확인하시겠습니까?</p>
	  </div>
	  <div class="btnArea">
	    <a href="#" onclick="$('.layerWish').hide();">쇼핑계속하기</a>
	    <a href="#" class="wishlist-confirm">관심상품확인</a>
	  </div>
	  <div class="close"><a onclick="$('.layerWish').hide();"><img src="<%=request.getContextPath()%>/resources/category/close_btn.png" alt="닫기 버튼"></a></div>
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
		    	
		    	<div class="delivery-charge-container">
		    		<label>배송비 결제</label>
		    		<select id="delivery-charge" name="delivery-chare"></select>
		    	</div>
		    	
		    	<div class="rental-period-container">
		    		<label>대여 기간</label>
		    		<select id="rental-period" name="rental-period" onchange="period_change(this.value)">
		    		</select>
		    		
		    		
		    		
		    		
		    	</div>
		    	
		    	<div>
		    		<label>대여 시작일</label>
		    		<input id="rental_start" name="rental_start" onkeydown="donotusekeyboard(event)" onchange="changeEndDay(this.value);"/>
		    	</div>
		    	
		    	<div>
		    		<label>대여 종료일</label>
		    		<input id="rental_end" name="rental_end"  onkeyup="defaultday()"/>
		    	</div>
		    	
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