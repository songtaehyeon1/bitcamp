$(function() {
	
	$("input[type='file']").change(function(obj){
		var pathpoint = this.value.lastIndexOf('.');
		var filepoint = this.value.substring(pathpoint+1,this.length);
		var	filetype = filepoint.toLowerCase();
		if(filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='jpeg'){
			//정상적인 이미지 확장자
		}else{
			alert('이미지 파일만 선택할 수 있습니다')
			var parent_Obj = obj.parentNode;
			console.log(parent_Obj)
			var node = parent_Obj.replaceChild(obj.cloneNode(true),obj);
			return false;
		}
	})
	
	
	//submit 체크
	$("#productWirte").submit(function(){
		var product_code = $("#p_no").val();//상품코드
		var product_name = $("#p_name").val();//상품명
		var product_price = $("#price").val();//상품명
		var delivery_fee = $("#delivery_fee").val();//배송비
		var file1 = $("#file1").val();//첨부파일1
	
		if(!product_code){
			$("#p_no").focus()
			return false;
		}else if(!product_name){
			alert("상품명을 등록해주셔야 합니다.")
			$("#p_name").focus()
			return false;
		}else if(!product_price){
			alert("상품 2박3일 대여가격을 등록해주셔야 합니다.")
			$("#p_name").focus()
			return false;
		}else if(!delivery_fee||(delivery_fee=='direct')){
			alert("배송비를 입력해주셔야 합니다.")
			$("#delivery_fee").focus()
			return false;
		}else if (!file1) {
			alert("첨부파일을 등록해주셔야 합니다.")
			$("#file1").focus()
			return false;
		}else{
			return true;
		}
	})
	
	CKEDITOR.replace("p_commnet");
	CKEDITOR.config.height = 400;

	// CKEDITOR.instances.content.getData();

	// 배송비 직접 입력창
	$("#delivery_fee").change(function() {
		var fee = $("#delivery_fee").val();
		if (fee == 'direct') {
			$("#delivery_fee_direct").css('display', 'inline-block');
			$("#delivery_fee_direct").focus();
		} else {
			$("#delivery_fee_direct").css('display', 'none')
		}
	})
});


	