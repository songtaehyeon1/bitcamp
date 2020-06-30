
$(function(){
	//주문수량 조정
	$('.productQty').click(this,function(){
		var currentQty = parseInt($(this).parents('.quantity_wrap').find('.currentQty').val());//현재 주문 수량
		$(this).parents('.quantity_wrap').css('border-bottom','1px solid rgba(0, 0, 0, .1)');
		if($(this).hasClass("plus")){
			var limitQuantity = parseInt($(this).parents('.tbody').find('.limitQuantity').html());
			if(currentQty<limitQuantity){
				var plus = currentQty+1;
				$(this).parents('.quantity_wrap').find('.currentQty').attr('value',plus)
				$(this).parents('.tbody').find('.limitQuantity_em').css('display','none')
			}
			if(currentQty>=limitQuantity){
				$(this).parents('.quantity_wrap').css('border-bottom','1px solid red');
				$(this).parents('.quantity_wrap').find('.currentQty').attr('value',plus)
				$(this).parents('.tbody').find('.limitQuantity_em').css('display','inline-block')
				return false;
			}
		}
		if($(this).hasClass("minus")){
			if(currentQty>1){
				var minus = currentQty-1;
				$(this).parents('.quantity_wrap').find('.currentQty').attr('value',minus)
				$(this).parents('.tbody').find('.limitQuantity_em').css('display','none')
			}
		}
		var tbody = $(this).parents(".tbody");//현재 버튼을 감싸고 있는 table tbody
		var qty = tbody.find('.currentQty').val();//변경된 갯수
		var price = tbody.find(".cart_price").html() //제품 가격
		var deliveryfee = tbody.find("#cart_deliveryFee").html()//배송비
		console.log(tbody.find('.currentQty').val()+".."+price+".."+deliveryfee)
		var priceqty = price*qty
		var deliFee = deliveryfee*qty
		tbody.find(".cart_qtyprice").html(priceqty)//가격*수량
		tbody.find(".cart_deliverfee").html(deliFee)//가격*수량
		
	})
	
	//inputbox에 클릭이나 커서표시가 안되게 하기
	$('.input_noclick').click(this,function(event){
		event.preventDefault();
	})
	$('.input_noclick').focus(this,function(){
		this.blur();
	})
	
	//전체 선택시 모든 객체 선택
	$('.allCheck').click(this,function(){
		if($(".allCheck").prop("checked")){
			$("input[name='checkBox']").prop('checked',true);
		}else{
			$("input[name='checkBox']").prop('checked',false);
		}
	});
	
	
	$(document).on('click','input[name="checkBox"]',function(){
		var length = $("input[name='checkBox']").length//전체 체크박스 갯수
		var checkedLength = $("input[name='checkBox']:checked").length;//체크된거의 갯수
		
		if(length>0&&length==checkedLength){
			$("input[name='checkBox']").prop('checked',true);
			$("input[id='allCheck']").prop('checked',true);
		}else{
			$("input[id='allCheck']").prop('checked',false);
		}
	})
	
	//체크박스가 하나도 체크 안돼었을때
	$("#cart_order").on('click',function(){
		var checkedLength = $("input[name='checkBox']:checked").length;//체크된거의 갯수
		if(checkedLength<1){
			alert("1개 이상의 제품을 선택하세요")
			return false;
		}
	})
})

function qtyChange(val){
	var tbody = $(val).parents(".tbody");//현재 버튼을 감싸고 있는 table tbody
	var price = tbody.find(".cart_price").html() //제품 가격
	var deliveryfee = tbody.find("#cart_deliveryFee").html()//배송비
	var qty = tbody.find('.currentQty').val()//바뀌기 이전의 수량

}
	















	