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
				<li><img src = "/bitcamp/upload/${list.p_filename1}" alt = "" class = "mypageOHImg"></li>
				<li>${list.p_commnet}</li>
				<li>${list.p_count}</li>
				<li>${list.totalprice}원</li>
				<li>${list.delivery_status}</li>
				<li>
					<c:if test = "${list.delivery_status == '입금대기'}">
						<span class = "mypage_hover" onclick = "if(confirm('취소요청 하시겠습니까?')){location.href = '/bitcamp/mypageOrderCancle?o_no=${list.o_no}&str=orderCancle';}">취소</span>
					</c:if>
					<c:if test = "${list.delivery_status == '결제완료'}">
						<span class = "mypage_hover" onclick = "if(confirm('취소요청 하시겠습니까?')){location.href = '/bitcamp/mypageOrderCancle?o_no=${list.o_no}&str=orderCancle';}">취소</span>
					</c:if>
					<c:if test = "${list.delivery_status == '배송중'}">
						<span class = "mypage_hover" onclick = "if(confirm('반품요청 하시겠습니까?')){location.href = '/bitcamp/mypageOrderCancle?o_no=${list.o_no}&str=orderReturn';}">반품</span>
					</c:if>
					<c:if test = "${list.delivery_status == '배송완료'}">
						<span class = "mypage_hover" onclick = "if(confirm('반품요청 하시겠습니까?')){location.href = '/bitcamp/mypageOrderCancle?o_no=${list.o_no}&str=orderReturn';}">반품</span>
					</c:if>
					<c:if test = "${list.delivery_status == '취소요청' || list.delivery_status == '반품요청'}">
						<span>${list.delivery_status}중 입니다.</span>
					</c:if>
					<c:if test = "${list.delivery_status == '취소'}">
						<span>${list.delivery_status}가 되었습니다.</span>
					</c:if>
					<c:if test = "${list.delivery_status == '반품'}">
						<span>${list.delivery_status}이 되었습니다.</span>
					</c:if>
				</li>
			</c:forEach>
		</ul>
		<c:if test = "${list == '[]'}">
			<div class = "mypage_order_nothing">주문 내역이 없습니다.</div>
		</c:if>
	</div>
	<div style = "width : 1250px; height : 20px; float : left;"></div>
	<div style="width : 1250px; clear : left;">
		<ul class="pagination justify-content-center">
			<c:if test = "${pagevo.pageNum == 1}">
		    	<li class="page-item disabled"><a class="page-link">&lt;</a></li>
			</c:if>
			<c:if test = "${pagevo.pageNum > 1}">
		    	<li class="page-item">
		    		<a class="page-link text-white black" href="/bitcamp/mypageOrderHistory?pageNum=${pagevo.pageNum - 1}<c:if test = "${delivery_status != null && delivery_status != 'all'}">&delivery_status=${delivery_status}</c:if><c:if test = "${order_date_start != null}">&order_date_start=${order_date_start}</c:if><c:if test = "${order_date_end != null}">&order_date_end=${order_date_end}</c:if>">&lt;</a>
		    	</li>
			</c:if>
			
			<c:forEach var = "i" begin = "${pagevo.startPage}" end = "${pagevo.startPage + pagevo.onePageCount - 1}">
				<c:if test = "${i <= pagevo.totalPage}">
		    		<li class="page-item">
		    			<a class="page-link pages <c:if test = "${i == pagevo.pageNum}"> text-white black</c:if>" href="/bitcamp/mypageOrderHistory?pageNum=${i}<c:if test = "${delivery_status != null && delivery_status != 'all'}">&delivery_status=${delivery_status}</c:if><c:if test = "${order_date_start != null}">&order_date_start=${order_date_start}</c:if><c:if test = "${order_date_end != null}">&order_date_end=${order_date_end}</c:if>">${i}</a>
		    		</li>
		    	</c:if>
			</c:forEach>
			
			<c:if test = "${pagevo.pageNum == pagevo.totalPage || pagevo.totalPage == ''}">
		    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
			</c:if>
			<c:if test = "${pagevo.pageNum != pagevo.totalPage && pagevo.totalPage != ''}">
				<li class="page-item">
					<a class="page-link text-white black" href="/bitcamp/mypageOrderHistory?pageNum=${pagevo.pageNum + 1}<c:if test = "${delivery_status != null && delivery_status != 'all'}">&delivery_status=${delivery_status}</c:if><c:if test = "${order_date_start != null}">&order_date_start=${order_date_start}</c:if><c:if test = "${order_date_end != null}">&order_date_end=${order_date_end}</c:if>">&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>
	<button class = "mypageWishList_main_btn" onclick = "location.href = '/bitcamp/mypage';">MY PAGE</button>
</div>