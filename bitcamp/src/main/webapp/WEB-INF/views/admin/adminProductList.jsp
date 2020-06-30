<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/admin.css" />
<script>
	$(function() {
		$("#allCheck").click(function() {
			//만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#allCheck").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[type=checkbox]").prop("checked", true);
				$("input:checkbox[name='chkall']").attr("checked", false);
				// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	});
</script>
<div
	style="height: 70px; background: #333; color: white; font-size: 3em">관리자
	페이지</div>
<div id="admin_top_menu_box">
	<ul>
		<a href="<%=request.getContextPath()%>/admin/home"><li>관리자홈</li></a>
		<a href="#"><li>기본설정</li></a>
		<a href="<%=request.getContextPath()%>/admin/member"><li>회원관리</li></a>
		<a href="<%=request.getContextPath()%>/admin/product"><li
			class="over">상품관리</li></a>
		<a href="<%=request.getContextPath()%>/admin/orderList"><li>주문관리</li></a>
		<a href="#"><li>매출관리</li></a>
	</ul>
</div>
<div id="admin_top_menu_under">&nbsp;</div>

<div id="admin_left_menu">
	<h2>상품관리</h2>
	<dl>
		<dt>상품분류</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/productCategory">- 카테고리관리</a>
		</dd>
		<dt>상품관리</dt>
		<dd>
			<a href="">- 상품등록</a>
		</dd>
		<dd>
			<a href="">- 상품리스트</a>
		</dd>		
		

	</dl>

</div>


<div id="admin_contents">
	<h3>상품리스트</h3>
	<ul class="helpbox">
		<li>·&nbsp;&nbsp;등록하신 상품들을 수정/관리 하실 수 있습니다.</li>
		<li>·&nbsp;&nbsp;[상품영역]을 클릭하시면 영역별로 상품들을 보실 수 있습니다.</li>
		<li>·&nbsp;&nbsp;서브메인 영역에 상품을 올릴시려면 상품관리에서 제일 마지막 카테고리분류(소분류)를
			클릭하시면 됩니다.</li>
		<li>·&nbsp;&nbsp;[상품진열]버튼을 클릭하시면 상품을 숨길수 있으며 [진열안함]버튼을 클릭하시면 상품을
			전시하실수 있습니다.</li>
		<li>·&nbsp;&nbsp;[상품영역]중 서브메인과 중간영역은 카테고리 지정시에만 가능합니다.</li>
	</ul>

	<form id="form" name="ff" method="get" action="">
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>상품분류</th>
					<td><select id="it_saletype" name="it_saletype"
						style="border: 1px #CCC solid; height: 25px">
							<option value="" selected="">전체분류</option>
							<option value="">캠핑패키지</option>
							<option value="">텐트/타프</option>
							<option value="">원터치텐트</option>
							<option value="">매트/침낭</option>
							<option value="">코펠/버너</option>
							<option value="">체어/테이블</option>
							<option value="">화로대/BBQ</option>
							<option value="">백패킹</option>
					</select>
				</tr>
				<tr>
					<th>등록일</th>
					<td><input type="text" name="s_date" id="s_date"
						value="2001-06-01" class="text w100 hasDatepicker"><img
						class="ui-datepicker-trigger" src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						~ <input type="text" name="e_date" id="e_date" value="2020-06-22"
						class="text w100 hasDatepicker"><img
						class="ui-datepicker-trigger" src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>재고여부</th>
					<td><label for=""><input type="radio"
							name="it_stock_qty" value="" checked="">전체상품</label> <label
						for=""><input type="radio" name="it_stock_qty" value="1">판매</label>
						<label for=""><input type="radio" name="it_stock_qty"
							value="0">품절</label></td>
				</tr>
				<tr>
					<th>게시여부</th>
					<td><label for=""><input type="radio" name="it_use"
							value="" checked="">전체상품</label> <label for=""><input
							type="radio" name="it_use" value="1">게시함</label> <label for=""><input
							type="radio" name="it_use" value="0">게시안함</label></td>
				</tr>
				
				<tr>
					<th>직접검색</th>
					<td><select name="column" id="">
							<option value="" selected="">상품명</option>
							<option value="">상품코드</option>
							<option value="">카테고리명</option>
					</select> <input type="text" name="txtValue" value="" style="width: 200px;">
					</td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
		</div>

		<h4 class="allgoodsnum">
			총 <span class="red">55</span>개의 상품이 검색되었습니다.
			<div>
				<select name="line" id="line">
					<option value="10" selected="">10줄씩보기</option>
					<option value="20">20줄씩보기</option>
					<option value="30">30줄씩보기</option>
					<option value="50">50줄씩보기</option>
					<option value="100">100줄씩보기</option>
				</select>
			</div>
		</h4>
	</form>
	<!-- 상품 리스트 -->
	<table class="goodslist">
		<tbody>
			<tr>
				<th width="5%">번호</th>
				<th width="13%">상품코드</th>
				<th width="25%">상품명
				</th>
				<th width="15%">카테고리</th>
				<th width="5%">개수</th>
				<th width="15%">가격
				</th>
				<th width="6%">게시여부</th>
				<th width="6%">품절여부</th>
				<th width="10%">등록일</th>
				<th width="5%">수정</th>
			</tr>
			<tr>
				<td>2</td>
				<td>1</td>
				<td class="goodsname">
					<div class="imgwrap">
						<img
							src=""
							alt="">
					</div>
					<div>
						<p class="gdname">
							<a href="#">텐트1</a>
						</p>
						<p class="gdcate"></p>
					</div>
				</td>
				<td>카테고리명</td>
				<td>1 개</td>
				<td><span style="display: inline-block; width: 80px; text-align: right;">160,000원
				</span></td>
				<td>게시함</td>
				<td>판매</td>
				<td>2020-06-22</td>
				<td><button type="button" style="width: 50px;">수정</button></td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td class="goodsname">
					<div class="imgwrap">
						<img src="" alt="">
					</div>
					<div>
						<p class="gdname">
							<a href="">텐트2</a>
						</p>
						<p class="gdcate"></p>
					</div>
				</td>
				<td>카테고리명</td>
				<td>1개</td>
				<td><span
					style="display: inline-block; width: 80px; text-align: right;">160,000원
				</span></td>
				<td>게시함</td>
				<td>판매</td>
				<td>2020-06-22</td>
				<td><button type="button" style="width: 50px;">수정</button></td>
			</tr>
			
		</tbody>
	</table>



</div>


