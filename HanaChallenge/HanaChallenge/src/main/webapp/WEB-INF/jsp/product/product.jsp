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
<title>product</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/main2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/theme.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/table.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<style>
        .chal:after{
	       	content: "";
	        display: block;
	        width: 60px;
	        border-bottom: 1.5px solid rgb(9,154,150);
	        margin: 18px auto;
        }
       
</style>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>
<script>
	
	$(document).ready(function(){
	      $('#num1').click(function(){
	    	  location.href="${pageContext.request.contextPath}/shoppingProduct";
	      })
	})
	
</script>
</head>
<body>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	
	<main class="hana__main-wrap" style="margin: 155px 140px">
		<h1 align="center" style="font-size: 32px; font-weight: bold;">맞춤상품</h1>
		<a class="chal"></a>
		<div align="center" style="font-size: 17px; margin-top: 15px; margin-bottom: 15px;">최근 3개월 소비 데이터 기반 상품 추천</div>
		<div class="form-floating" style="position: relative" align="center">
			<c:if test="${sumList[0]['CATEGORY'] eq '쇼핑/뷰티'}">
				<img src = "${pageContext.request.contextPath}/image/img/shopping_2.png" style="width:180px; height: auto;position: relative; left: 578px; top:-260px; z-index: 2">
			</c:if>
			<c:if test="${sumList[1]['CATEGORY'] eq '여행/숙박'}">
				<img src = "${pageContext.request.contextPath}/image/img/travel_2.png" style="width:180px; height: auto;position: relative; left: 178px; top:-170px; z-index: 3">
			</c:if>
			<c:if test="${sumList[2]['CATEGORY'] eq '식비'}">
				<img src = "${pageContext.request.contextPath}/image/img/eat_2.png" style="width:180px; height: auto;position: relative; right: -420px; top:-170px; z-index: 4">
			</c:if>
			
			<img src = "${pageContext.request.contextPath}/image/img/podium.png" style="width: 775px; height: 320px; position: relative; margin-top: 240px; right:270px; z-index: 1">
			<div style="font-size: 20px; font-weight: bold; text-align: center; position: relative; left: -5px;" align="center">
				<a style="">${sumList[1]['CATEGORY'] }</a>
				<a style="margin-right: 145px; margin-left: 120px;">${sumList[0]['CATEGORY'] }</a>
				<a style="">${sumList[2]['CATEGORY'] }</a>
			</div>
			
			<div style="font-size: 20px; font-weight: bold; text-align: center; position: relative; left: 8px; margin-top: 25px;" align="center">
				<input class="proBtn" id="num2" type="button" value="상품보기" style="text-align: center; width: 8%;" >
				<input class="proBtn" id="num1" type="button" value="상품보기" style="text-align: center; width: 8%; margin-left: 100px; margin-right: 100px;">
				<input class="proBtn" id="num3" type="button" value="상품보기" style="text-align: center; width: 8%;">
			</div>
		</div>
	</main>
	
</body>
</html>