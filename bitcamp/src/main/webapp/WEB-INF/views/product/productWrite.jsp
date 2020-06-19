<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel = "stylesheet" href = "/bitcamp/css/product/product_writeForm.css" type = "text/css">
<script src="<%=request.getContextPath()%>/js/product/product_write.js"></script>
<script src = "<%=request.getContextPath()%>/editor/ckeditor/ckeditor.js"></script>


<div class = "container" id = "product_writeForm">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>상품글 작성</span></div>
	<div id = "nTitle"><span>상품글 작성</span></div>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<form name="productWrite" id="productWirte" method="post" action="/bitcamp/productWirteOk" enctype="multipart/form-data">
		<div style="height:1000px">
		<ul id = "productWriteForm">
			<li class="left">상품</li>
			<li id = "categorySelectList" class="right">
				<select id = "categorySelect" name="c_no">
					<option value="1">캠핑패키지</option>
					<option value="2">텐트/타프</option>
					<option value="3">원터치 타프</option>
					<option value="4">매트/침낭</option>
					<option value="5">코펠/버너/취사</option>
					<option value="6">체어/테이블/기타</option>
					<option value="7">화로대/BBQ</option>
				</select>
			</li>
			<li class="left">상품코드</li>
			<li class="right">
				<input type="text" id="p_no" name="p_no" placeholder="상품코드를 입력해주세요"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</li>
			<li class="left">상품명</li>
			<li class="right">
				<input type="text" id="p_name" name="p_name" placeholder="상품명을 입력해주세요">
			</li>
			<li class="left">2박3일 대여 가격</li>
			<li id = "priceInput" class="right">
				<input type="text" id="price" name="price" placeholder="2박3일 대여 가격을 입력해주세요" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
			</li>
			<li class="left">배송비</li>
			<li id = "delivery_fee_list" class="right">
				<select id = "delivery_fee" name="delivery_fee">
					<option value="5000">5,000원(소형)</option>
					<option value="10000">10,000원(중형)</option>
					<option value="20000">20,000원(대형)</option>
					<option value="25000">25,000원(특대형)</option>
					<option value="-1">직접 입력</option>
				</select>
				<input type="text" name="delivery_fee_direct" id="delivery_fee_direct" name="delivery_fee_direct" style="display:none" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</li>
			<li style="width : 100%;border-bottom : 1px solid black;">
				<textarea id ="p_commnet" name="p_commnet"></textarea>
			</li>
			<li class="left">첨부파일1<span style="color:red">(필수)</span></li>
			<li class="right">
				<input type = "file" name = "p_filename" id="file1" accept=".gif,.jpg, .jpeg, .png">
			</li>
			<li class="left">첨부파일2</li>
			<li class="right">
				<input type = "file" name = "p_filename" id="file2" accept=".gif,.jpg, .jpeg, .png">
			</li>
			<li class="left">첨부파일3</li>
			<li class="right">
				<input type = "file" name = "p_filename" id="file3" accept=".gif,.jpg, .jpeg, .png">
			</li>
			<li class="left">첨부파일4</li>
			<li class="right">
				<input type = "file" name = "p_filename" id="file4" accept=".gif,.jpg, .jpeg, .png">
			</li>
			<li class="left">첨부파일5</li>
			<li class="right">
				<input type = "file" name = "p_filename" id="file5" accept=".gif, .jpeg, .png">
			</li>
		</ul>
		</div>
		<div id = "goBtn">
			<input type = "button" value = "목록" onclick = "goboard();">
			<div id = "regiDiv">
				<input type = "submit" name="submit" value = "등록" >
				<input type = "button" value = "취소" onclick = "goboard();">
			</div>
		</div>
	</form>
</div>

