<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/category/list.css"/>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"/>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>

<title>리스트</title>

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
	
	//상품 정렬 
	var sortOption=["Sort by", "Newest", "Name A-Z", "Price(low to high)", "Price(high to low)"];    
	var tag="";
	for(i=0; i<sortOption.length; i++){
		tag += "<option>"+sortOption[i]+"</option>";
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
	var chargeOption=["- 결제 방식 선택 -", "방문 수령", "주문시 결제", "착불"];    
	var tag="";
	for(i=0; i<chargeOption.length; i++){
		tag += "<option>"+chargeOption[i]+"</option>";
	}
	document.getElementById("delivery-charge").innerHTML = tag;
	
	//대여 기간 	
	var periodOption=["- 대여 기간 선택 -", "2박3일", "3박4일(+15,000원)", "4박5일(+30,000원)", "5박6일(+45,000원)"];    
	var tag="";
	for(i=0; i<periodOption.length; i++){
		tag += "<option value='"+(i+2)+"'>"+periodOption[i]+"</option>";  //value="2" 부터
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
</script>



<div class="wrap">
	<div class="hr-sect">SHOP</div>

	<div class="sidebar">
		<span>Filter by</span>
		<nav class="sidemenu">
			<ul>
				<li class="dep1"><a href="#">Collection</a> <img src="<%=request.getContextPath()%>/resources/category/minus_icon.png" alt="마이너스 아이콘" class="minus-icon"><img src="<%=request.getContextPath()%>/resources/category/plus_icon.png" alt="플러스 아이콘" class="plus-icon">
					<!-- 서브메뉴 -->
					<ul class="dep2">
						<li>
							<a href="<%=request.getContextPath()%>/listAll" <c:if test="${c_no==null}">style="font-weight:bold"</c:if> >All</a>
						</li>
						<c:forEach var="cvo" items="${clist}">
							<li>
								<a href="<%=request.getContextPath()%>/list?c_no=${cvo.c_no}" <c:if test="${c_no==cvo.c_no}">style="font-weight:bold"</c:if> >${cvo.c_name}</a>
							</li>	
						</c:forEach>	
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
		<div class="sort-container">
			<select id="sort" name="sort">
			</select>
		</div>
		
		<ul>
		<c:forEach var="plist" items="${plist}">
			<li>
			
			
				<div class="product-img">		
					<a href="/bitcamp/productView?p_no=${plist.p_no}"><img src="<%=request.getContextPath()%>/resources/category/${plist.p_filename1}" alt=""></a>
					<button type="button" class="btn_heart"></button>				
				</div>
				<div class="add-cart"><a href="#">Add to Cart</a></div>
				<div class="product-item-name"><a href="#"><strong>${plist.p_name}</strong></a></div>
				<div class="price">${plist.price}</div>
				<div class="desc">2박3일 대여요금</div>
			</li>
		</c:forEach>
		</ul>
	</div>
	
	<div class="modal">
		<div class="modal_container">
        	<strong class="layer_name">상품 선택</strong>
        	<button type="button" class="btn_close"></button>
        	
        	<div class="inner_option" style="clear:left">
		    	<strong class="tit_cart">코베아 문리버2 4인 캠핑세트</strong>
		    	
		    	<div class="delivery-charge-container" style="overflow:auto" >
		    		<label>배송비 결제</label>
		    		<select id="delivery-charge" name="delivery-chare"></select>
		    	</div>
		    	
		    	<div class="rental-period-container" style="overflow:auto">
		    		<label>대여 기간</label>
		    		<select id="rental-period" name="rental-period" onchange="period_change(this.value)">
		    		</select>
		    	</div>
		    	
		    	<div class="rental_start-container"  style="overflow:auto;">
		    		<label style="float:left">대여 시작일</label>
		    		<input style="float:right" id="rental_start" name="rental_start" readonly onchange="changeEndDay(this.value);"/>
		    	</div>
		    	
		    	<div class="rental_end-container" style="overflow:auto">
		    		<label style="clear:left; float:left">대여 종료일</label>
		    		<input style="float:right" id="rental_end" name="rental_end" readonly onkeyup="defaultday()"/>
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
