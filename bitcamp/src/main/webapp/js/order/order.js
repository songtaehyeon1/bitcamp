//window.addEventListener( "pageshow", function ( event ) {
//  var historyTraversal = event.persisted || 
//                         ( typeof window.performance != "undefined" && 
//                              window.performance.navigation.type === 2 );
//  if ( historyTraversal ) {
//    // Handle page restore.
//	  history.go(1);
//  }
//});

$(function() {
	//회원 이메일
	var id = $("#memberinfo_usermail").html().split('@');
	$("input[name=oemail1]").val(id[0])
	$("input[name=oemail2]").val(id[1])
	
	
	//이메일 도메인 주소 세팅
	$("#oemail3").on('change',function(){
		var domain = $("#oemail3").val();//도메인 주소
		$("input[name='oemail2']").val(domain)
		if(domain=='etc'){
			$("input[name='oemail2']").val("")
			$("input[name='oemail2']").focus()
			$("input[name='oemail2']").attr('readonly',false)
		}else{
			$("input[name='oemail2']").attr('readonly',true)
		}
	})
	
})

function nonMemberPay() {
	if ($("input[name='opassword']").val() == null
			|| $("input[name='opassword']").val() == "") {
		$("input[name='opassword']").focus()
		return false;
	}
	if ($("input[id='order_password_confirm']").val() == null
			|| $("input[id='order_password_confirm']").val() == "") {
		$("input[id='order_password_confirm']").focus()
		return false;
	}
	if ($("input[id='opassword']").val() != $("input[id='order_password_confirm']").val()) {
		$("input[id='order_password_confirm']").focus()
		alert('주문조회 비밀번호를 다시 한번 확인해주세요')
		return false;
	}
	payment_card();
}

function payment_card() {
	//주문자 이름
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
		if ($("input[name='oemail2']").val() == null|| $("input[name='oemail2']").val() == "") {
			$("#oemail3").focus()
			return false;			
		}
	}
	if ($("#oemail3").val() != null || $("#oemail3").val() != "") {
		if ($("input[name='oemail2']").val() == null
				|| $("input[name='oemail2']").val() == "") {
			$("input[name='oemail2']").focus()
			return false;
		}
	}
	//////배송정보
	//받는분 이름
	if ($("input[name='rname']").val() == null
			|| $("input[name='rname']").val() == "") {
		$("input[name='rname']").focus()
		return false;
	}
	// 우편번호
	if ($("input[name='rzipcode']").val() == null
			|| $("input[name='rzipcode']").val() == "") {
		$("input[name='rzipcode']").focus()
		return false;
	}
	// 기본주소
	if ($("input[name='raddr']").val() == null
			|| $("input[name='raddr']").val() == "") {
		$("input[name='raddr']").focus()
		return false;
	}
	// 연락처
	if ($("input[name='rtel2']").val() == null
			|| $("input[name='rtel2']").val() == "") {
		$("input[name='rtel2']").focus()
		return false;
	}
	if ($("input[name='rtel3']").val() == null
			|| $("input[name='rtel3']").val() == "") {
		$("input[name='rtel3']").focus()
		return false;
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
			name : $("input[name=p_name]").val(), // 상품명
			amount : 1004, // 상품 가격 $("input[name='totalprice']").val();
			buyer_email : $("input[name='oemail1']").val()+"@"+$("input[name=oemail2]").val(),// 이메일
			buyer_name : $("input[name='oname']").val(),// 구매자 이름
			buyer_tel : $("#otel1").val()+"-"+$("#otel2").val()+"-"+$("#otel3").val(),// 구매자 연락처
		}, function(rsp) {
			var date = new Date(rsp.paid_at*1000)
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			var day = date.getDate();
			var hours = date.getHours();
			var minutes = "0"+date.getMinutes();
			var seconds = "0"+date.getSeconds();
			var formattedTime = 
				year+"-"+month+"-"+day+"/"+
				hours+":"+minutes.substr(-2)+":"+seconds.substr(-2);
			if (rsp.success) {
				$("input[name=imp_uid]").val(rsp.imp_uid)	
				$("input[name=merchant_uid]").val(rsp.merchant_uid)	
				$("input[name=apply_num]").val(rsp.apply_num)	
				$("input[name=buyer_name]").val(rsp.buyer_name)	
				$("input[name=buyer_email]").val(rsp.buyer_email)	
				$("input[name=buyer_tel]").val(rsp.buyer_tel)	
				$("input[name=formattedTime]").val(formattedTime)
				$("input[name=card_name]").val(rsp.card_name)	
				$("input[name=paid_amount]").val(rsp.paid_amount)	
				$("#btn_payment").trigger("click");
			
				var msg = '결제가 완료되었습니다.';
//				msg += '\n고유ID : ' + rsp.imp_uid;
//				msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//				msg += '\n결제 금액 : ' + rsp.paid_amount;
//				msg += '\n카드 승인번호 : ' + rsp.apply_num;
//				msg += '\n주문자 이름 : ' + rsp.buyer_name;
//				msg += '\n주문자 이메일: ' + rsp.buyer_email;
//				msg += '\n주문자 전화번호: ' + rsp.buyer_tel;
//				msg += '\n결제 승인시각: ' + formattedTime;
//				msg += '\n결제 결제카드: ' + rsp.card_name;
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
		}else if ($("#bank").val() == -1 || $("#bank").val() == "-1") {
			alert('입금은행을 선택하세요')
			$("#bank").focus()
			return false;
		}else{
			$("#btn_payment").trigger("click");
		}

	}
	
}









