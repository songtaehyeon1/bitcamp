<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};

</script>
<style>
a{text-decoration:none;}
a:hover{text-decoration:none;}
.container {
    width: 500px;
    max-width: 500px;
    height: 320px;
    border: 1px solid #DDD;
    background: #fff;
    text-align: center;
    margin-top: 10%;
}
.container h1 {
    font-size: 21px;
    text-align: center;
    color: #000;
    font-weight: bold;
    margin: 60px auto 30px;
}
.container .content p {
    color: #000;
    font-size: 16px;
    font-weight: 400;
    margin-bottom: 40px;
    line-height: 22px;
}
.container .buttons a {
    display: inline-block;
    padding: 10px 20px;
    color: #000;
    border: 1px solid #000;
    box-sizing: border-box;
    margin: 0 5px;
    font-size: 15px;
    font-weight: 500;
}
.container .buttons a.log {
    background: #000;
    color: #fff;
}
</style>

<div class="container">
	<h1>결제 완료</h1>
	<div class="content">
	  <p>결제가 완료 되었습니다.</p>
	  <c:if test="${logStatus=='N' }">
	  <p class="log"> 주문번호는 <b>${vo.o_no }</b> 입니다.</p>
	  </c:if>
	</div>
	<div class="buttons">
	  <a href="/bitcamp">홈으로</a>
	  <c:if test="${logStatus=='Y' }">
	  <a href="/bitcamp/mypageOrderHistory" class="log">결제내역 조회</a>
	  </c:if>
	  <c:if test="${logStatus=='N' }">
	  <a href="/bitcamp/nonmemberOrderHistory" class="log">비회원 결제내역 조회</a>
	  </c:if>
	</div>
</div>





