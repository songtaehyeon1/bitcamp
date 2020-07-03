<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/shippingEditForm.css" type = "text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		var reg;
		$("#shipping_edit").submit(function(){
			var rname = $("#rname").val();
			reg = /^[가-힣]{2,5}$/;
			if(!reg.test(rname)){
				alert("이름을 다시 입력해 주세요.");
				$("#rname").focus();
				return false;
			}
			if($("#userzipcode").val().trim() == ""){
				alert("우편번호를 선택해 주세요.");
				return false;
			}
			var tel2 = $("#tel2").val();
			reg = /^[0-9]{4}$/;
			if(!reg.test(tel2)){
				alert("전화번호를 다시 입력해 주세요.");
				$("#tel2").focus();
				return false;
			}
			var tel3 = $("#tel3").val();
			reg = /^[0-9]{4}$/;
			if(!reg.test(tel3)){
				alert("전화번호를 다시 입력해 주세요.");
				$("#tel3").focus();
				return false;
			}
			alert("수정되었습니다.");
		});
	});
	
	//우편번호 서비스
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#userzipcode").val(data.zonecode);
				jQuery("#useraddr").val(data.address);
				jQuery("#useraddrdetail").focus();
			}
		}).open();
	}
</script>
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2 style = "font-weight : bold;">배송 주소록 관리</h2>
	<hr>
	<form method = "post" action = "/bitcamp/shippingEdit" id = "shipping_edit">
		<div id = "shipping_edit_div">
			<ul>
				<li>수령인</li>
				<li><input type = "text" id = "rname" name = "rname" maxlength = "4" value = "${vo.rname}"></li>
				<li>주소</li>
				<li id = "shipping_address">
					<div class="form-group input-group" id = "shipping_address_div">
						<input type="text" class="form-control" id="userzipcode" placeholder="우편번호" name="rzipcode" readonly value = "${vo.rzipcode}">
						<div><button class="searchAddr" type="button" onclick="openDaumZipAddress();">우편번호 검색</button></div>
					</div>
					<div class = "shipping_addrdetail">
						<input type="text" class="form-control" id="useraddr" placeholder="주소" name="raddr" readonly value = "${vo.raddr}">
						<input type="text" class="form-control" id="useraddrdetail" placeholder="상세주소" name="raddrdetail" value = "${vo.raddrdetail}">
					</div>
				</li>
				<li>전화번호</li>
				<li id = "shipping_tel">
					<select name = "tel1">
						<option value = "010" <c:if test = "${vo.tel1 == 010}">selected</c:if>>010</option>
						<option value = "011" <c:if test = "${vo.tel1 == 011}">selected</c:if>>011</option>
						<option value = "016" <c:if test = "${vo.tel1 == 016}">selected</c:if>>016</option>
						<option value = "017" <c:if test = "${vo.tel1 == 017}">selected</c:if>>017</option>
						<option value = "018" <c:if test = "${vo.tel1 == 018}">selected</c:if>>018</option>
						<option value = "019" <c:if test = "${vo.tel1 == 019}">selected</c:if>>019</option>
					</select> - 
					<input type = "text" id = "tel2" name = "tel2" maxlength = "4" value = "${vo.tel2}"> - 
					<input type = "text" id = "tel3" name = "tel3" maxlength = "4" value = "${vo.tel3}">
				</li>
			</ul>
		</div>
		<div id = "shipping_btn">
			<input type = "submit" class = "edit_btn" value = "수정">
			<input type = "reset" class = "cancle_btn" value = "취소" onclick = "history.back();">
		</div>
		<input type = "hidden" name = "userno" value = "${userno}">
		<input type = "hidden" name = "rno" value = "${vo.rno}">
	</form>
</div>