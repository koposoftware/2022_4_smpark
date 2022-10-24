<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="kr.ac.kopo.Util" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="/style/css/main.css" />
<link rel="stylesheet" href="/style/css/main2.css" />
<link rel="stylesheet" href="/style/css/theme.css" />
<link rel="stylesheet" href="/style/css/table.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">

<style>
        .chal:after{
	       	content: "";
	        display: block;
	        width: 60px;
	        border-bottom: 1.5px solid rgb(9,154,150);
	        margin: 0px auto;
        }
       
</style>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>
<script>

</script>
</head>
<body>

	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	
	<main class="hana__main-wrap" style="margin: 155px 140px">
		<h1 align="center" style="font-size: 32px; font-weight: bold;" class="container-fluid fw-bold font-sans-serif py-4">쇼핑/뷰티 맞춤상품</h1>
		<a class="chal""></a>
			<div class="d-flex" style="margin-top: 50px;">
			<div>
			<img src = "/image/img/musinsa.png" style="width: 530px; margin-left: 150px;">
				<div style="width: 40%; margin-left: 330px; margin-top: 25px;">
					<form action="${pageContext.request.contextPath}/shoppingProductJoin1" method="post">
					<input type="hidden" id="savingCode" name="savingCode" value="${selectSaving[0]['SAVINGCODE']}">
					<input type="hidden" id="interestRate" name="interestRate" value="${selectSaving[0]['BASERATE']}">
					<input type="hidden" id="savingName" name="savingName" value="${selectSaving[0]['SAVINGNAME']}">
					<input class="homeBtn" type="submit" value="가입하기" style="text-align: center; width: 150px; font-size: 18px;" >
					</form>
				</div>
			</div>
			<div>
			<img src = "/image/img/oliveyoung.png" style="width: 530px; margin-left: 50px;">
				<div style="width: 40%; margin-left: 250px; margin-top: 25px;">
					<form action="${pageContext.request.contextPath}/shoppingProductJoin1" method="post">
					<input type="hidden" id="savingCode" name="savingCode" value="${selectSaving[1]['SAVINGCODE']}">
					<input type="hidden" id="interestRate" name="interestRate" value="${selectSaving[1]['BASERATE']}">
					<input type="hidden" id="savingName" name="savingName" value="${selectSaving[1]['SAVINGNAME']}">
					<input class="homeBtn" type="submit" value="가입하기" style="text-align: center; width: 150px; font-size: 18px;" >
					</form>
				</div>
			</div>
			</div>
			<div class="d-flex" style="margin-top: 50px;">
			<div>
			<img src = "/image/img/trenbe.png" style="width: 530px; margin-left: 150px;">
				<div style="width: 40%; margin-left: 330px; margin-top: 25px;">
					<form action="${pageContext.request.contextPath}/shoppingProductJoin1" method="post">
					<input type="hidden" id="savingCode" name="savingCode" value="${selectSaving[3]['SAVINGCODE']}">
					<input type="hidden" id="interestRate" name="interestRate" value="${selectSaving[3]['BASERATE']}">
					<input type="hidden" id="savingName" name="savingName" value="${selectSaving[3]['SAVINGNAME']}">
					<input class="homeBtn" type="submit" value="가입하기" style="text-align: center; width: 150px; font-size: 18px;" >
					</form>
				</div>
			</div>
			<div>
			<img src = "/image/img/ably.png" style="width: 530px; margin-left: 50px;">
				<div style="width: 40%; margin-left: 250px; margin-top: 25px;">
					<form action="${pageContext.request.contextPath}/shoppingProductJoin1" method="post">
					<input type="hidden" id="savingCode" name="savingCode" value="${selectSaving[2]['SAVINGCODE']}">
					<input type="hidden" id="interestRate" name="interestRate" value="${selectSaving[2]['BASERATE']}">
					<input type="hidden" id="savingName" name="savingName" value="${selectSaving[2]['SAVINGNAME']}">
					<input class="homeBtn" type="submit" value="가입하기" style="text-align: center; width: 150px; font-size: 18px;" >
					</form>
				</div>
			</div>
			</div> 	
		
	</main>
</body>
</html>