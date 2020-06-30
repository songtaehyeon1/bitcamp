<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    background: #000;
    color: #fff;
    border: 1px solid #000;
    box-sizing: border-box;
    margin: 0 5px;
    font-size: 15px;
    font-weight: 500;
}
</style>

<div class="container">
	<h1>회원탈퇴 완료</h1>
	<div class="content">
	  <p>회원탈퇴가 완료되었습니다. <br>그동안 THEBITCAMP를 이용해 주셔서 감사합니다.</p>
	</div>
	<div class="buttons">
	  <a href="/bitcamp">홈 바로가기</a>
	</div>
</div>