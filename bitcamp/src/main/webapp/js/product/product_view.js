$(function() {
	//최대 대여갯수 설정
	$("#putCart").click(this,function(){
		var limitQty = parseInt($("#limitQuantity").html());
		$("input[name='limitQuantity']").val(limitQty);
	})
	$("#buySubmit").click(this,function(){
		var limitQty = parseInt($("#limitQuantity").html());
		$("input[name='limitQuantity']").val(limitQty);
	})
	
	
	// 바로 구매하기 옵션이 있어야만 전송이 됨
	$('.buyRightNow').click(this, function() {

		var payment = $('#product_payment');
		var period = $('#product_borrow_period');
		var start = $('#borrow_start');
		if (payment.val() == null) {
			alert('배송비 결제 방식을 선택해주세요')
			payment.focus();
			return false
		}
		if (period.val() == null) {
			alert('대여기간을 선택해주세요')
			period.focus();
			return false
		}
		if (start.val() == '') {
			alert('대여 시작일을 선택해주세요')
			start.focus();
			return false
		}
	})
	// 주문수량 조정
	$('.productQty').click(
			this,
			function() {
				$('.quantity_msg').css('display', 'none');
				var currentQty = parseInt($('.currentQty').val());// 현재 주문 수량
				$('.quantity_wrap').css('border-bottom',
						'1px solid rgba(0, 0, 0, .1)');
				var limitQty = parseInt($('#limitQuantity').html())
				if ($(this).hasClass("plus")) {
					if (currentQty < limitQty) {
						var plus = currentQty + 1;
						$('.currentQty').attr('value', plus)
					}
					if (currentQty >= limitQty) {
						$('.quantity_msg').css('display', 'block');
						$('.quantity_wrap').css('border-bottom',
								'1px solid red');
						$('.currentQty').attr('value', limitQty)
						return false;
					}
				}
				if ($(this).hasClass("minus")) {
					if (currentQty > 1) {
						var minus = currentQty - 1;
						$('.currentQty').attr('value', minus)
					}
				}
			})

	// inputbox에 클릭이나 커서표시가 안되게 하기
	$('.input_noclick').click(this, function(event) {
		event.preventDefault();
	})
	$('.input_noclick').focus(this, function() {
		this.blur();
	})

	// 탭메뉴 클릭에 따른 변경 및 이동
	$('.tab_menu_btn').click(this, function(event) {
		event.preventDefault();
		// 버튼 색 제거,추가
		$('.tab_menu_btn').removeClass('on');
		$(this).addClass('on')

		// 이동
		var id = $(this).attr('href');// 선택한 탭이 이동하려는 객체의 주소
		var idTop = $(id).offset().top;// / 선택한 객체의 위치
		var tabContainerHeight = $('.tab_wrap').height();// //탭이 오프셋으로 붙으면
															// 계산해야할 높이
		var scrollTop = idTop - tabContainerHeight;// idTop에서 탭만큼 빼줘야함.
		$('html, body').animate({
			scrollTop : scrollTop - 108
		}, 600);
		// 이동하는거에 조금씩 문제가 생기는데 왜 그런지 이유를 모르겠음....나중에 수정해야할거같다..
	})

	// 탭메뉴 스크롤하는거에 따른 메뉴 변경
	var nav = $('.tab_wrap');
	var topBar = $(".tab_wrap").offset();
	$(window).scroll(function() {
		// 스티키 메뉴 탑
		if ($(this).scrollTop() > topBar.top - 108) {
			nav.addClass("f-nav");
		} else {
			nav.removeClass("f-nav");
		}
		var tab1 = $('.tab_menu_btn1')
		var tab2 = $('.tab_menu_btn2')
		var tab3 = $('.tab_menu_btn3')
		var tab4 = $('.tab_menu_btn4')

		var currentLoc = $(this).scrollTop();
		var tab1loc = $('#product_information').offset().top - 60 - 108;
		var tab2loc = $('#product_review').offset().top - 60 - 108;
		var tab3loc = $('#product_QA').offset().top - 60 - 108;
		var tab4loc = $('#product_returnExchange').offset().top - 60 - 108;
		// 메뉴 변경
		if (currentLoc < tab2loc) {
			tab1.addClass("on")
		} else {
			tab1.removeClass("on")
		}
		if (currentLoc > tab2loc && currentLoc < tab3loc) {
			tab2.addClass("on")
		} else {
			tab2.removeClass("on")
		}
		if (currentLoc > tab3loc && currentLoc < tab4loc) {
			tab3.addClass("on")
		} else {
			tab3.removeClass("on")
		}
		if (currentLoc > tab4loc) {
			tab4.addClass("on")
		} else {
			tab4.removeClass("on")
		}
	});

	// 사진 클릭시 해당 사진으로 변경
	$('.thumbImage').on({
		"click" : function() {
			var imgSrc = $(this).attr('src');
			$('.bigImage').attr('src', imgSrc)
			console.log(borrow_start.value)
			var yy = new Date(borrow_start.value).getFullYear();
			var mm = new Date(borrow_start.value).getMonth() + 1;
			var dd = new Date(borrow_start.value).getDate();
			console.log(yy)
			console.log(mm)
			console.log(dd)
		}
	})
	// 썸네일 사진 안에 들어가는 div 사이즈
	var list = $(".listImage");
	list.width(list.width() - 60);

	var currentPosition;// 현재 좌표////////////////////////////////////////
	var pageWidth = $('.listImage').innerWidth();// 페이지 1장의 너비
	var $imageWrap = $(".listImage>ul");// ul
	// 버튼에 따라 이동
	$('.prevBtn').on("click", function() {
		currentPosition = $imageWrap.position().left;// /////////////////////
		$imageWrap.animate({
			"left" : 10
		})
	})
	$('.nextBtn').on("click", function() {
		currentPosition = $imageWrap.position().left;// ////////////////////
		$imageWrap.animate({
			"left" : -pageWidth
		})
	})
})

function period_change(period) {
	// 대여기간에 따른 추가 금액 변경
	if (period == 3) {
		$("#product_borrow_period_price option:eq(0)").prop("selected", true);
	} else if (period == 4) {
		$("#product_borrow_period_price option:eq(1)").prop("selected", true);
	} else if (period == 5) {
		$("#product_borrow_period_price option:eq(2)").prop("selected", true);
	} else if (period == 6) {
		$("#product_borrow_period_price option:eq(3)").prop("selected", true);
	}

	// 대여기간 선택시 하단 창 등장.
	if (period != null || period != '') {
		$("#borrow_start_wrap").css("display", "flex")
	}
	var date = new Date(borrow_start.value);// 주문 시작일을 받음.
	var period = parseInt(period);// 대여기간
	date.setDate(date.getDate() + period);// 주문 시작일 + 대여기간

	var year = date.getFullYear();// yyyy
	var month = (1 + date.getMonth());// mm
	month = month >= 10 ? month : '0' + month;// month 두자리로 저장
	var day = date.getDate();// dd
	day = day >= 10 ? day : '0' + day;// day 두자리로 저장
	var yyyymmdd = year + '-' + month + '-' + day;// '-' 추가하여 yyyy-mm-dd 형태 생성
	$("#borrow_end").datepicker('value', yyyymmdd)

}

// 주문 날짜 선택시 마감날짜도 자동 값적용
function changeEndDay(startDay) {
	// 주문 시작일이 설정되면,마감날짜가 보이게 된다.
	if (borrow_start.value != null || borrow_start.value != '') {
		$("#borrow_end_wrap").css("display", "flex")
		$("#orderDetail_wrap").css("display", "flex")
	}

	var date = new Date(startDay);// 주문 시작일을 받음.
	var period = parseInt(product_borrow_period.value);// 대여기간
	date.setDate(date.getDate() + period);// 주문 시작일 + 대여기간
	$("#borrow_period").html(startDay + "~")// 시작일
	var year = date.getFullYear();// yyyy
	var month = (1 + date.getMonth());// mm
	month = month >= 10 ? month : '0' + month;// month 두자리로 저장
	var day = date.getDate();// dd
	day = day >= 10 ? day : '0' + day;// day 두자리로 저장
	var yyyymmdd = year + '-' + month + '-' + day;// '-' 추가하여 yyyy-mm-dd 형태 생성
	$("#borrow_end").datepicker('value', yyyymmdd)
	$("#borrow_period").append(yyyymmdd)// 종료일
}

// 대여종료일은 못바꾸게 해야함
function defaultday() {
	var date = new Date(borrow_start.value);// 주문 시작일을 받음.
	var period = parseInt(product_borrow_period.value);// 대여기간
	date.setDate(date.getDate() + period);// 주문 시작일 + 대여기간
	var year = date.getFullYear();// yyyy
	var month = (1 + date.getMonth());// mm
	month = month >= 10 ? month : '0' + month;// month 두자리로 저장
	var day = date.getDate();// dd
	day = day >= 10 ? day : '0' + day;// day 두자리로 저장
	var yyyymmdd = year + '-' + month + '-' + day;// '-' 추가하여 yyyy-mm-dd 형태 생성
	$("#borrow_end").datepicker('value', yyyymmdd)
}

// 키보드 입력 못하게 하기
function donotusekeyboard(event) {
	event.preventDefault();
}

// 옵션 변경값이 다 차야 밑에 최종 주문 옵션이 나옴.
function optionChoice() {
	var payment = $('#product_payment');
	var period = $('#product_borrow_period');
	var start = $('#borrow_start');
	if ((payment.val() != null) && (period.val() != null)
			&& (start.val() != '')) {
		$('#finalOpt').css('display', 'block')
	} else {
		$('#finalOpt').css('display', 'none')
	}
}

// 리뷰 더보기
function showMoreText(obj) {
	var $moreContents = $($(obj).parent()).children().last();// 상세보기창
																// 접어놓은거...
	if ($moreContents.css('display') == 'none') {
		$moreContents.css('display', 'block')
	} else {
		$moreContents.css('display', 'none')
	}
}

// /////////////////////////////////////////////////////////////////
// 상품 재고 가능한지 체크
function availableChk() {
	var str = $("#p_no_label").html();
	var s_date = $('#borrow_start').val();
	var e_date = $('#borrow_end').val();
	console.log(s_date + "," + e_date)
	$.ajax({
		type : "get",
		url : "/bitcamp/availableChk",
		data : {
			"p_no" : str,
			"s_date" : s_date,
			"e_date" : e_date
		},
		success : function(result) {
			console.log(result.productCount)
			$("#limitQuantity").html(result.productCount)
		},
		error : function(e) {
			alert("재고 데이터 선택 실패" + e.responseText);
		}
	});


}
