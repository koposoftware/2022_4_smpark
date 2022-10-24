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
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>
<script>

	window.onload = function() {
   	let data = [];
   
	   <c:forEach items="${ rateChange }" var="rateChange" varStatus="loop">
	      data.push(${rateChange['PRIMERATE']});  
	   </c:forEach>
	console.log(data);
	
	new Chart(document.getElementById("bar-chart"), {
   
	    type: 'bar',
	    data: {
	      labels: ["${ rateChange[0]['CHANGEDATE2'] }","${ rateChange[1]['CHANGEDATE2'] }","${ rateChange[2]['CHANGEDATE2'] }","${ rateChange[3]['CHANGEDATE2'] }","${ rateChange[4]['CHANGEDATE2'] }"],
	      datasets: [{
	          label: "우대금리 (단위: %)",
	          backgroundColor: ['rgba(121, 192, 242)', 'rgba(121, 192, 242)','rgba(255, 142, 166)','rgba(255, 142, 166)','rgb(75, 192, 192)'],
	          data: data
	        }]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: false,
	        
	      },
      
	      scales: {
	         xAxes: [{
	              barPercentage: 0.4
	          }], 
	          
	        yAxes: [ {
	           
	           ticks: {
	              beginAtZero: true, // 0부터 시작하게 합니다.
	              stepSize: 1   // 10000 씩 증가하도록 설정합니다.
	           } 
	           
	           
	        } ]
	     }, 
      showValue:{
         fontStyle: '', //Default Arial
         fontSize: 20
  	}, 
	  animation: { startup: true,                 
	     duration: 1000,                 
	     easing: 'linear' }

    }, 
    bar: {groupWidth: "80%"}
	});

	};
</script>


<style>
   .chal:after{
	   	content: "";
	    display: block;
	    width: 60px;
	    border-bottom: 1.5px solid rgb(9,154,150);
	    margin: 0px auto;
   } 
   
   .translate-y{animation: translatey 1s linear 1 ;}
	@keyframes translatey{
    0%{transform: translateY(0);}
    100%{transform: translateY(100%);}
	}
	
	td{
		font-size: 20px;
		height: 43px;
		
	}
	
	#detail {
		padding: 10px;
		margin-bottom: 10px;
		border: 4px solid rgb(9,154,150);
		box-shadow:  6px 6px rgba(21,65,64,0.2);
		border-radius: 50%;
		margin-top: 40px;
	}
	
	#title{
	 font-size: 25px;
	 width: 160px;
	 height: 25px;
	 
	}
	
</style>
</head>
<body>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header> 
	<main class="hana__main-wrap" style="margin: 155px 140px">
		<h1 align="center" style="font-size: 32px; font-weight: bold;" class="container-fluid fw-bold font-sans-serif py-4">${savingDetail[0]['SAVINGNAME'] }</h1>
		<a class="chal""></a>
		<section class="pt-6 ps-9 pe-9">
		<div class="row" style="margin-bottom: 50px;">
			
			<a id="title" style="position:absolute; z-index: 2; margin-left: 85px;"> 가입일자</a>
			<div class="card" id="detail" style=" height: 220px; width: 20%; margin-right: 50px; margin-left: 40px; z-index: 1; position: relative;">
				<a style="font-size: 25px; margin-top: 85px; margin-left: 28px;">${savingDetail[0]['STARTDATE'] }</a>
			</div>
			
			<a id="title" style="position:absolute; z-index: 2; margin-left: 361px;"> 만기일자</a>
			<div class="card" id="detail" style="height: 220px; width: 20%; margin-right: 50px;">
				<a style="font-size: 25px; margin-top: 85px; margin-left: 32px;">${savingDetail[0]['ENDDATE'] }</a>
			</div>
			
			<a id="title" style="position:absolute; z-index: 2; margin-left: 633px;"> 가입금액</a>
			<div class="card" id="detail" style="height: 220px; width: 20%; margin-right: 50px;">
				<a style="font-size: 25px; margin-top: 85px; margin-left: 48px;"><fmt:formatNumber value="${savingDetail[0]['JOINAMOUNT']}" pattern="#,###원" /></a>
			</div>
			
			<a id="title" style="position:absolute; z-index: 2; margin-left: 905px;"> 현재금액</a>
			<div class="card" id="detail" style="height: 220px; width: 20%;">
				<a style="font-size: 25px; margin-top: 85px; margin-left: 43px;"><fmt:formatNumber value="${savingDetail[0]['COLLECTAMOUNT']}" pattern="#,###원" /></a>
			</div>
		
		</div>
		<div class="row">
		<div style="margin-left: 50px; margin-top: 40px; font-size: 22px; font-family: 'InfinitySans-RegularA1'; padding: 5px; display: inline-block; width: 45%;">
			<h2 style="color: #343a40;">우대금리</h2>
				<div style="margin-top: 15px; margin-left: -30px; width: 100%; display: inline-block; ">
					<canvas id="bar-chart" height="160px;"></canvas>
				</div>
		</div>
		<div style="width: 50%; margin-top: 45px;">
			<table border=1 align="center" width=100%>
				<thead>
					<tr class="tab-3" style="text-align: center;">
	                  	<th style="width:30%; padding-bottom: 20px; color: #343a40; font-family: 'InfinitySans-RegularA1'; font-weight: 400; font-size: 22px;">날짜</th>
	                  	<th style="width:45%; color: #343a40; font-family: 'InfinitySans-RegularA1'; font-weight: 400; font-size: 22px;">누적소비액</th>
	                  	<th style="width:25%; color: #343a40; font-family: 'InfinitySans-RegularA1'; font-weight: 400; font-size: 22px;">우대금리</th>
                 	</tr>
				</thead>
				<tbody >
					<c:forEach items="${rateChange}" var="rateChange" varStatus="loop" >
				                <tr style="text-align: center; height: 50px;">
				                  <td class="table-light" style="font-size: 18px; padding-top: 10px;">${rateChange['CHANGEDATE']}</td>
				                  <td class="table-light" style="font-size: 18px;"><fmt:formatNumber value="${rateChange['SUMCONSUME'] }" pattern="#,###원"/></td>
				                  <td class="table-light" style="font-size: 18px;"><fmt:formatNumber value="${rateChange['PRIMERATE']}" pattern=".0" />%</td>
				                </tr>
						   </c:forEach>
				</tbody>
			</table>
		</div>
		</div>
		<div align="center" style="margin-top: 80px;">
		<button class="homeBtn" id="home"><a href="${pageContext.request.contextPath}/mypage">목록</a> </button>
	    </div>
		</section>
	</main>
</body>


</html>