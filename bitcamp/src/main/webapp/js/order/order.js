$(function() {
	//총 결제 금액 세팅
	var totalOrderPrice = parseInt($("#total_order_price_view").html())//총 주문 금액
	var totalSalePrice = parseInt($("#total_sale_price_view").html())//총 할인 + 부가결제 금액
	var totalTotal = totalOrderPrice + totalSalePrice//총 결제 예정 금액
	console.log(totalTotal)
	$("#total_order_sale_price_view").html(totalTotal)
	$("input[name='total_price']").val(totalTotal)
	console.log($("input[name='total_price']").val())
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
	
	//마일리지 세팅
	$("input[name='mileage']").on('change',function(){
		if($("input[name='mileage']").val()==null||$("input[name='mileage']").val()==""){
			$("input[name='mileage']").val(0)
		}
	})
	
	
	//주문정보 입력 안했을 시
	$("input[id='btn_payment']").on('click',function(){
		alert($("input[name='total_price']").val())
		//주문자 이름
		if($("input[name='oname']").val()==null||$("input[name='oname']").val()==""){
			$("input[name='oname']").focus()
			return false;
		}
		//우편번호
		if($("input[name='ozipcode']").val()==null||$("input[name='ozipcode']").val()==""){
			$("input[name='ozipcode']").focus()
			return false;
		}
		//기본주소
		if($("input[name='oaddr']").val()==null||$("input[name='oaddr']").val()==""){
			$("input[name='oaddr']").focus()
			return false;
		}
		//연락처
		if($("input[name='otel2']").val()==null||$("input[name='otel2']").val()==""){
			$("input[name='otel2']").focus()
			return false;
		}
		if($("input[name='otel3']").val()==null||$("input[name='otel3']").val()==""){
			$("input[name='otel3']").focus()
			return false;
		}
		//이메일 앞 주소
		if($("input[name='oemail1']").val()==null||$("input[name='oemail1']").val()==""){
			$("input[name='oemail1']").focus()
			return false;
		}
		//이메일 도메인 주소
		if($("#oemail3").val()==null||$("#oemail3").val()==""){
			$("#oemail3").focus()
			return false;
		}
		if($("#oemail3").val()!=null||$("#oemail3").val()!=""){
			if($("input[name='oemail2']").val()==null||$("input[name='oemail2']").val()==""){
				$("input[name='oemail2']").focus()
				return false;
			}
		}
		
		//카드 선택
		if($("input:radio[name=addr_paymethod]:checked").val()=="card"){
			if($("#card_corp").val()==null||$("#card_corp").val()==""){
				$("#card_corp").focus()
				alert('카드를 선택해주세요')
				return false;
			}
			if($("input[id='directpay_card_agree_all']").is(":checked")==false){
				alert('결제대행서비스 약관에 모두 동의해주세요')
				return false;
			}
			if($("input[id='directpay_card_agree_financial']").is(":checked")==false){
				alert('전자금융거래 기본약관에 동의해주세요')
				return false;
			}
		}else if($("input:radio[name=addr_paymethod]:checked").val()=="cash"){//무통장 입금
			if($("input[id='depositor']").val()==null||$("input[id='depositor']").val()==""){
				alert('입금자명을 입력하세요')
				$("input[id='depositor']").focus()
				return false;
			}
			if($("#bank").val()==-1||$("#bank").val()=="-1"){
				alert('입금은행을 선택하세요')
				$("#bank").focus()
				return false;
			}
		
		}
		
	})//주문정보 입력 끝
	
	
	
	
})

	










