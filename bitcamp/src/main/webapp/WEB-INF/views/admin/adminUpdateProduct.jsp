<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="<%=request.getContextPath()%>/js/product/product_write.js"></script>
<script>
	$(function() {
		$("#productmenu").attr("class","over");
		$("#imgbox button").click(function() {
			var url = "/bitcamp/admin/delimg";
			var $this = $(this);
			var id = $this.attr('title');
			var params = $this.attr('value');
			$.ajax({
				type : "GET",
				url : url,
				data : params,
				success : function(result) {
					if (result > 0) {
						$this.parent().parent().remove("div");
						$("#" + id).parent().css('display', 'block');
						alert('삭제성공');
					}

				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		});

	});
</script>
<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<h2>상품관리</h2>
	<dl>
		<dt>상품분류</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/productCategory">-
				카테고리관리</a>
		</dd>
		<dt>상품관리</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/product">- 상품리스트</a>
		</dd>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/insertProduct">-
				상품등록</a>
		</dd>
	</dl>
</div>

<div id="admin_contents">
	<h3>상품수정</h3>
	<ul class="helpbox">
		<li>가격과 상품이미지를 수정합니다.</li>
	</ul>

	<form method="post" action="/bitcamp/updateProductOk"
		enctype="multipart/form-data">
		<input type="hidden" name="p_no" value="${vo.p_no}" />
		<h4>기본정보</h4>
		<table class="admin_table">
			<tbody>
				<tr>
					<th>분류</th>
					<td><select id="saletype" name="c_no"
						style="border: 1px #CCC solid; height: 25px">
							<option value="" disabled="disabled">카테고리선택</option>
							<c:forEach var="cvo" items="${clist }">
								<option value="${cvo.c_no }"
									<c:if test="${cvo.c_no == vo.c_no}"> selected="selected"</c:if>>${cvo.c_name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr id="imgbox">
					<th>상품이미지</th>
					<td colspan="3">
						<p>
							<b style="float: left">대표이미지 </b><input type="file"
								name="p_mainfile" id="file1" accept=".gif,.jpg, .jpeg, .png">
						</p>
						<p
							<c:if test="${vo.p_filename2 != null && vo.p_filename2 != ''}">style="display:none"</c:if>>
							<b style="float: left">서브이미지1 </b><input type="file"
								name="filename2" id="file2" accept=".gif,.jpg, .jpeg, .png" />
						</p>
						<p
							<c:if test="${vo.p_filename3 != null && vo.p_filename3 != ''}">style="display:none"</c:if>>
							<b style="float: left">서브이미지2 </b><input type="file"
								name="filename3" id="file3" accept=".gif,.jpg, .jpeg, .png">
						</p>
						<p
							<c:if test="${vo.p_filename4 != null && vo.p_filename4 != ''}">style="display:none"</c:if>>
							<b style="float: left">서브이미지3 </b><input type="file"
								name="filename4" id="file4" accept=".gif,.jpg, .jpeg, .png">
						</p>
						<p
							<c:if test="${vo.p_filename5 != null && vo.p_filename5 != ''}">style="display:none"</c:if>>
							<b style="float: left">서브이미지4 </b><input type="file"
								name="filename5" id="file5" accept=".gif,.jpg, .jpeg, .png">
						</p> <c:if test="${vo.p_filename1 != null && vo.p_filename1 != ''}">
							<div>
								<img
									src="<%=request.getContextPath()%>/upload/${vo.p_filename1}" alt=""/><br />
								<p>대표</p>
							</div>
						</c:if> <c:if test="${vo.p_filename2 != null && vo.p_filename2 != ''}">
							<div>
								<img
									src="<%=request.getContextPath()%>/upload/${vo.p_filename2}"
									alt="" /><br />
								<p>
									<button type="button" title="file2"
										value="p_no=<%=request.getParameter("p_no")%>&type=p_filename2&name=${vo.p_filename2}">삭제</button>
								</p>
							</div>
						</c:if> <c:if test="${vo.p_filename3 != null && vo.p_filename3 != ''}">
							<div>
								<img
									src="<%=request.getContextPath()%>/upload/${vo.p_filename3}"
									alt="" /><br />
								<p>
									<button type="button" title="file3"
										value="p_no=<%=request.getParameter("p_no")%>&type=p_filename3&name=${vo.p_filename3}">삭제</button>
								</p>
							</div>
						</c:if> <c:if test="${vo.p_filename4 != null && vo.p_filename4 != ''}">
							<div>
								<img
									src="<%=request.getContextPath()%>/upload/${vo.p_filename4}"
									alt="" /><br />
								<p>
									<button type="button" title="file4"
										value="p_no=<%=request.getParameter("p_no")%>&type=p_filename4&name=${vo.p_filename4}">삭제</button>
								</p>
							</div>
						</c:if> <c:if test="${vo.p_filename5 != null && vo.p_filename5 != ''}">
							<div>
								<img
									src="<%=request.getContextPath()%>/upload/${vo.p_filename5}"
									alt="" /><br />
								<p>
									<button type="button" title="file5"
										value="p_no=<%=request.getParameter("p_no")%>&type=p_filename5&name=${vo.p_filename5}">삭제</button>
								</p>
							</div>
						</c:if>
				</tr>
				<tr>
					<th>상품명</th>
					<td colspan="3"><input type="text" class="text" id="p_name"
						name="p_name" value="${vo.p_name }" style="width: 40%;"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td colspan="3"><input type="text" class="text" id="price"
						name="price" value="${vo.price }" style="width: 20%;"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<th>1박당 가격</th>
					<td colspan="3"><input type="text" class="text" id="day_price"
						name="day_price" value="${vo.day_price }" style="width: 20%;"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<th>배송비</th>
					<td colspan="3"><select id="delivery_fee" name="delivery_fee">
							<option value="5000"
								<c:if test="${vo.delivery_fee ==5000 }"> selected="selected"</c:if>>5,000원(소형)</option>
							<option value="10000"
								<c:if test="${vo.delivery_fee ==10000 }"> selected="selected"</c:if>>10,000원(중형)</option>
							<option value="20000"
								<c:if test="${vo.delivery_fee ==20000 }"> selected="selected"</c:if>>20,000원(대형)</option>
							<option value="25000"
								<c:if test="${vo.delivery_fee ==25000 }"> selected="selected"</c:if>>25,000원(특대형)</option>
							<option value="-1"
								<c:if test="${vo.delivery_fee != 5000 && vo.delivery_fee !=10000 && vo.delivery_fee !=20000 && vo.delivery_fee !=25000 }"> selected="selected"</c:if>>직접
								입력</option>
					</select> <input type="text" class="text" name="delivery_fee_direct"
						id="delivery_fee_direct"
						<c:if test="${vo.delivery_fee ==5000 || vo.delivery_fee ==10000 || vo.delivery_fee ==20000 ||vo.delivery_fee ==25000}">style="display: none"</c:if> value="${vo.delivery_fee }"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					</td>
				</tr>
				
				<tr>
					<th>제품상태</th>
					<td colspan="3"><select id="p_deltype" name="p_deltype">
							<option value="Y"
								<c:if test="${vo.p_deltype =='Y' }"> selected="selected"</c:if>>판매중</option>
							<option value="N"
								<c:if test="${vo.p_deltype =='N' }"> selected="selected"</c:if>>품절</option>							
					</select> 
					</td>
				</tr>


			</tbody>
		</table>

		<h4>상품설명 등록</h4>
		<table class="admin_table">
			<tbody>
				<tr>
					<th>상품상세설명</th>
					<td><textarea id="p_commnet" name="p_commnet">${vo.p_commnet }</textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="goBtn">
			<a href="/bitcamp/admin/product" class="btn btn-dark"
				style="color: white;">목록</a>
			<div id="regiDiv" style="float: right">
				<input type="submit" class="btn btn-dark" name="submit" value="수정">
				<a href="/bitcamp/admin/product" class="btn btn-secondary"
					style="color: white;">취소</a>
			</div>
		</div>
	</form>
</div>
