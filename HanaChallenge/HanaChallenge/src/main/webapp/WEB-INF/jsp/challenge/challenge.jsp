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
</style>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>

<style>
        .modal {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modal .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }
        
        .modal2 {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modal2 .bg2 {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
          position: absolute;
          background-color: #fff;
          width: 400px;
          height: 500px;
	      margin: 0.5rem;
          pointer-events: none;
          border-radius: 15px;
        }

        .modalBox button {
          display: block;
          width: 80px;
          margin: 0 auto;
        }

        .hidden {
          display: none;
        }
        
        .chal:after{
	       	content: "";
	        display: block;
	        width: 60px;
	        border-bottom: 1.5px solid rgb(9,154,150);
	        margin: 18px auto;
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
        margin: 15px 0;
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
    
    /* webkit solution */
	::-webkit-input-placeholder {
	  text-align: right;
	}
	/* mozilla solution */
	input:-moz-placeholder {
	  text-align: right;
	}
	
		#accountNum{
		width: 300px; 
		padding: .8em .5em; 
		border: 1px solid #999;
		font-family: inherit;  
		background: url(../../image/img/selectbox.png) no-repeat 95% 50%; 
		border-radius: 10px; 
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	
	#accountNum::-ms-expand {       
	 	display: none;
	}
	
	ul {
	font-family: "noto", sans-serif;
	position: relative; 
	top: -157px;
	}
	
	#friendList{
		width: 300px; 
		padding: .8em .5em; 
		border: 1px solid #999;
		font-family: inherit;  
		background: url(../../image/img/selectbox.png) no-repeat 95% 50%; 
		border-radius: 0px; 
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	
	#friendList::-ms-expand {       
	 	display: none;
	}
</style>
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
	
	var selectBoxChange1 = function(value){
		console.log("값변경test2 : " + value);
		$("#accountNum").val(value);
	}
	
</script>

</head>
<body>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	
	<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	
	year = "2022";
	month = "9";
	
	Calendar challengeCal = Calendar.getInstance ( );
	challengeCal.set( Integer.parseInt(year), 10, Integer.parseInt(month));
	int maxDays = challengeCal.getActualMaximum ( Calendar.DAY_OF_MONTH );
	
	String startDate = year + "-" + challengeCal.get(Calendar.MONTH) + "-01";
	String endDate = year + "-" + challengeCal.get(Calendar.MONTH) + "-" + maxDays;
	%>
	<c:set var="year" value="<%=year%>" />
	<c:set var="month" value="<%=month%>" />
	
	<main class="hana__main-wrap" style="margin: 140px 140px">
		<h1 align="center" style="font-size: 32px; font-weight: bold;">도전하기</h1>
		<a class="chal"></a>
		<h1 align="center" style="font-size: 22px; margin-top: 40px; font-weight: bold;"> <%=month%>월 소비 내역</h1>
		<div>
			<div class=row>
				<div class="chart-div col-lg-44" style="margin-top: 45px; display: inline-block; margin-left: 150px; width: 50%">
			   	 	<div align="center"><canvas id="pieChartCanvas" width="330px" height="330px"></canvas></div>
			    	<div id='legend-div' class="legend-div" width="250px" height="250px" style="margin: 258px 580px 0px;" ></div>
			    </div>
			    
			    <div class="col-lg-55" style="display: inline-block; width: 15%; text-align: center; margin-left: 50.3px; margin-top: 43px;" > 
						<table border=1  width=100 align="center">
						    <c:forEach items="${sum}" var="sum" varStatus="loop" >
				                <tr>
				                  <td class="table-light" style="border-bottom: none; font-size: 14px; padding: 9.5px; text-align: right; min-width: 120px;"><fmt:formatNumber value="${sum['SUM'] }" pattern="#,###원"/></td>
				                </tr>  
						   	</c:forEach>
			            </table>
	          	</div>
		    </div>
	        
		    <div>
		    	<h1 align="center" style="font-size: 22px; margin-top: 100px; font-weight: bold;"> <%=month%>월 소비 카테고리 TOP3</h1>
			    	<table style="margin-top: 30px; margin-left: 380px;" border=1  width=650>  
			    		<tbody>
			    		<c:forEach items="${sum}" var="sum" varStatus="loop" >
			    		<c:if test="${sum['RANK'] lt 4}">
			    			<tr>
			    				<td class="table-light" style="border-bottom: none; width: 15%; font-size: 18px; font-weight: bold;">
			    				<c:if test="${sum['RANK'] eq 1}">TOP1</c:if>
			    				<c:if test="${sum['RANK'] eq 2}">TOP2</c:if>
			    				<c:if test="${sum['RANK'] eq 3}">TOP3</c:if>
			    				</td>
				               	<td class="table-light" style="border-bottom: none; width: 20%; font-size: 18px;" > ${ sum['CATEGORY'] }</td>
				               	<td class="table-liht" style="border-bottom: none; width: 25%; font-size: 18px; text-align: right;">
				               		<fmt:formatNumber value="${sum['SUM'] }" pattern="#,###원"/>
				               	</td>
				               	<td align="center" style="text-align: center; border-bottom: none; width: 30%;">
				               		<button class="openBtn" 
				               			onclick="openModal(
				               				'${sum['CATEGORYCODE']}'
				               				, '${sum['CATEGORY']}'
				               				, '<fmt:formatNumber value="${sum['SUM'] }" pattern="#,###원"/>'
				               			)">도전하기</button>
				               	</td>				                
			    			</tr>			    					
			    		</c:if>
			    		</c:forEach>
		       			</tbody>
	       			</table>
		    </div>
		    <div>
		    	<p align="center" style="margin-top: 50px; color: red;"> ※ 도전하기 실패 시 발생하는 패널티는 패널티 통장으로 자동이체 됩니다</p>
		    </div>
	   </div>
		    
	   <div class="modal hidden">
		  <div class="bg"></div>
		  <div class="modalBox" role="document">
		    <div class="modal-content" style="padding: 10%;">
		    	<div class="modal-header" style="flex-direction: column;">
		    	<div style="text-align:center; font-weight: bold; font-size: 18px;">
		    		<p id="challengeModalTitle"></p><br>
		    		<p id="challengeModalPrice"></p><br>
		    	</div>
		    	</div>
		    	<div style="padding-top: 5px;">
	               <form:form action="${pageContext.request.contextPath}/challenge/proc" name="form1" method="post" modelAttribute="challengeVO">
						
						<label style="padding: 10px 0px; font-weight: bold;"> 도전이름 </label> 
						<input class="form-control" type="text" id="challengeName" name="challengeName"  /><br>
						
						<label style="padding: 10px 0px; font-weight: bold;">목표금액</label>
						<input class="form-control" type="text" id="goal" name="challengeGoal" placeholder="원" /><br>
						
						<input type="hidden" id="challengeStartDate" name="challengeStartDate" value="<%=startDate%>">
						<input type="hidden" id="challengeEndDate" name="challengeEndDate" value="<%=endDate%>">
						
						<label style="padding: 10px 0px; font-weight: bold;">패널티비율</label>
						<input class="form-control" type="text" id="challengePenaltyRate" name="challengePenaltyRate" placeholder="%"/><br>
						
						<label style="padding: 10px 0px; font-weight: bold;" >패널티 이체 계좌 선택</label>
						<select id="accountNum" name="accountNum" onchange="selectBoxChange1(this.value);" style="border-color: #adb5bd; width: 100%; margin-bottom: 15px;">
                           	<option>선택하세요</option>
                           	<c:forEach items="${selectAccount}" var="selectAccount" varStatus="loop">
                           		<option value="${selectAccount['ACCOUNTNUM']}">${selectAccount['ACCOUNTNUM']}</option>
							</c:forEach>
	                    </select>
						 
						<input type="hidden" id="consumeCode" name="consumeCode">
						<input type="hidden" id="challengeType" name="challengeType">
						<input type="hidden" id="friendId" name="friendId">
						<div style="margin-left: 5px; margin-top: 15px;">
						<input class="chalBtn" type="button" onclick="saveAlone();" value=" 혼자서 도전하기" style="text-align: center; padding: 15px 10px;">
						<input class="chalBtn" type="button" onclick="openModal2();" value=" 친구와 도전하기" style="text-align: center;">
						</div>
					</form:form>
				</div>
	        <a class="closeBtn" onclick="closeModal()" style="border: none;"></a>
	        </div>
	        
		  </div>
		</div>
		
		<div class="modal2 hidden">
		  <div class="bg2"></div>
		  <div class="modalBox" role="document">
		    <div class="modal-content" style="padding: 10%;">
		    	<div class="modal-header" style="flex-direction: column;">
			    	<div style="text-align:center; font-weight: bold; font-size: 18px;">
			    	</div>
		    	</div>
		    	<div style="padding-top: 5px;">
		    		<label style="padding: 10px 0px; font-weight: bold; font-size: 20px; margin-bottom: 10px;" >친구 선택</label>
					<select id="friendList" name="friendList" style="border-color: #adb5bd; width: 100%; margin-bottom: 15px;">
                          	<option>선택하세요</option>
                          	<c:forEach items="${memberList}" var="memberList" varStatus="loop">
                          		<option value="${memberList.id}">${memberList.name}</option>
						</c:forEach>
                    </select>
                    <div style="margin-left: 5px; margin-top: 15px;">
					<input class="chalBtn" type="button" onclick="saveWithFriend();" value="초대하기" style="text-align: center; position: relative; left: 70px;" >
					</div>
	            </div>
	        <a class="closeBtn" onclick="closeModal2()" style="border: none;"></a>
	        </div>
	        
		  </div>
		</div>

		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type="text/javascript">
		 const open = () => {
		   document.querySelector(".modal").classList.remove("hidden");
		 }
		
		 const close = () => {
		   document.querySelector(".modal").classList.add("hidden");
		   document.querySelector(".modal2").classList.add("hidden");
		 }
		
		 document.querySelector(".openBtn").addEventListener("click", open);
		 document.querySelector(".closeBtn").addEventListener("click", close);
		 document.querySelector(".bg").addEventListener("click", close);
		 document.querySelector(".bg2").addEventListener("click", close);
		 
		 function openModal(categoryCode, categoryName, price) {
			 $("#challengeModalTitle").text("<%=month%>월 " + categoryName + " 소비 금액");
			 $("#challengeModalPrice").text(price);
			 $("#consumeCode").val(categoryCode);
			 document.querySelector(".modal").classList.remove("hidden");
		 }
		 
		 function openModal2() {
			 document.querySelector(".modal").classList.add("hidden");
			 document.querySelector(".modal2").classList.remove("hidden");
		 }
		 
		 function closeModal() {
			 document.querySelector(".modal").classList.add("hidden");
		 }
		 
		 function closeModal2() {
			 document.querySelector(".modal2").classList.add("hidden");
		 }
		 
		 var input = document.getElementById("goal");
		 input.value = null;
		 
		 function saveAlone(){
			 $("#challengeType").val("a");
			 document.form1.submit();
		 }
		 
		 
		 function saveWithFriend(){ 
			  $("#challengeType").val("b");
	          $("#friendId").val($("#friendList").val()); 
	          document.form1.submit();
			
		 } 
		 	
		 </script>
	</main>
	
	
 
</body>
</html>