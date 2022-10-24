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
<link rel="stylesheet" href="/style/bootstrap/css/bootstrap-utilities.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>
<style>
	.homeBtn3 {
	   font-size: 16.5px;
       background-color: rgb(9,154,150);
       padding: 13px 10px;
       border-radius: 4px;
       width:150px;
       cursor: pointer;
       color: white;
       border: 1px solid rgb(9,154,150);
       font-family: "noto", sans-serif
     }
     
.homeBtn3:hover {
	   font-size: 16.5px;
       background-color: white;
       padding: 13px 10px;
       border-radius: 4px;
       cursor: pointer;
       color: black;
       border: 1px solid rgb(9,154,150);
     }
</style>
</head>
<body>

	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	<%
	String challengeType = request.getParameter("challengeType");
	%>
	 <div style="margin-top: 300px; margin-bottom: 100px" align="center">
	 	<c:if test="${challengeType eq 'a'}">
	 	   <a style="font-size: 25px; font-weight: bold;">도전하기가 시작되었어요!</a><br>
	       <img src = "/image/img/fighting.png" style="width: 250px; height: 200px; margin-top: 30px;"><br>
	       <div style="margin-top: 50px;">
	       <button class="homeBtn" id="home"> HOME </button>
	       <button class="homeBtn"> 마이페이지 </button>
	       </div>
	    </c:if>
	    
	    <c:if test="${challengeType eq 'c'}">
	 	   <a style="font-size: 25px; font-weight: bold;">도전하기가 시작되었어요!</a><br>
	       <img src = "/image/img/fighting.png" style="width: 250px; height: 200px; margin-top: 30px;"><br>
	       <div style="margin-top: 50px;">
	       <button class="homeBtn" id="home"> HOME </button>
	       <button class="homeBtn"> 마이페이지 </button>
	       </div>
	    </c:if>
	    
	    <c:if test="${challengeType eq 'b'}">
	 	   <a style="font-size: 25px; font-weight: bold;">친구의 수락을 기다리고 있어요!</a><br>
	       <img src = "/image/img/fighting.png" style="width: 250px; height: 200px; margin-top: 30px;"><br>
	       <div style="margin-top: 50px;">
	       <button class="homeBtn3" id="withfriend" onclick="saveWithFriend();"> 메세지 보내기 </button>
	       <button class="homeBtn3"> 마이페이지 </button>
	       </div>
	    </c:if>
	    
	 </div>
	 
	 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	 <script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	 <script>
	 console.log($("#challengeType").val);
	 $(document).ready(function(){
		 $(document).on('click','.homeBtn', function(){
			 location.href="/index.jsp";
		 })
	 })
	 
	 Kakao.init('48415b826cad0beb61bafa6d74058db4');
	 function saveWithFriend(){ 
		 
		 Kakao.Share.createCustomButton({
			  container: '#withfriend',
			  templateId: ${83172},
			});
	 } 
	
	 </script>

</body>
</html>