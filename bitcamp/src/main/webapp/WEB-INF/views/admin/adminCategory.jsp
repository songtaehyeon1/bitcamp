<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/admin.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
		});
		$("#categorys a").click(function() {
			var url = "<%=request.getContextPath()%>/admin/selectCategory";
			var params = "c_no="+$(this).attr('value');
			$.ajax({
				type : "GET",
				url : url,
				data : params,
				success : function(result) {
					if(result.c_no !=null){
					$("#c_name").attr("value",result.c_name);
					$("#c_no").attr("value",result.c_no);
					$("#c_cnt").attr("value",result.cnt);
					$("#c_noView").html(result.c_no)
					$("#c_name1").html(result.c_name)
					$("#c_cntView").html(result.cnt+"개가 등록되어있습니다.")
					}
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		});

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
			<a href="<%=request.getContextPath()%>/admin/productCategory">-
				카테고리관리</a>
		</dd>
		<dt>상품관리</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/insertProduct">- 상품등록</a>
		</dd>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/product">- 상품리스트</a>
		</dd>


	</dl>

</div>


<div id="admin_contents">
	<h3>카테고리 관리</h3>

	<form method="get" action="<%=request.getContextPath()%>/admin/updateCategory">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td width="20%" valign="top">
						<table border="0" width="100%" cellpadding="0" cellspacing="3">
							<tbody>
								<tr style="text-align: center; height: 25px;">
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="border: 1px solid gray;">
											<ul style="padding: 0" id="categorys">
												<li
													style="padding-left: 5px; background: #eeeeee; border-bottom: 1px solid gray;">카테고리</li>
												<c:forEach var="list" items="${list }">
													<li
														style="line-height: 25px; padding-left: 5px; cursor: pointer;">
														<a href="javascript:void(0)" value="${list.c_no}"> ${list.c_name}</a>
												</c:forEach>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</td>

					<td width="1%"></td>
					<td width="79%" valign="top">
						<table border="0" width="100%" cellpadding="0" cellspacing="3">
							<tbody>
								<tr style="height: 25px; font-weight: bold; font-size: 20px;">
									<td colspan="2">카테고리 정보</td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="border-top: 1px solid gray;">
											<table class="admin_table" style="margin: 0;">
												<tbody>
													<!-- 카테고리 수정 -->
													<tr>
														<th width="15%">현재 카테고리</th>
														<td id="c_name1"></td>
													</tr>
													<tr>
														<th>등록 상품수</th>
														<td id="c_cntView"></td>
														<input type="hidden" id="c_cnt" name="cnt" value=""/>
													</tr>
													<tr>
														<th>분류코드</th>
														<td id="c_noView"></td>
														<input type="hidden" id="c_no" name="c_no" value=""/>
													</tr>
													<tr>
														<th>카테고리명</th>
														<td><input type="text" id="c_name" name="c_name"
															class="text"></td>
													</tr>


												</tbody>
											</table>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn" style="float: right">
							<button type="submit">수정</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>


