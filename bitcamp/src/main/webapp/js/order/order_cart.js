$(function() {
	// 결제방식
	$("input:radio[name=addr_paymethod]")
			.change(
					this,
					function() {
						if ($("input:radio[name=addr_paymethod]:checked").val() == "card") {
							$(".payment_card").css('display', 'inline-block')
							$("#btn_payment").css('display', 'none')
						} else if ($("input:radio[name=addr_paymethod]:checked")
								.val() == "cash") {// 무통장 입금
							$(".payment_card").css('display', 'none')
							$("#btn_payment").css('display', 'inline-block')
						}
					})

	// 총 결제 금액 세팅
	var totalOrderPrice = parseInt($("#total_order_price_view").html())// 총 주문금액
	var totalSalePrice = parseInt($("#total_sale_price_view").html())// 총 할인 + 부가결제 금액
	var totalTotal = totalOrderPrice + totalSalePrice// 총 결제 예정 금액
	$("#total_order_sale_price_view").html(totalTotal)
	$("input[name='totalprice']").val(totalTotal)
	// 이메일 도메인 주소 세팅
	$("#oemail3").on('change', function() {
		var domain = $("#oemail3").val();// 도메인 주소
		$("input[name='oemail2']").val(domain)
		if (domain == 'etc') {
			$("input[name='oemail2']").val("")
			$("input[name='oemail2']").focus()
			$("input[name='oemail2']").attr('readonly', false)
		} else {
			$("input[name='oemail2']").attr('readonly', true)
		}
	})

	// 마일리지 세팅
	$("input[name='mileage']").on(
			'change',
			function() {
				if ($("input[name='mileage']").val() == null
						|| $("input[name='mileage']").val() == "") {
					$("input[name='mileage']").val(0)
				}
			})
})

function payment_card() {
	if ($("input[name='oname']").val() == null
			|| $("input[name='oname']").val() == "") {
		$("input[name='oname']").focus()
		return false;
	}
	// 우편번호
	if ($("input[name='ozipcode']").val() == null
			|| $("input[name='ozipcode']").val() == "") {
		$("input[name='ozipcode']").focus()
		return false;
	}
	// 기본주소
	if ($("input[name='oaddr']").val() == null
			|| $("input[name='oaddr']").val() == "") {
		$("input[name='oaddr']").focus()
		return false;
	}
	// 연락처
	if ($("input[name='otel2']").val() == null
			|| $("input[name='otel2']").val() == "") {
		$("input[name='otel2']").focus()
		return false;
	}
	if ($("input[name='otel3']").val() == null
			|| $("input[name='otel3']").val() == "") {
		$("input[name='otel3']").focus()
		return false;
	}
	// 이메일 앞 주소
	if ($("input[name='oemail1']").val() == null
			|| $("input[name='oemail1']").val() == "") {
		$("input[name='oemail1']").focus()
		return false;
	}
	// 이메일 도메인 주소
	if ($("#oemail3").val() == null || $("#oemail3").val() == "") {
		$("#oemail3").focus()
		return false;
	}
	if ($("#oemail3").val() != null || $("#oemail3").val() != "") {
		if ($("input[name='oemail2']").val() == null
				|| $("input[name='oemail2']").val() == "") {
			$("input[name='oemail2']").focus()
			return false;
		}
	}

	// 카드 선택//무통장 선택
	if ($("input:radio[name=addr_paymethod]:checked").val() == "card") {
		if ($("input[id='directpay_card_agree_all']").is(":checked") == false) {
			alert('결제대행서비스 약관에 모두 동의해주세요')
			return false;
		}
		if ($("input[id='directpay_card_agree_financial']").is(":checked") == false) {
			alert('전자금융거래 기본약관에 동의해주세요')
			return false;
		}
		var IMP = window.IMP;
		IMP.init('imp81940054');
		IMP.request_pay({
			pg : 'inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트', // 상품명
			amount : 1004, // 상품 가격 $("input[name='totalprice']").val();
			buyer_email : "",// 이메일
			buyer_name : $("input[name='oname']").val(),// 구매자 이름
			buyer_tel : "",// 구매자 연락처
			goodsname : "주문명:결제테스트(goods)"
		}, function(rsp) {
			if (rsp.success) {
				$("#btn_payment").trigger("click");
				var date = new Date(rsp.paid_at*1000)
				var hours = date.getHours();
				var minutes = "0"+date.getMinutes();
				var seconds = "0"+date.getSeconds();
				var formattedTime = hours+":"+minutes.substr(-2)+":"+seconds.substr(-2);
				var msg = '결제가 완료되었습니다.';
//				msg += '\n고유ID : ' + rsp.imp_uid;
//				msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//				msg += '\n결제 금액 : ' + rsp.paid_amount;
//				msg += '\n카드 승인번호 : ' + rsp.apply_num;
//				msg += '\n주문자 이름 : ' + rsp.buyer_name;
//				msg += '\n주문자 이메일: ' + rsp.buyer_email;
//				msg += '\n주문자 전화번호: ' + rsp.buyer_tel;
//				msg += '\n결제 승인시각: ' + formattedTime;
//				msg += '\n결제 승인시각: ' + rsp.card_name;
				alert(msg);
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});
	} else if ($("input:radio[name=addr_paymethod]:checked").val() == "cash") {// 무통장 입금
		if ($("input[id='depositor']").val() == null
				|| $("input[id='depositor']").val() == "") {
			alert('입금자명을 입력하세요')
			$("input[id='depositor']").focus()
			return false;
		}
		if ($("#bank").val() == -1 || $("#bank").val() == "-1") {
			alert('입금은행을 선택하세요')
			$("#bank").focus()
			return false;
		}

	}
	
}
