<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
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
	$('#sort').change(function() {
		var sort = $(this).val(); 
		location.href="<%=request.getContextPath()%>/list?c_no=${c_no}&sort="+ sort;
	});

	//btn-heart toggle
	$(".btn_heart").click(function() {
		//btn_heart 
		$(this).toggleClass("btn_toggle");

		var heart = $(this).attr('class'); //버튼의 현재 class 속성값
		var p_no = "p_no=" + $(this).val(); //버튼의 p_no

		//관심상품
		if (heart == 'btn_heart btn_toggle') { //관심상품 추가
			var url = "/bitcamp/addInterest";

			$.ajax({
				type : "GET",
				url : url,
				data : p_no,
				success : function(result) {
					if (result > 0) {
						//관심상품 창 보여주기
						$(".btn_heart[class*=btn_toggle]").parents(".product-list").prev(".layerWish").css("display", "block");
					}
				},
				error : function() {
					console.log("관심상품 추가 에러....");
				}
			});
		} else if (heart == 'btn_heart') { //관심상품 삭제
			var url = "/bitcamp/delInterest";

			$.ajax({
				type : "GET",
				url : url,
				data : p_no,
				success : function(result) {
					if (result > 0) {
						alert("관심 상품목록에서 삭제되었습니다.");
					}
				},
				error : function() {
					console.log("관심상품 삭제 에러....");
				}
			});
		}

		/*
		//관심상품 창
		var idx = $(this).css("background-image").indexOf("color_heart_icon.png");
		if(idx<0){
			$(".layerWish").css("display","block");
		} 
		 */
		});

		//장바구니 fadeToggle
		$(".product-list>ul li").hover(function() {
			//마우스 오버일때
			$(this).children(".add-cart").css("visibility", "visible");
		}, function() {
			//마우스 아웃일때
			$(this).children(".add-cart").css("visibility", "hidden");
		});

		//장바구니 hover
		$(".add-cart").hover(function() {
			$(this).css("opacity", "0.7");
		}, function() {
			$(this).css("opacity", "1");
		});

		//장바구니 팝업창 열기
		$('.add-cart a').click(function() {
			$('.modal').css('display', 'block');
		});
		//장바구니 팝업창 닫기
		$('.modal .btn_close, .btn_cancel').click(function() {
			//#modalFrm 초기화 하기
			$("#delivery-charge").val('-1');
			$("#rental-period").val('2');
			$("#rental_start").val('');
			$("#rental_end").val('');
			$("#currentQty").attr('value','0');
			$("#limitQuantity").html('0');
			$('.delivery-fee-container').css("display","none");
			//장바구니 팝업창 닫기	
			$('.modal').css('display', 'none');
		});

		//배송비 결제 방법
		var chargeOption = ["- 결제 방법 선택 -", "방문 수령", "주문시 결제"];
		var tag = "";
		for (i=0; i<chargeOption.length; i++) {
			tag += "<option value='"+(i-1)+"'>" + chargeOption[i] + "</option>";  //value="-1" 부터
		}
		document.getElementById("delivery-charge").innerHTML = tag;
		$("#delivery-charge option:eq(0)").attr("disabled", true);  //비활성화
		
		//배송비 
		$('#delivery-charge').change(function() {
			var state = $('#delivery-charge option:selected').val();
			if (state==1) {
				$('.delivery-fee-container').css("display","block");
			} else {
				$('.delivery-fee-container').css("display","none");
			}
		});
		
		//대여 기간 	
		var periodOption = ["- 대여 기간 선택 -", "2박3일", "3박4일(+15,000원)", "4박5일(+30,000원)", "5박6일(+45,000원)"];
		var tag = "";
		for (i=0; i<periodOption.length; i++) {
			tag += "<option value='"+(i+2)+"'>" +periodOption[i]+ "</option>"; //value="2" 부터
		}
		document.getElementById("rental-period").innerHTML = tag;
		$("#rental-period option:eq(0)").attr("disabled", true);  //비활성화

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
				date.setDate(date.getDate() +parseInt($("#rental-period").val()-1));
					
				return new Date(date.getFullYear(), date.getMonth(), date.getDate());
			},maxDate : function() {
				var date = new Date(rental_start.value);
				date.setDate(date.getDate() +parseInt($("#rental-period").val()-1));
				
				return new Date(date.getFullYear(), date.getMonth(), date.getDate());
			}
		});

		//수량 + , - 버튼
		$('.productQty').click(this, function() {
			var currentQty = parseInt($('#currentQty').val());  //주문 수량
			var limitQty = parseInt($('#limitQuantity').html());  //재고 수량
			
			console.log("currentQty="+currentQty);
			console.log("limitQty="+limitQty);
			
			if($(this).hasClass("plus")) {
				if(currentQty < limitQty) {
					var plus = currentQty +1;
					console.log('plus');
					$('#currentQty').attr('value', plus);
					$('.num').html(plus * $("#price").val());
				}
			}
			if($(this).hasClass("minus")) {
				if(currentQty > 1) {
					var minus = currentQty -1;
					$('#currentQty').attr('value', minus);
					$('.num').html(minus * $("#price").val())
				}
			}
		});

		//수량 <input/>의 포커스 없애기
		$('.input_noclick').focus(this, function() {
			this.blur();
		});
		
		//#modalFrm 검사 
		$(document).on("submit", "#modalFrm", function(){
			
			if($("#delivery-charge").val()==null){
				alert("배송비 결제방법을 선택해 주세요.");
				return false;   
			}
			
			if( $("#rental-period").val()==null){
				alert("대여 기간을 선택해 주세요.");
				return false;
			}
			
			if( $("#rental_start").val()=="" ){
				alert("대여 시작일을 선택해 주세요.");
				return false;
			}
			
			if( $(".limitQuantity").val()=="" || $(".limitQuantity").val()==null || $(".limitQuantity").val()==0){
				alert("현재 해당 상품의 재고가 없습니다.");
				return false;
			}
			
			return true;
		});
}); //jquery 종료

//JavaScript
////////////
function period_change(period) {
	var date = new Date(rental_start.value);  //주문 시작일을 받음.
	var period = parseInt(period);  //대여기간
	date.setDate(date.getDate() + period);  //주문 시작일 +대여기간

	var year = date.getFullYear();  //yyyy
	var month = (1 + date.getMonth());  //mm
	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	var day = date.getDate();  //dd
	day = day >= 10 ? day : '0' + day;  //day 두자리로 저장
	var yyyymmdd = year + '-' + month + '-' + day;  //'-' 추가하여 yyyy-mm-dd 형태 생성
	$("#rental_end").datepicker('value', yyyymmdd)

}

//주문 날짜 선택시 마감날짜도 자동 값적용
function changeEndDay(startDay) {
	// 주문 시작일이 설정되면,마감날짜가 보이게 된다.
	if (rental_start.value != null || rental_start.value != '') {
		$("#rental_end_wrap").css("display", "flex");
		$("#orderDetail_wrap").css("display", "flex");
	}
	
	var date = new Date(startDay);// 주문 시작일을 받음.
	var period = parseInt($("#rental-period").val()-1);// 대여기간
	date.setDate(date.getDate() + period);// 주문 시작일 + 대여기간
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

//대여 종료일  변경 불가
function defaultday() {
	var date = new Date($("#rental_start").val());// 주문 시작일을 받음.
	var period = parseInt($("#rental-period").val());// 대여기간
	date.setDate(date.getDate() + period);// 주문 시작일 + 대여기간
	var year = date.getFullYear();// yyyy
	var month = (1 + date.getMonth());// mm
	month = month >= 10 ? month : '0' + month;// month 두자리로 저장
	var day = date.getDate();// dd
	day = day >= 10 ? day : '0' + day;// day 두자리로 저장
	var yyyymmdd = year + '-' + month + '-' + day;// '-' 추가하여 yyyy-mm-dd 형태 생성
	$("#rental_end").datepicker('value', yyyymmdd)
}

//상품 재고 체크
function availableChk() {
	var str = $("#p_no").val();
	var s_date = $('#rental_start').val();
	var e_date = $('#rental_end').val();

	if(s_date!="" && e_date!=""){
		$.ajax({
			type : "get",
			url : "/bitcamp/availableChk",
			data : {
				"p_no" : str,
				"s_date" : s_date,
				"e_date" : e_date
			},
			success : function(result) {
				$("#limitQuantity").html(result.productCount);
				$(".limitQuantity").val(result.productCount);
			},
			error : function(e) {
				alert("상품 재고 체크 에러...." + e.responseText);
			}
		});	
	}
}

//장바구니 담기_데이터
function addCart(p_no, p_filename, p_name,  delivery_fee, product_borrow_period, orderStart, orderEnd, currentQty, limitQuantity, price) {
	$("#p_no").val(p_no);
	$("#p_filename").val(p_filename);
	$("#p_name").val(p_name);
	$("#delivery_fee").val(delivery_fee);	
	//$("#rental-period").val(product_borrow_period);
	//$("#rental_start").val(orderStart);
	//$("#rental_end").val(orderEnd);
	//$("#currentQty").val(currentQty);	
	$("#price").val(price);
	
	$(".p_name").text(p_name);
	$(".num").text(price);
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
							<a href="<%=request.getContextPath()%>/list?c_no=0" <c:if test="${c_no==0}">style="font-weight:bold"</c:if>>All</a>
						</li>
						<c:forEach var="cvo" items="${clist}">
							<li>
								<a href="<%=request.getContextPath()%>/list?c_no=${cvo.c_no}" <c:if test="${c_no==cvo.c_no}">style="font-weight:bold"</c:if>>${cvo.c_name}</a>
							</li>
						</c:forEach>
					</ul>
				</li>
				<!-- .dep1 -->
			</ul>
		</nav>
	</div>

	<div class="layerWish">
		<h1>관심상품 담기</h1>
		<div class="content">
			<p>선택하신 상품을 관심상품에 담았습니다. <br>지금 관심상품을 확인하시겠습니까?</p>
		</div>
		<div class="btnArea">
			<a href="#" onclick="$('.layerWish').hide();">쇼핑계속하기</a> <a href="#" class="wishlist-confirm">관심상품확인</a>
		</div>
		<div class="close">
			<a onclick="$('.layerWish').hide();"><img src="<%=request.getContextPath()%>/resources/category/close_btn.png" alt="닫기 버튼"></a>
		</div>
	</div>

	<div class="product-list">
		<div class="sort-container">
			<select id="sort" name="sort">
				<option value="p_date" <c:if test="${sort=='p_date'}">selected</c:if>>신상품순</option>
				<option value="p_name" <c:if test="${sort=='p_name'}">selected</c:if>>상품명순</option>
				<option value="price" <c:if test="${sort=='price'}">selected</c:if>>낮은 가격순</option>
				<option value="price_desc" <c:if test="${sort=='price_desc'}">selected</c:if>>높은 가격순</option>
			</select>
		</div>

		<ul>
			<c:forEach var="plist" items="${plist}">
				<li class="list">
					<div class="product-img">
						<a href="/bitcamp/productView?p_no=${plist.p_no}"><img src="<%=request.getContextPath()%>/resources/category/${plist.p_filename1}" onerror="this.src='/bitcamp/resources/category/product_01.png'"></a>
						<c:if test="${logStatus!=null && logStatus=='Y'}">
							<button type="button" value="${plist.p_no}" class="btn_heart <c:if test="${plist.heart=='Y'}">btn_toggle</c:if>"></button>
						</c:if>
					</div>
					<div class="add-cart">
						<a href="#" onclick="javascript:addCart('${plist.p_no}','${plist.p_filename1}','${plist.p_name}','${plist.delivery_fee}','${plist.product_borrow_period}','${plist.orderStart}','${plist.orderEnd}','${plist.currentQty}','${plist.limitQuantity}','${plist.price}');">Add to Cart</a>
					</div>
					<div class="product-item-name">
						<a href="/bitcamp/productView?p_no=${plist.p_no}"><strong>${plist.p_name}</strong></a>
					</div>
					<div class="price">${plist.price}</div>
					<div class="desc">2박3일 대여요금</div>
				</li>
			</c:forEach>
		</ul>
	</div>

	<form method="post" action="/bitcamp/productCart" id="modalFrm">
		<div class="modal">
			<div class="modal_container">
				<input type="hidden" id="p_no" name="p_no"/> 		
				<input type="hidden" id="p_filename" name="p_filename1"/>
				
				<strong class="layer_name">상품 선택</strong>
				<button type="button" class="btn_close"></button>

				<div class="inner_option">
					<strong class="tit_cart p_name"></strong>
					<input type="hidden" id="p_name" name="p_name"/>
					<div class="delivery-charge-container" style="overflow:auto">
						<label>배송비 결제</label> 
						<select id="delivery-charge" name="product_payment">
						</select>
					</div>
					
					<div class="delivery-fee-container" style="display:none;">
						<label>배송비</label> <span class="won" style="float: right;">원</span> <input type="text" id="delivery_fee" name="delivery_fee" readonly style="border:none; float:right; width:215px; padding:0 10px; text-align:right; outline:none;"/>
					</div>

					<div class="rental-period-container" style="overflow:auto">
						<label>대여 기간</label> 
						<select id="rental-period" name="product_borrow_period" onchange="period_change(this.value)"></select>
					</div>

					<div class="rental_start-container" style="overflow:auto;">
						<label>대여 시작일</label> 
						<input id="rental_start" name="orderStart" readonly onchange="changeEndDay(this.value);availableChk()" />
					</div>

					<div class="rental_end-container" style="overflow:auto;">
						<label>대여 종료일</label> 
						<input id="rental_end" name="orderEnd" readonly onkeyup="defaultday()"/>
					</div>

					<div> 
						<label>수량</label>
						<span class="qty">
							<button type="button" class="btn minus productQty"><i class="icon-minus"></i></button>
							<input type="text" class="currentQty cartItems input_noclick transparent" id="currentQty" name="currentQty" value="0" readonly>
							<button type="button" class="btn plus productQty"><i class="icon-plus"></i></button>
						</span>
						
						<div class="quantity_msg">
							<span><label id="limitQuantity">0</label>개까지 구매 가능합니다.</span>
							<input type="hidden" class="limitQuantity" name="limitQuantity" value='0'>
						</div>
					</div>

					<div class="total">
						<div class="price">
							<strong>합계</strong> 
							<span class="sum"> 
								<span class="num">0</span> 
								<input type="hidden" id="price" name="price"/>
								<span>원</span>
							</span>
						</div>
					</div>
				</div>
				
				<div class="group_btn">
					<button type="button" class="btn_cancel">취소</button>
					<button type="submit" class="btn_cart">장바구니 담기</button>
				</div>
			</div>
		</div>
	</form>
</div>
<!-- wrap -->
