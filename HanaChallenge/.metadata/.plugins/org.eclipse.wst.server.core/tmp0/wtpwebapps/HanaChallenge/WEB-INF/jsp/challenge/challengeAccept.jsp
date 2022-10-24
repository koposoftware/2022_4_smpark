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
<title>mychallenge</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="./style/css/main2.css" />
<link rel="stylesheet" href="./style/css/theme.css" />
<link rel="stylesheet" href="./style/css/table.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="./style/css/main.css" />


</head>
<body>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	
	<main class="hana__main-wrap" style="margin: 140px 140px">
	
	<c:forEach items="${challengeList}" var="challengeList" varStatus="loop">
	    <div style="margin-bottom : 3%; width: 95%; padding: 0 0 0px 50px; " align="center">
			<div style="height: 400px; display: inline-block; padding: 200px;" >
				
				<div style="font-size: 25px; width: 450px; margin-bottom: 40px; font-weight: bold;">${challengeList['name']}님이 도전하기에 초대하셨습니다</div>
				<input class="chalBtn" type="button" onclick="javascript:challengeAccept('${challengeList['challengeNo']}');" value="수락하기" style="text-align: center;">
			
				
			</div>
		</div>
	</c:forEach>
	
	<form name="form1" action="/challengeUpdate" method="post">
		<input type="hidden" name="challengeNo" id="challengeNo">
	</form>
	
	
	</main>
	
	<footer>
    	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
    </footer> 
	<script type="text/javascript">
		function challengeAccept(challengeNo) {
			document.form1.challengeNo.value = challengeNo;
			document.form1.submit();
		}
	</script>
 
</body>
</html>