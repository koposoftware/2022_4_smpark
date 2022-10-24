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

<script>
	var selectBalance = [];
	<c:forEach items="${selectAccount}" var="selectAccount" varStatus="loop">
		selectBalance[${loop.index}] = ${selectAccount['BALANCE']};
	</c:forEach>

	var selectBoxChange1 = function(value){
		console.log("값변경test : " + value);
		$("#endDate").val(value);
		
		var idx = $("#accountNum option").index( $("#accountNum option:selected") );
		if(idx == 0) {
			$("#accountBalance").html("");
		} else {
			$("#accountBalance").html('현재 잔액 : ' + selectBalance[idx-1].toLocaleString() + '원' +'<br>' +' 출금 가능 금액 : ' + selectBalance[idx-1].toLocaleString() + '원');
			
			
		}
	}
	
	var selectBoxChange2 = function(value){
		console.log("값변경test2 : " + value);
		$("#accountNum").val(value);
	}
</script>
<style>

	.chal:after{
	       	content: "";
	        display: block;
	        width: 60px;
	        border-bottom: 1.5px solid rgb(9,154,150);
	        margin: 0px auto;
    }
	#accountNum{
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
	
	#accountNum::-ms-expand {       
	 	display: none;
	}
	
	#password, #joinAmount {
		padding: .5em .5em; 
		border: 1px solid #999;
		font-family: inherit;
		border-radius: 0px; 
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	
	#joinAmount::-webkit-input-placeholder {
	  text-align: right;
	  color : black !important;
	}
	
	#password::-webkit-input-placeholder {
	  color : black !important;
	}
	
	.enddate {
    padding: 10px 10px;
	}
	
	.enddate input[type=radio]{
	    display: none;
	}
	.enddate input[type=radio]+label{
	    display: inline-block;
	    cursor: pointer;
	    height: 35px;
	    width: 150px;
	    border: 1px solid #333;
	    line-height: 24px;
	    text-align: center;
	    font-size:15px;
	}
	.enddate input[type=radio]+label{
	    background-color: #fff;
	    color: #333;
	    padding-top: 5px;
	}
	.enddate input[type=radio]:checked+label{
	    background-color: #333;
	    color: #fff;
	}
	
	.pe {
    padding: 10px 10px;
	}
	
	.pe input[type=radio]{
	    display: none;
	}
	.pe input[type=radio]+label{
	    display: inline-block;
	    cursor: pointer;
	    height: 35px;
	    width: 202px;
	    border: 1px solid #333;
	    line-height: 24px;
	    text-align: center;
	    font-size:15px;
	}
	.pe input[type=radio]+label{
	    background-color: #fff;
	    color: #333;
	    padding-top: 5px;
	}
	.pe input[type=radio]:checked+label{
	    background-color: #333;
	    color: #fff;
	}
	
	

</style>
</head>
<body>
<%
	int savingCode = Integer.parseInt(request.getParameter("savingCode"));
	float interestrate = Float.parseFloat(request.getParameter("interestRate"));
	
	LocalDate tday = LocalDate.now();	
	LocalDate plus6month = tday.plusMonths(6);
	LocalDate plus12month = tday.plusMonths(12);
	LocalDate plus18month = tday.plusMonths(18);
	LocalDate plus24month = tday.plusMonths(24);
	
	String savingName = request.getParameter("savingName");

%>

	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header> 
	<main class="hana__main-wrap" style="margin: 155px 140px">
      <section class="pt-3 pb-7 ">
         <div align="center">
            <h2 align="center" class="container-fluid fw-bold font-sans-serif py-4" style= "font-size: 30px;"><%=savingName %> 가입</h2>   
            <a class="chal"></a>
         </div> 
            <div class="container" style="width: 70%; margin-top: 50px;">
             <div class="row justify-content-center">
                    <div class="form-floating"> 
                  <form id="form3" action="${pageContext.request.contextPath}/shoppingProductJoinProc" method="post">
                     <input type="hidden" id="savingCode" name="savingCode" value="<%=savingCode%>" >
                     <input type="hidden" id="interestRate" name="interestRate" value="<%=interestrate %>">
                     <input type="hidden" id="savingName" name="savingName" value="<%=savingName%>">
                            <table border=1  width=100%>
                            	<thead>
                             <tr class="tab-3">
                                <th style="width:30%; font-weight: bold; font-size: 23px; padding-bottom: 20px;">기본정보</th>
                             </tr>
                             </thead>
                            <tbody>
                            <tr>
                               <td style="height: 150px; border-right: 1px solid #e9ecef; font-size: 18px; color: #343a40">출금계좌번호</td>
                               <td class="table-light">
                                   <select id="accountNum" name="accountNum" onchange="selectBoxChange1(this.value);" style="border-color: #adb5bd; width: 100%;">
	                               	<option>선택하세요</option>
	                               	<c:forEach items="${selectAccount}" var="selectAccount" varStatus="loop">
	                               		<option value="${selectAccount['ACCOUNTNUM']}">${selectAccount['ACCOUNTNUM']}</option>
									</c:forEach>
	                               </select>
	                               <div style="margin-top: 40px; padding-right: 20px; font-size: 16.5px; line-height: 1.3" align="right">
	                               <span id="accountBalance"></span>
	                               </div>
                               </td>
                            </tr>
                           
                            <tr>
                            	<td class="table-light" style="height: 50px; border-right: 1px solid #e9ecef; font-size: 18px; color: #343a40; padding-top: 16px;">계좌비밀번호</td>
                            	<td><input type="password" id="password" style="width: 100%; border: 1px solid #adb5bd;" placeholder="비밀번호 4자리를 입력하세요"></td>
                            </tr>
                            </tbody>
                            </table>
                            
                            <div style="margin-top: 80px;">
                            <table border=1  width=100%>
                            	<thead>
                            		<tr class="tab-3">
                            			 <th style="width:30%; font-weight: bold; font-size: 23px; padding-bottom: 20px;">상품정보</th>
                            		</tr>
                            	</thead>
                            	<tbody>
                            		<tr>
                            			<td style="height: 80px; border-right: 1px solid #e9ecef; font-size: 18px; color: #343a40; padding-top: 30px;">가입금액</td>
                            			<td class="table-light">
                            				<input type="text" id="joinAmount" name="joinAmount" style="width: 100%;" placeholder="원" >
                            			</td>
                            		</tr>
                            		<tr>
                            			<td style="height: 50px; border-right: 1px solid #e9ecef; font-size: 18px; color: #343a40">가입기간</td>
                            			<td class="table-light">
                            				<div class="enddate">
                            				 <input type="radio" id="enddate1" name="endDate" value="<%=plus6month%>"><label for="enddate1">6개월</label>
                            				 <input type="radio" id="enddate2" name="endDate" value="<%=plus12month%>"><label for="enddate2">12개월</label>
                            				 <input type="radio" id="enddate3" name="endDate" value="<%=plus18month%>"><label for="enddate3">18개월</label>
                            				 <input type="radio" id="enddate4" name="endDate" value="<%=plus24month%>"><label for="enddate4">24개월</label>
                            				</div>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td style="height: 50px; border-right: 1px solid #e9ecef; font-size: 18px; color: #343a40">이체주기</td>
                            			<td class="table-light">
                            				<div class="pe">
                            				 <input type="radio" id="period1" name="period" value="매일"><label for="period1">매일</label>
                            				 <input type="radio" id="period2" name="period" value="매주"><label for="period2">매주</label>
                            				 <input type="radio" id="period3" name="period" value="매월"><label for="period3">매월</label>
                            				</div>
                            			</td>
                            		</tr>
                            	</tbody>
                            </table>
                            </div>         
                            <div style="margin-top: 100px;" align="center">      
                            <input class="homeBtn" type="submit" value="가입하기" style="text-align: center; width: 150px; font-size: 18px; margin-right: 20px;" > 
                  			<button class="homeBtn2"> 취소</button>
                  			</div>
                  </form> 
                  
               </div>          
             </div>
          </div>
      </section>

   </main>

</body>
</html>