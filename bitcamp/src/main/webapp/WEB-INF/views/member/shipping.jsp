<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/shipping.css" type = "text/css">
<script>
	$(function(){
		// 모두 선택했을 시
		$("#shipping_check_all").change(function(){
			if($("#shipping_check_all").prop("checked")){
				$("#shipping_main input:checkbox").prop("checked", true);
			}else{
				$("#shipping_main input:checkbox").prop("checked", false);
			}
		});
		
		// 하나하나 다 선택했을 시
		$(".shipping_check").click(function(){
			if($("input[name='shipping_checkbox']:checked").length == 10){
				$("#shipping_check_all").prop("checked", true);
			}else{
				$("#shipping_check_all").prop("checked", false);
			}
		});
	});
	
	function shippingWrite(){
		if($("input[name='shipping_checkbox']").length >= 10){
			alert("10개 가지만 등록할 수 있습니다.");
			return false;
		}
		location.href = '/bitcamp/shipping_writeForm';
	}
	
	function shippingDelete(){
		if($("input[name='shipping_checkbox']").length == 0){
			alert("삭제할 주소록이 없습니다.");
			return false;
		}
		if($("input[name='shipping_checkbox']:checked").length <= 0){
			alert("삭제할 주소록을 선택해 주세요.");
			return false;
		}
		// 체크박스 value들 가져오기
		$("input[name='shipping_checkbox']:checked").each(function(){
			//alert($(this).val());
			$.ajax({
				url : "/bitcamp/shipping_delete",
				data : "rno=" + $(this).val(),
				success : function(result){
					location.reload();
				}, error : function(e){
					console.log(e.responseText);
				}
			});
		});
		alert("삭제되었습니다.");
	}
</script>
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2 style = "font-weight : bold;">배송 주소록 관리</h2>
	<hr>
	<div id = "shipping_main">
		<ul>
			<li><input type = "checkbox" id = "shipping_check_all"></li>
			<li>주소록 선택</li>
			<li>수령인</li>
			<li>전화번호</li>
			<li>주소</li>
			<li>수정</li>
			<c:forEach var = "vo" items = "${list}">
				<li><input type = "checkbox" class = "shipping_check" name = "shipping_checkbox" value = "${vo.rno}"></li>
				<li>
					<c:if test = "${vo.rcheck == 1}">
						<button class = "shipping_selectedBtn" onclick = "alert('이미 선택되어 있습니다.');">고정</button>
					</c:if>
					<c:if test = "${vo.rcheck == 0}">
						<button class = "shipping_selectBtn" onclick = "alert('선택되었습니다.'); location.href = '/bitcamp/shipping_select?rno=${vo.rno}';">선택</button>
					</c:if>
				</li>
				<li>${vo.rname}</li>
				<li>${vo.rtel}</li>
				<li>${vo.raddr}</li>
				<li><button class = "shipping_updateBtn" onclick = "location.href = '/bitcamp/shippingEditForm?rno=${vo.rno}';">수정</button></li>
			</c:forEach>
			<c:if test = "${list == '[]'}">
				<div id = "nothing_shipping">등록된 주소록이 없습니다.</div>
			</c:if>
		</ul>
	</div>
	<div class = "shipping_in_de">
		<div class = "shipping_div"><button class = "shipping_delete_btn" onclick = "shippingDelete();">선택 주소록 삭제</button></div>
		<div class = "shipping_div"><button class = "shipping_insert_btn" onclick = "shippingWrite();">배송지등록</button></div>
	</div>
	<div class = "shipping_precaution_div">
		<div class = "shipping_precaution_top">배송주소록 유의사항</div>
		<div>
			<ul>
				<li>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않은 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
				<li>자동 업데이트를 원하지 않을 경우 주소록 선택을 하시면 됩니다.</li>
				<li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
			</ul>
		</div>
	</div>
</div>