<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product/product_cart.css" />
<script src="<%=request.getContextPath()%>/js/product/product_cart.js"></script>

<c:if test="${logStatus=='Y' }">

<form method="post">
	<div class="container" style="margin-top: 150px">
		<table class="cartTable">
			<caption class="visualNone">장바구니</caption>
			<colgroup>
				<col width="50">
				<col width="150">
				<col width="*">
				<col width="150">
				<col width="150">
			</colgroup>
			<thead>
				<tr>
					<td colspan="10">
					
						<h2>장바구니 제품</h2>
					</td>
				</tr>
				<tr class="head">
					<th scope="col">
<c:if test="${fn:length(productList)!=0 }">
						<label>
							<input type="checkbox"	style="margin-left: 15px" id="allCheck" class="allCheck">
							<span style="display: none">전체선택</span>
						</label>
</c:if>						
					</th>
					<th scope="colgroup" colspan="2">상품정보</th>
					<th scope="col">상품금액</th>
					<th scope="col">배송비</th>
				</tr>
			</thead>
	
			<script>
				var list = new Array();
				<c:forEach var="item" items="${productList}">
				list.push("${item.delivery_fee}")
				</c:forEach>
				$(function() {
					var fees = document.getElementsByClassName("deliveryFeeChk")
					for (var i = 0; i < list.length; i++) {
						if (fees[i].innerText == '0원') {
							fees[i].innerText = "방문수령"
						}
					}
				})
			</script>
			<!-- ////////////////////////////////반복될 부분///////////////////////////////////////////// -->

			<c:forEach var="cart" items="${productList}" varStatus="vs">
				<tbody class="tbody">
					<tr>
<input class="cartItems" type="hidden" name="p_no" value="${cart.p_no }">
<input class="cartItems" type="hidden" name="p_name" value="${cart.p_name }">
<input class="cartItems" type="hidden" name="orderStart" value="${cart.orderStart }">
<input class="cartItems" type="hidden" name="orderEnd" value="${cart.orderEnd}" >
<input class="cartItems" type="hidden" name="borrowPeriod" value="${cart.period}">
<input class="cartItems" type="hidden" name="filename" value="${cart.p_filename1}">
<input class="cartItems" type="hidden" name="price" value="${cart.price}" >
<input class="cartItems" type="hidden" name="delivery_fee" value="${cart.delivery_fee}" >
<input class="cartItems" type="hidden" name="limitQuantity" value="${cart.limitQuantity}" >
						<td><input type="checkbox" class="checkBox" name="checkBox"
							style="margin-left: 15px"></td>
						<td>
							<a href="/bitcamp/productView?p_no=${cart.p_no }"> 
								<img src="/bitcamp/upload/${cart.p_filename1 }" width="78" height="78" onerror="this.src='/bitcamp/resources/products/tent1.png'">
							</a>
						</td>
						<td>
							<div>
								<label id="curNum" class="curNum" style="display:none">${vs.index}</label><a
									href="/bitcamp/productView?p_no=${cart.p_no }">${cart.p_name }</a>
							</div>
							<div>
								<div>
									<div>
										<span style="display: inline-block;"> <label id="period">${cart.period}</label></span>
									</div>
									<span>제품 가격:<label class="cart_price">${cart.price }</label>원</span> 
									<div class="row quantity_wrap">
										<span class="quantity_span">수량</span>
										<button class="btn minus productQty" type="button" onclick="qtyChange(this)"><i class="icon-minus"></i></button>
										<input type="text" name="quantity" class="currentQty cartItems input_noclick transparent" value="${cart.currentQty }">
										<button class="btn plus productQty" type="button" onclick="qtyChange(this)"><i class="icon-plus" ></i></button>
										<a href="/bitcamp/deleteCart?p_no=${cart.p_no }" style="text-decoration:none">
											<img id="xBtn" src="/bitcamp/resources/products/xBtn.png">
										</a>
										<em style="display:none" class="limitQuantity_em">최대 대여 가능 갯수:
										<label class="limitQuantity">${cart.limitQuantity }</label>
									</em>
									</div>
									
									
								</div>
							</div>
							<div>
							</div>
						</td>
						<td>
							<div>
								<label>${cart.price }</label>원
							</div>
						</td>
						<td><span class="deliveryFeeChk">${cart.delivery_fee }원</span>
						<span id="cart_deliveryFee" style="display: none">${cart.delivery_fee }</span>
						</td>
					</tr>
					<tr class="summary">
						<td colspan="10">상품가격 <span class="cart_qtyprice">${cart.price*cart.currentQty}</span>원 배송비 <span class="cart_deliverfee">${cart.delivery_fee*cart.currentQty }</span>원
							= 주문금액<span class="cart_eachPrice">${cart.price*cart.currentQty+cart.delivery_fee*cart.currentQty }</span>원
						</td>
					</tr>
				</tbody>
				

			</c:forEach>
<script>

	$(document).ready(function() {
		$(".cartItems").attr('disabled',true);
	});
	
	//체크한거만 값 가져갈 수 있게 disabled 하는중....
	$(document).on('click','input[name="checkBox"]',function(){
		if ($(this).prop("checked")){
			var body = $(this).parent().parent();//선택한것의 상위 객체...
			body.find('.cartItems').attr('disabled',false);
		}else{
			var body = $(this).parent().parent();//선택한것의 상위 객체...
			body.find('.cartItems').attr('disabled',true);
		}
	})

</script>			
			<!-- ///////////////////////////////////////////////////////////////////////////// -->
	
	
		</table>
<c:if test="${fn:length(productList)==0 }">
		<div style="margin-top:50px;text-align:center;font-weight:700;color:#55575f;font-size:14px">장바구니에 담은 제품이 없습니다.</div>
</c:if>			
	</div>
<c:if test="${fn:length(productList)>0 }">

	<!-- 총 금액 -->
	<div class="total container">
		<script>//스크립트가...개지저분.......그때그때 추가하면서 사용했더니 알아보기 힘들다. //#수량 #수량변경
			//개별 버튼 클릭시
			$(document).on('click', 'input[name="checkBox"]', function() {
				if ($(this).prop("checked")) {
					var body = $(this).parents(".tbody");//tbody 테이블 바디
					var indexNum = body.find('#curNum').html(); //선택된것의 index번호.
					var qty = body.find(".currentQty").val();//선택된 갯수

					var priceList = new Array();
					var deliverList = new Array();
					<c:forEach var="price" items="${productList}">
					priceList.push("${price.price}")
					deliverList.push("${price.delivery_fee}")
					</c:forEach>
					var price = parseInt($(".TPrice").html());
					var deliver = parseInt($(".deliFee").html());
					price += parseInt(priceList[indexNum])*qty
					deliver += parseInt(deliverList[indexNum])*qty
					$(".TPrice").html(price)
					$(".deliFee").html(deliver)
					$(".TTFee").html(price+deliver)
					//선택된 상태에서 갯수 변경시...
					body.find(".productQty").click(this,function(){
						var tbody = $(this).parents(".tbody");//현재 버튼을 감싸고 있는 table tbody
						var qty = tbody.find('.currentQty').val();//변경된 갯수
						var price = tbody.find(".cart_price").html() //제품 가격
						var qtyprice = tbody.find(".cart_qtyprice").html() //제품 가격
						var deliverfee = tbody.find(".cart_deliverfee").html() //제품 배송비
						var str="";
						var delivery="";
						$("input[name=checkBox]:checked").each(function(){
							str += $(this).parents('.tbody').find('.cart_qtyprice').html()+",";
							delivery +=$(this).parents('.tbody').find('.cart_deliverfee').html()+",";
						})
						strsplit= str.split(',');
						delisplit = delivery.split(',');
						
						var str_array=0;
						var deli_array=0;
						for(var i =0;i<strsplit.length-1;i++){
							str_array+= parseInt(strsplit[i])
							deli_array+= parseInt(delisplit[i])
						}
						$(".TPrice").html(str_array)
						$(".deliFee").html(deli_array)
						$(".TTFee").html(str_array+deli_array)
					})
				} else if ($(this).prop("checked", false)) {
					var body = $(this).parent().parent();//선택한것의 상위 객체...
					var indexNum = body.find('#curNum').html(); //선택 해제된것의 index번호.
					var qty = body.find(".currentQty").val();
					var priceList = new Array();
					<c:forEach var="price" items="${productList}">
					priceList.push("${price.price}")
					</c:forEach>
					var price = parseInt($(".TPrice").html());
					price -= parseInt(priceList[indexNum])*qty
					$(".TPrice").html(price)
	
					var deliFeeList = new Array();
					<c:forEach var="delivery" items="${productList}">
					deliFeeList.push("${delivery.delivery_fee}")
					</c:forEach>
					var deliFee = parseInt($(".deliFee").html());
					deliFee -= parseInt(deliFeeList[indexNum])*qty
					$(".deliFee").html(deliFee)
					$(".TTFee").html(price + deliFee)
				}
			})
	
			//전체선택버튼 클릭시
			$('.allCheck').click(this,function(){
				if($(this).prop('checked')){
					$("input[name='checkBox']:checked").attr('disabled',false)
					$(".cartItems").attr('disabled',false);
				}else if($(this).prop('checked',false)){
					$(".cartItems").attr('disabled',true);
				}
			})
			
			//전체선택 버튼 값 변경시
			$('.allCheck').change(this, function() {
				var length = $("input[name='checkBox']:checked").length;//체크된거의 길이.
				var qtyList = new Array();
				qtyList = $("input[name='checkBox']:checked");
				var deliFeeList = new Array();
				<c:forEach var="delivery" items="${productList}">
				deliFeeList.push("${delivery.delivery_fee}")
				</c:forEach>
				if (length == deliFeeList.length) {
					var deliFee = 0;
					for (var i = 0; i < deliFeeList.length; i++) {
						deliFee += parseInt(deliFeeList[i])*$(qtyList[i]).parents('.tbody').find('.currentQty').val()
						console.log($(qtyList[i]).parents('.tbody').find('.currentQty').val())
						console.log("전체 가격"+deliFee)
					}
					$(".deliFee").html(deliFee);
					$(".TTFee").html(price + deliFee)
				}
				if (length == 0) {
					$(".deliFee").html(0);
					$(".TTFee").html(price + deliFee)
				}
				//전체 선택 상황에서 갯수 변경시 qtyList에 qty값을 제셋팅해줘야함// #전체 선택 #전체선택 #전체선택 상황에서 갯수 변경
				if($('.productQty').click(this,function(){
					var tbody = $(this).parents(".tbody");//현재 버튼을 감싸고 있는 table tbody
					var qty = tbody.find('.currentQty').val();//변경된 갯수
					var price = tbody.find(".cart_price").html() //제품 가격
					var qtyprice = tbody.find(".cart_qtyprice").html() //제품 가격
					var deliverfee = tbody.find(".cart_deliverfee").html() //제품 배송비
					var str="";
					var delivery="";
					$("input[name=checkBox]:checked").each(function(){
						str += $(this).parents('.tbody').find('.cart_qtyprice').html()+",";
						delivery +=$(this).parents('.tbody').find('.cart_deliverfee').html()+",";
					})
					strsplit= str.split(',');
					delisplit = delivery.split(',');
					
					var str_array=0;
					var deli_array=0;
					for(var i =0;i<strsplit.length-1;i++){
						str_array+= parseInt(strsplit[i])
						deli_array+= parseInt(delisplit[i])
					}
					$(".TPrice").html(str_array)
					$(".deliFee").html(deli_array)
					$(".TTFee").html(str_array+deli_array)				
				}))
				var priceList = new Array();
				<c:forEach var="price" items="${productList}">
				priceList.push("${price.price}")
				</c:forEach>
				//전체 다 체크 돼었을때
				if (length == priceList.length) {
					var price = 0;
					for (var i = 0; i < priceList.length; i++) {
						price += parseInt(priceList[i])*$(qtyList[i]).parents('.tbody').find('.currentQty').val()
					}
					$(".TPrice").html(price);
					$(".TTFee").html(price + deliFee)
				}
				//전체 해제되어서 체크된게 없을 때
				if (length == 0) {
					$(".TPrice").html(0);
					$(".TTFee").html(price + deliFee)
				}
			})
		</script>
		
		<span>총 상품가격<label class="TPrice">0</label>원
		</span> + <span>총 배송비<label class="deliFee">0원</label></span> = <span>총
			주문금액<label class="TTFee">0</label>원
		</span>
	
	</div>
</c:if>	
	<c:if test="${fn:length(productList)>0 }">		
	<!-- 계속쇼핑하기/ 바로 구매하기 버튼들 -->
	<div class="container" style="text-align: center; margin-top: 100px;">
	
		<!-- 계속 쇼핑하기 버튼 -->
		<a href="/bitcamp/list?c_no=0" class="shopAndPurchaseBtn"
			style="margin-right: 2%;text-decoration:none" >계속 쇼핑하기</a>
		<!-- 주문하기 버튼 -->
		<input type="submit" id="cart_order" style="display:none;"  formaction="/bitcamp/cartOrder">
		<a class="shopAndPurchaseBtn" >
			<label for="cart_order" style="width: 100%;cursor: pointer;">구매하기</label>
		</a>
		
	</div>
	</c:if>
</form>
</c:if>
<c:if test="${logStatus=='N' }">

<style>
a{text-decoration:none;}
a:hover{text-decoration:none;} 
.container{
	width:500px;
	background-color:#fff;
	border:1px solid #DDD;
	padding:50px;
	margin-top:10%;
}
.container>h2{
	text-align:center;
	margin-bottom:50px;
}
.btn{
	width:400px;
	margin:20px 0;
}
.info>span{
	float:right;
	
}
.info span, .info span a{
	color: #757575;
}
</style>

<script>
$(function(){
	$("#logFrm").submit(function(){
		//이메일(아이디) 검사
		if($("#userid").val()==""){     
			alert("아이디를 입력해주세요.");
			return false;
		}	
		//비밀번호 검사
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		return true;
	});
	//////////////////////////////////////////////////
	
	//쿠키저장(setCookie)
	//                 쿠키이름, 쿠키에 넣을 값, 만료일(일 단위)
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	   
	//쿠키 삭제(cookieName)
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	   
	//쿠키 불러오기(getCookie)
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	//아이디 저장
	//저장된 쿠기값을 가져와서 ID 입력 칸에 넣어준다.
  	// var userInputId = getCookie("id_cookie");  
    $("#userid").val(getCookie("id_cookie")); 
     
    if($("#userid").val() != ""){  //이전에 이미 ID 저장하기를 해서 처음 페이지 로딩 시, ID 입력 칸에 출력된 ID가 있는 상태라면
    	$("#saveId").attr("checked", true);  //ID 저장하기를 체크 상태로 두기
    }
     
    $("#saveId").change(function(){  // 체크박스에 변화가 발생시
        if($("#saveId").is(":checked")){  // ID 저장하기 체크했을 때,
            // var userInputId = $("#userid").val();
            setCookie("id_cookie", $("#userid").val(), 7);  // 7일 동안 쿠키 보관
        }else{  // ID 저장하기 체크 해제 시,
            deleteCookie("id_cookie");
        }
    });
     
    //  ID 저장하기가 이미 체크되어 입력칸에 아이디가 출력되어 있는 상태에서 새로 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userid").keyup(function(){  // ID 입력 칸에 ID를 입력할 때,
        if($("#saveId").is(":checked")){  // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#userid").val();
            setCookie("id_cookie", userInputId, 7); // 7일 동안 쿠키 보관
        }
    }); 
});	
</script>

<div class="container">
	<h2>LOGIN</h2>
	<form id="logFrm" method="post" action="/bitcamp/loginOk">
		<div class="form-group">
			<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요" autofocus/>
		</div>
		<div class="form-group">
      		<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="비밀번호를 입력해주세요"/>
      	</div>
      	<button type="submit" class="btn btn-secondary" style="background-color:black">로그인</button>
  	</form>
  	
  	<div class="info">
  		<input type="checkbox" id="saveId" name="saveId" value="saveId"/>&nbsp;아이디 저장
  		<span>
  			<a href="/bitcamp/contFindFrm">아이디/비밀번호 찾기</a> 
  			&#124;
  			<a href="/bitcamp/joinFrm">회원가입</a>
  		</span>
  	</div>
</div>


</c:if>