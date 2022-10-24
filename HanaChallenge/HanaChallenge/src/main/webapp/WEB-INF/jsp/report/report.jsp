<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.ac.kopo.Util" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myreport</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="./style/css/main2.css" />
<link rel="stylesheet" href="./style/css/theme.css" />
<link rel="stylesheet" href="./style/css/table.css" />
<link rel="stylesheet" href="./style/bootstrap/css/bootstrap-utilities.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="./style/css/main.css" />

<style>
		@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
		@font-face {
    	font-family: 'GangwonEduPowerExtraBoldA';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
		}
		@font-face {
    	font-family: 'twayair';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
		}
		@font-face {
		    font-family: 'InfinitySans-RegularA1';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
</style>
<style>
    .legend-div {
        position: absolute;
        top: 62px;
        left: 320px;
    }

    .legend-div ul li {
    	font-size : 15px;
        margin: 8px 0;
        color: #666;
        
    }

    .legend-div ul li span {
        display: inline-block;
        width: 15px;
        height: 15px;
        border-radius: 50%;
        margin-right: 5px;
        vertical-align: middle;
    }
    
    ul{
    font-family: "noto", sans-serif;
    }
</style>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>

<script>
	$(function(){
		$('#year').off('change').on('change',function() {
			form1.submit();
		});
		$('#month').off('change').on('change',function() {
			form2.submit();
		});
	});
</script>

<script>
window.onload = function () {
    pieChartDraw();
    document.getElementById('legend-div').innerHTML = window.pieChart.generateLegend();
}

let data = [];
		let label = [];

		<c:forEach items="${sum}" var="sum" varStatus="loop">
			data.push(Number(${sum['SUM'] }));
		</c:forEach>
		
		<c:forEach items="${sum}" var="sum" varStatus="loop">
			label.push('${sum['CATEGORY'] }');
		</c:forEach>
		console.log(label);
		
	
		let pieChartData = {
			    labels: label,
			    datasets: [{
			        data:data,
			        backgroundColor: ['#f59598', '#8abae0', '#ede96d', '#f9a586', '#91d0b6', '#cdb3d5','#f8b2bc','#a9dcd3','#e5bc9c']
			    }] 
			};
let pieChartDraw = function () {
    let ctx = document.getElementById('pieChartCanvas').getContext('2d');
    
    window.pieChart = new Chart(ctx, {
        type: 'pie',
        data: pieChartData,
        options: {
            responsive: false,
            legend: {
                display: false
            },
            legendCallback: customLegend
        }
    });
};

let customLegend = function (chart) {
    let ul = document.createElement('ul');
    let color = chart.data.datasets[0].backgroundColor;
    console.log(color);
    console.log(label);

    chart.data.labels.forEach(function (label, index) {
    	
        ul.innerHTML += '<li><span style="background-color: ' + color[index] +'"></span>' +label + '</li>';
    	
    });

    return ul.outerHTML;
};
	

	
</script>
</head>
<body >
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	
<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	
	if(year==null || year.equals("")) {
		year = Util.getStringNowYear();
	}
	if(month==null || month.equals("")) {
		month = Util.getStringNowMonth();
	}
%>
	<c:set var="year" value="<%=year%>" />
	<c:set var="month" value="<%=month %>" />
	
	<main class="hana__main-wrap" style="margin: 140px 140px">
		<div class="form-floating" style="position: relative" align="center">
			<div style="margin-bottom: 50px">
				<form id="form1" method="get" action="" style="display:inline-block; width: 7%; height: 10%;">
					 <select class="form-select" name="year" id="year" >
				        <option name="2022" value="2022" <c:if test="${year eq '2022'}">selected</c:if>>2022</option>
				        <option name="2021" value="2021" <c:if test="${year eq '2021'}">selected</c:if>>2021</option>
				        <option name="2020" value="2020" <c:if test="${year eq '2020'}">selected</c:if>>2020</option>
				     </select>
				 </form>
			     <a style="font-size: 25px; font-weight: bold;">년 &nbsp</a>
			     <form id="form2" method="get" action="" style="display:inline-block; width: 6%">
			    	<select class="form-select" name="month" id="month">
				        <option name="1" value="1" <c:if test="${month eq '1'}">selected</c:if>>1</option>
				        <option name="2" value="2" <c:if test="${month eq '2'}">selected</c:if>>2</option>
				        <option name="3" value="3" <c:if test="${month eq '3'}">selected</c:if>>3</option>
				        <option name="4" value="4" <c:if test="${month eq '4'}">selected</c:if>>4</option>
				        <option name="5" value="5" <c:if test="${month eq '5'}">selected</c:if>>5</option>
				        <option name="6" value="6" <c:if test="${month eq '6'}">selected</c:if>>6</option>
				        <option name="7" value="7" <c:if test="${month eq '7'}">selected</c:if>>7</option>
				        <option name="8" value="8" <c:if test="${month eq '8'}">selected</c:if>>8</option>
				        <option name="9" value="9" <c:if test="${month eq '9'}">selected</c:if>>9</option>
				        <option name="10" value="10" <c:if test="${month eq '10'}">selected</c:if>>10</option>
				        <option name="11" value="11" <c:if test="${month eq '11'}">selected</c:if>>11</option>
				        <option name="12" value="12" <c:if test="${month eq '12'}">selected</c:if>>12</option> 
			    	</select>
				</form>
			     <a style="font-size: 25px; font-weight: bold;">월 &nbsp소비리포트</a>
			</div>
		</div>
		
		
		<div class="row">
			<div class="chart-div col-lg-44" style="margin-top: 45px; display: inline-block; margin-left: 20px; width: 40%">
		   	 	<div align="center"><canvas id="pieChartCanvas" width="330px" height="330px"></canvas></div>
		    	<div id='legend-div' class="legend-div" width="250px" height="250px" style="margin: 110px 330px 0px;" ></div>
		    </div>
			
			<div class="col-lg-55" style="display: inline-block; width: 45%; padding-top: 10px; text-align: center; margin-left: 120px;" > 
				<table border=1  width=550 align="center">
	              <thead>
	               <tr class="tab-3">
	                  
	                  <th style="width:30%; font-family: 'InfinitySans-RegularA1'">카테고리</th>
	                  <th style="width:30%; font-family: 'InfinitySans-RegularA1'">소비액</th>
	                  <th colspan='3' style="width:40%; text-align: center; font-family: 'InfinitySans-RegularA1'">전월대비</th>
	                  </tr>
	                  </thead>
	                  
	                  <tbody>
						    <c:forEach items="${consumeStats}" var="consumeStats" varStatus="loop" >
				                <tr>
				                  <td class="table-light" >${consumeStats['CATEGORY']}</td>
				                  <td class="table-light" ><fmt:formatNumber value="${consumeStats['SUM'] }" pattern="#,###원"/></td>
				                  <td class="table-light" >${consumeStats['RATE']}</td>
				                  <td class="table-light" ><fmt:formatNumber value="${consumeStats['DIFFERENCE'] }" pattern="#,###원"/></td>
				                  <td>	
				                  	<c:choose>
				                  		<c:when test="${consumeStats['DIFFERENCE'] lt 0}">
				                  			<img src ="./image/img/down.png" style="width: 10px; height: 10px">
				                  		</c:when>
				                  		<c:otherwise>
				                  			<img src ="./image/img/up.png" style="width: 10px; height: 10px">
				                  		</c:otherwise>
				                  	</c:choose>    
				                  </td>  
				                </tr>  
						   </c:forEach>
	                </tbody> 
	               </table>
	          </div>
	       </div>
	       <div class="col-lg-44" style="margin-top: 100px; margin-bottom: 100px" align="center">
	       		<a style="font-size: 23px; font-weight: bold;"><%=year%>년 <%=month%>월 나의 페르소나</a><br>
	       			<c:choose>
	       				<c:when test="${sum[0]['CATEGORY'] eq '쇼핑/뷰티'}">
	       					<img src = "./image/img/shopping.png" style="width: 300px; height: 339px; margin-top: 30px;">
	       				</c:when>
	       				<c:otherwise>
	       					<img src = "./image/img/eat.png" style="width: 300px; height: 339px; margin-top: 30px;">
	       				</c:otherwise>
	       			</c:choose>
	       </div>
	       
	       <div class="row" >
	       	  <div class="chart-div col-lg-44" style= "display: inline-block; margin-left: 70px; width: 45%" align="center">
	       		<a style="font-size: 23px; font-weight: bold; text-align: center;"><%=year%>년 <%=month%>월 소비금액 TOP3</a>
	       			<table style="margin-top: 30px;" border=1  width=500>
	       				<tr>
			      		<c:forEach items="${consumeStore}" var="consumeStore" varStatus="loop">
			           		<c:if test="${consumeStore['RANK'] eq 1}">
			           			<td class="table-light" style="border-bottom: none; font-size: 18px; font-weight: bold;">TOP1</td>
			               		<td class="table-light" style="border-bottom: none; width: 42%; font-size: 18px;" > ${ consumeStore['CONSUME_STORE'] }</td>
			               		<td class="table-liht" style="border-bottom: none; width: 40%; font-size: 18px; text-align: right;">${consumeStore['AMOUNT'] }원 </td>
			                </c:if>
			            </tr>
			            <tr>
			                <c:if test="${consumeStore['RANK'] eq 2}">
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; font-weight: bold;">TOP2</td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; ">${ consumeStore['CONSUME_STORE'] } </td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; text-align: right; ">${consumeStore['AMOUNT'] }원 </td>
			                </c:if>
			            </tr>
			            <tr>
			                <c:if test="${consumeStore['RANK'] eq 3}">
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; font-weight: bold;">TOP3</td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px;">${ consumeStore['CONSUME_STORE'] }</td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; text-align: right;">${consumeStore['AMOUNT'] }원 </td>
			                </c:if>
		           		</c:forEach>
	       				</tr>
	       			</table>
	       	   </div>
	       	   
	       	   <div class="chart-div col-lg-44" style= "display: inline-block; margin-right: 50px; width: 45%" align="center">
	       		<a style="font-size: 23px; font-weight: bold; text-align: center;"><%=year%>년 <%=month%>월 소비날짜 TOP3</a>
	       			<table style="margin-top: 30px;" border=1  width=500>
	       				<tr>
			      		<c:forEach items="${consumeDate}" var="consumeDate" varStatus="loop">
			           		<c:if test="${consumeDate['RANK'] eq 1}">
			           			<td class="table-light" style="border-bottom: none; font-size: 18px; font-weight: bold;">TOP1</td>
			               		<td class="table-light" style="border-bottom: none; width: 42%; font-size: 18px;" > ${ consumeDate['CONSUMEDATE'] }</td>
			               		<td class="table-light" style="border-bottom: none; width: 40%; font-size: 18px; text-align: right;">${consumeDate['AMOUNT'] }원 </td>
			                </c:if>
			            </tr>
			            <tr>
			                <c:if test="${consumeDate['RANK'] eq 2}">
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; font-weight: bold;">TOP2</td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; ">${ consumeDate['CONSUMEDATE'] } </td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; text-align: right; ">${consumeDate['AMOUNT'] }원 </td>
			                </c:if>
			            </tr>
			            <tr>
			                <c:if test="${consumeDate['RANK'] eq 3}">
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; font-weight: bold;">TOP3</td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px;">${ consumeDate['CONSUMEDATE'] }</td>
			               		<td class="table-light" style="border-bottom: none; font-size: 18px; text-align: right;">${consumeDate['AMOUNT'] }원 </td>
			                </c:if>
		           		</c:forEach>
	       				</tr>
	       			</table>
	       	   </div>
	       </div>
			     
		
	
	</main>
	
</body>
</html>