<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/mypageOrderHistory.css" type = "text/css">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<script>
	$(function(){
		//주문조회 시작일
		var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$('#mypage_orderHistory_start').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd"
		});
		
		//주문조회 종료일
		var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$('#mypage_orderHistory_end').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd"
		});
	});
	
	function lookup(){
		/*if($('#mypage_orderHistory_start').val() != "" && $("#mypage_orderHistory_end").val() == ""){
			alert("종료일을 선택해 주세요.");
			return false;
		}*/
		if($('#mypage_orderHistory_start').val() != "" && $('#mypage_orderHistory_end').val() != ""){
			if($('#mypage_orderHistory_start').val() > $('#mypage_orderHistory_end').val()){
				alert("시작일이 종료일보다 이전 날짜이여야 합니다.");
				$('#mypage_orderHistory_start').val("");
				$('#mypage_orderHistory_start').focus();
				return false;
			}
		}
		var delivery_status = $("#mypage_order_select").val();
		var order_date_start = $("#mypage_orderHistory_start").val();
		var order_date_end = $("#mypage_orderHistory_end").val();
		location.href = "/bitcamp/mypageOrderHistory?delivery_status=" + delivery_status + "&order_date_start=" + 
				order_date_start + "&order_date_end=" + order_date_end;
	}
</script>
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2>주문조회</h2>
	<hr>
	<div class = "mypage_order_main">
		<select class = "mypage_order_select" id = "mypage_order_select">
			<option value = "all" <c:if test = "${delivery_status == 'all'}">selected</c:if>>주문상태 전체</option>
			<option value = "입금대기" <c:if test = "${delivery_status == '입금대기'}">selected</c:if>>입금대기</option>
			<option value = "결제완료" <c:if test = "${delivery_status == '결제완료'}">selected</c:if>>결제완료</option>
			<option value = "배송중" <c:if test = "${delivery_status == '배송중'}">selected</c:if>>배송중</option>
			<option value = "배송완료" <c:if test = "${delivery_status == '배송완료'}">selected</c:if>>배송완료</option>
			<option value = "취소" <c:if test = "${delivery_status == '취소'}">selected</c:if>>취소</option>
			<option value = "반품" <c:if test = "${delivery_status == '반품'}">selected</c:if>>반품</option>
		</select>
		<input id="mypage_orderHistory_start" name="mypage_orderHistory_start" readonly/>
		<input id="mypage_orderHistory_end" name="mypage_orderHistory_end" readonly/>
		<button class = "mypage_order_btn" onclick = "lookup();">조회</button>
	</div>
	<div class = "mypage_order_precautions">
		<ul>
			<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
			<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			<li>취소/반품 신청은 주문완료일 기준 30일까지 가능합니다.</li>
		</ul>
	</div>
	<h6>주문 상품 정보</h6>
	<div class = "mypage_order_product_info">
		<ul class = "mypage_order_product_info_ul">
			<li><div>주문일자</div><div>[주문번호]</div></li>
			<li>이미지</li>
			<li>상품정보</li>
			<li>수량</li>
			<li>상품구매금액</li>
			<li>주문처리상태</li>
			<li>취소/반품</li>
			<c:forEach var = "list" items = "${list}">
				<li>
					<div>${list.order_date}</div>
					<div class = "mypage_ono_div" onclick = "location.href = '/bitcamp/mypageOrderView?o_no=${list.o_no}';">
						<label style = "margin-left : 20px;">[</label><label class = "wordCut">${list.o_no}</label><label>]</label>
					</div>
				</li>
				<li><img src = "/bitcamp/resources/products/${list.p_filename1}" alt = ""></li>
				<li>${list.p_commnet}</li>
				<li>${list.p_count}</li>
				<li>${list.totalprice}원</li>
				<li>${list.delivery_status}</li>
				<li><span class = "mypage_hover">취소</span>/<span class = "mypage_hover">반품</span></li>
			</c:forEach>
		</ul>
		<c:if test = "${list == '[]'}">
			<div class = "mypage_order_nothing">주문 내역이 없습니다.</div>
		</c:if>
	</div>
	<button class = "mypageWishList_main_btn" onclick = "location.href = '/bitcamp/mypage';">MY PAGE</button>
</div>