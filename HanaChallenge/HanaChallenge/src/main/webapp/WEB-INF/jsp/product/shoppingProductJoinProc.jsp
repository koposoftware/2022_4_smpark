<%@page import="java.time.LocalDate"%>
<%@page import="org.apache.tomcat.jni.Local"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/style/css/bootstrap.css" />
<link rel="stylesheet" href="/style/css/main.css" />
<link rel="stylesheet" href="/style/css/theme.css" /> 
<link rel="stylesheet" href="/style/css/main2.css" />
<link rel="stylesheet" href="/style/css/table.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>
</head>
<body>

<%
	String savingName = request.getParameter("savingName");
%>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header> 
	
	 <div style="margin-top: 300px; margin-bottom: 100px" align="center">
	 		<a style="font-size: 25px; font-weight: bold;"><%=savingName%>에 가입되었습니다</a><br>
	       <img src = "/image/img/fighting.png" style="width: 250px; height: 200px; margin-top: 30px;"><br>
	       <div style="margin-top: 50px;">
	       <button class="homeBtn" id="home"> HOME </button>
	       <button class="homeBtn" id="mypage"> 마이페이지 </button>
	       </div>
	 </div>
	 <script>
	
	$('#mypage').click(function(){
    	  location.href="/mypage";
      })
    $('#home').click(function(){
    	  location.href="/index.jsp";
      })
	 
	
	 </script>
</body>
</html>