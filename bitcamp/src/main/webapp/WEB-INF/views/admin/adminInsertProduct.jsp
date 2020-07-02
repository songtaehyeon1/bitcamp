<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="<%=request.getContextPath()%>/js/admin/product_write.js"></script>


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
			<a href="<%=request.getContextPath()%>/admin/product">- 상품리스트</a>
		</dd>	
		<dd>
			<a href="<%=request.getContextPath()%>/admin/insertProduct">- 상품등록</a>
		</dd>
	</dl>
</div>

<div id="admin_contents">
	<h3>상품등록</h3>
	<ul class="helpbox">
		<li>가격과 상품이미지 설정하여 상품등록합니다.</li>
	</ul>

		<form name="productWrite" id="productWirte" method="post" action="/bitcamp/productWirteOk" enctype="multipart/form-data">
		<h4>기본정보</h4>
		<table class="admin_table">
			<tbody>
				<tr>
					<th>분류</th>
					<td><select id="saletype" name="c_no"
						style="border: 1px #CCC solid; height: 25px">
							<option value="" disabled="disabled">카테고리선택</option>
							<c:forEach var="cvo" items="${clist }">
								<option value="${cvo.c_no }">${cvo.c_name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>상품이미지</th>
					<td colspan="3"><b>대표이미지 </b><input type="file"
						name="p_filename" id="file1" accept=".gif,.jpg, .jpeg, .png"><br>
						<b>서브이미지1 </b><input type="file" name="p_filename" id="file2"
						accept=".gif,.jpg, .jpeg, .png"><br> <b>서브이미지2 </b><input
						type="file" name="p_filename" id="file3"
						accept=".gif,.jpg, .jpeg, .png"><br> <b>서브이미지3 </b><input
						type="file" name="p_filename" id="file4"
						accept=".gif,.jpg, .jpeg, .png"><br> <b>서브이미지4 </b><input
						type="file" name="p_filename" id="file5"
						accept=".gif,.jpg, .jpeg, .png"><br>
				</tr>
				<tr>
					<th>상품명</th>
					<td colspan="3"><input type="text" class="text" id="p_name"
						name="p_name" value="" style="width: 40%;"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td colspan="3"><input type="text" class="text" id="price"
						name="price" value="" style="width: 20%;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<th>1박당 가격</th>
					<td colspan="3"><input type="text" class="text" id="day_price"
						name="day_price" value="" style="width: 20%;"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<th>배송비</th>
					<td colspan="3"><select id="delivery_fee" name="delivery_fee">
							<option value="5000">5,000원(소형)</option>
							<option value="10000">10,000원(중형)</option>
							<option value="20000">20,000원(대형)</option>
							<option value="25000">25,000원(특대형)</option>
							<option value="-1">직접 입력</option>
					</select> <input type="text" class="text" name="delivery_fee_direct" value="0"
						id="delivery_fee_direct" style="display: none"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>


			</tbody>
		</table>

		<h4>상품설명 등록</h4>
		<table class="admin_table">
			<tbody>
				<tr>
					<th>상품상세설명</th>
					<td><textarea id="p_commnet" name="p_commnet"></textarea></td>
				</tr>
			</tbody>
		</table>
		<div id = "goBtn">
			<a href="/bitcamp/admin/product" class="btn btn-dark" style="color: white;">목록</a>
			<div id = "regiDiv" style="float: right">
				<input type = "submit" class="btn btn-dark" name="submit" value = "등록" >
				<a href="/bitcamp/admin/product" class="btn btn-secondary" style="color: white;">취소</a>
			</div>
		</div>
	</form>
</div>
