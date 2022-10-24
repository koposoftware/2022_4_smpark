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
<link rel="stylesheet" href="/style/css/main.css" />
<link rel="stylesheet" href="/style/css/theme.css" /> 
<link rel="stylesheet" href="/style/css/main2.css" />
<link rel="stylesheet" href="/style/css/table.css" />
<link rel="stylesheet" href="/style/css/bootstrap.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>

<style>
	@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body
	.btn{padding:0;background:transparent;border:0;outline:0}
	.clearfix::after{display:block;content:'';clear:both}
	
	.tab_wrap{width:1100px;margin:50px auto}
	.tab_wrap .btn_tab{float:left;width:120px;height:50px;background:#fff;border-radius:10px 10px 0 0;text-align:center;line-height:30px; box-shadow: none; border: 1.5px solid #099a96; border-bottom: 2px solid #099a96;}
	.tab_wrap .btn_tab.act{background:#099a96;font-weight:bold; box-shadow: none; color: white;}
	.tab_wrap .content_area{display:none;width:100%;min-height:200px;padding:10px;background:#fff;border-radius:0 0 10px 10px;box-sizing:border-box; box-shadow: none; font-family: "Rubik", "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";}
	.tab_wrap .content_area.act{display:block; box-shadow: none;}
	.tab_wrap *[data-depth="1"]{background:#f4f4f4}
	
	#accountList {
		padding: 10px;
		margin-bottom: 10px;
		border: 2px solid rgb(9,154,150);
		box-shadow:  6px 6px rgba(21,65,64,0.2);
		border-radius: 20px;
	}
	
	#accountList2 {
		padding: 10px;
		background-color : rgb(9,154,150);
		margin-bottom: 10px;
		border: 2px solid rgb(9,154,150);
		box-shadow:  6px 6px rgba(21,65,64,0.2);
		border-radius: 20px;
		
	}
	.u.i-progressbar { position:relative; }
    .progress-label {
        position:absolute;
        left:50%;
        top:8px;
        font-weight:bold;
        margin-left:-40px;
    }
    
    #challengeList{
    	padding: 10px;
		margin-bottom: 10px;
		border: 2px solid rgb(9,154,150);
		box-shadow:  6px 6px rgba(21,65,64,0.2);
		border-radius: 20px;
    }
    
    #closeBtn{
	   background-color: rgb(9,154,150);
	   margin-right: 40%;
       padding: 8px 10px;
       border-radius: 4px;
       cursor: pointer;
       width: 100px;
       color: white;
       border: 1px solid rgb(9,154,150);
       font-family : "Rubik", "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
	}
	
	  #closeBtn1{
	   background-color: rgb(9,154,150);
	   margin-right: 40%;
       padding: 8px 10px;
       border-radius: 4px;
       cursor: pointer;
       width: 100px;
       color: white;
       border: 1px solid rgb(9,154,150);
       font-family : "Rubik", "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
	}
</style>

</head>
<body>
<%
	double sixmonth = 24;
	double my = 11;
	double progress = Math.round(my / sixmonth * 100);
	
	
%>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header> 
	
	<main class="hana__main-wrap" style="margin: 180px 140px">
		<div class="tab_wrap tab_area">
			<div class="btn_area clearfix" style="float: right" >
			  <button class="btn btn_tab act" data-depth="0" data-idx="0">내 계좌</button>
			  <button class="btn btn_tab" data-depth="0" data-idx="1">나의 적금</button>
			  <button class="btn btn_tab" data-depth="0" data-idx="2">나의 도전</button>
			  <button class="btn btn_tab" data-depth="0" data-idx="3">내 정보</button>
			</div>
		  <div style="border-bottom: 2px solid #099a96 ; height: 50px; width: 70%; margin-left: 0px;"> <p style="font-size: 25px; padding-top: 10px; padding-left: 15px; font-weight: bold;">${ loginVO.name}님, 안녕하세요 :) </p></div>
			<div class="tab_wrap tab_area" style="margin-top: 80px;"> 
			  <%--계좌 --%>
			  <div class="content_area act" data-depth="0" data-idx="0" align="center">
			  <div class="row">
			  <c:forEach items="${selectAccount}" var="selectAccount" varStatus="loop" >
			  	 	<c:if test="${selectAccount['ACCOUNTCODE'] eq 01}">
						<div style="margin-bottom : 3%; width: 48%; padding: 0 0 50px 50px" align="center">
						<div class="card" id="accountList" style="height: 200px;">
							<div>
							<img src ="./image/img/hanalogo.png" style="width: 60px; float: left; margin-left: 10px; margin-top: 20px">
							<h5 class="fw-bold font-sans-serif" style="margin-top: 25px; font-size: 20px; margin-left: 85px;"align="left">${ selectAccount['ACCOUNTNUM'] }</h5>
							<h5 class="fw-bold font-sans-serif" style="margin-top: 10px; font-size: 20px; margin-left: 85px;"align="left">${ selectAccount['ACCOUNTNAME'] }</h5>
							<h5 class="fw-bold font-sans-serif" style="margin-top: 20px; font-size: 18px; margin-right: 30px; margin-bottom: px;" align="right">잔액 : <fmt:formatNumber value="${ selectAccount['BALANCE'] }" pattern="#,###원"/></h5>
							<br>
							
							  <div>
							<a class="listBtn" style="font-family: 'InfinitySans-RegularA1';" href="${pageContext.request.contextPath}/translist?accountNum=${ selectAccount['ACCOUNTNUM'] }">내역보기</a>
							  </div>
							</div>
						</div>
						</div>
					</c:if>
					<c:if test="${selectAccount['ACCOUNTCODE'] eq 02}">
						<div style="margin-bottom : 3%; width: 48%; padding: 0 0 50px 50px" align="center">
						<div class="card" id="accountList2" style="height: 200px;">
							<div>
							<img src ="./image/img/hanalogo.png" style="width: 60px; float: left; margin-left: 10px; margin-top: 20px;">
							<h5 class="fw-bold font-sans-serif" style="margin-top: 25px; font-size: 20px; margin-left: 85px; color: white;"align="left">${ selectAccount['ACCOUNTNUM'] }</h5>
							<h5 class="fw-bold font-sans-serif" style="margin-top: 10px; font-size: 20px; margin-left: 85px; color: white;"align="left">${ selectAccount['ACCOUNTNAME'] }</h5>
							<h5 class="fw-bold font-sans-serif" style="margin-top: 20px; font-size: 18px; margin-right: 30px; margin-bottom: 8px; color: white;" align="right">잔액 : <fmt:formatNumber value="${ selectAccount['BALANCE'] }" pattern="#,###원"/></h5>
							 
							<br>
							
							  <div>
							<a class="listBtn" style= "font-family: 'InfinitySans-RegularA1';"href="${pageContext.request.contextPath}/translist?accountNum=${ selectAccount['ACCOUNTNUM'] }">내역보기</a>
							  </div>
							</div>
						</div>
						</div>
					</c:if>
			   
			  </c:forEach>
			  </div>
			  </div>
			  <%--적금 --%>
			  <div class="content_area" data-depth="0" data-idx="1">
				  <div class="row">
				  	 <c:forEach items="${joinsavingList}" var="joinsavingList" varStatus="loop" >
			  	 		<c:if test="${joinsavingList['SAVINGCODE'] eq 1 }">
							<div style="margin-bottom : 3%; width: 48%; padding: 0 0 50px 50px" align="center">
								<div class="card" id="accountList" style="height: 200px;">
									<div>
									<img src ="./image/img/musinsalogo.png" style="width: 80px; float: left; margin: 0px 10px 0px 10px;">
									<h5 class="fw-bold" style="margin-top: 25px; font-size: 20px; margin-left: 120px; font-family: 'InfinitySans-RegularA1';"align="left">${ joinsavingList['SAVINGNAME'] }</h5>
									<h5 class="fw-bold font-sans-serif" style="margin-top: 10px; font-size: 20px; margin-left: 122px; font-family: 'InfinitySans-RegularA1';"align="left"><fmt:formatNumber value="${ joinsavingList['COLLECTAMOUNT'] }" pattern="#,###원"/></h5>
									<div class="progress" style="width: 70%; height:22px; margin-left: 100px; margin-top: 20px; margin-bottom: 5px;" >
									  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40"
									  aria-valuemin="0" aria-valuemax="100" style="width:46%; font-size: 15px; background-color: orange;" >
									    <%=progress%>%
									  </div>
									</div>
									<br>
									
									  <div>
									<a class="listBtn" style="font-family: 'InfinitySans-RegularA1';" href="${pageContext.request.contextPath}/savingdetail?savingCode=${joinsavingList['SAVINGCODE']}">자세히 보기</a>
									  </div>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${joinsavingList['SAVINGCODE'] eq 2 }">
							<div style="margin-bottom : 3%; width: 48%; padding: 0 0 50px 50px" align="center">
								<div class="card" id="accountList" style="height: 200px;">
									<div>
									<img src ="./image/img/oliveyounglogo.png" style="width: 60px; float: left; margin-left: 10px; margin-top: 20px">
									<h5 class="fw-bold font-sans-serif" style="margin-top: 25px; font-size: 20px; margin-left: 85px;"align="left">${ joinsavingList['SAVINGNAME'] }</h5>
									<h5 class="fw-bold font-sans-serif" style="margin-top: 10px; font-size: 20px; margin-left: 85px;"align="left">${ joinsavingList['COLLECTAMOUNT'] }</h5>
									<div class="progress" style="width: 70%; height:20px; margin-left: 100px; margin-top: 20px; margin-bottom: 5px;" >
									  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40"
									  aria-valuemin="0" aria-valuemax="100" style="width:0%;">
									    0%
									  </div>
									</div>
									<br>
									
									  <div>
									<a class="listBtn" style="font-family: 'InfinitySans-RegularA1';" href="${pageContext.request.contextPath}/savingdetail?savingCode=${joinsavingList['SAVINGCODE']}">자세히 보기</a>
									  </div>
									</div>
								</div>
							</div>
						</c:if>
				
			   
			  </c:forEach>
				  
				  </div>
			  </div>
			  <%-- 도전하기 --%>
			  <div class="content_area" data-depth="0" data-idx="2" align="center">
	  		 	<c:forEach items="${challengeList}" var="challengeList" varStatus="loop" >
				<c:if test="${challengeList['TYPE'] eq 'a' }">
							<div style="margin-bottom : 3%; width: 70%; padding: 0 0 50px 00px" align="center">
								<div class="card" id="challengeList" style="height: 280px;">
									<div>
									<h5 class="fw-bold" style="margin-top: 15px; font-size: 23px; margin-left: 25px; font-family: 'InfinitySans-RegularA1';"align="left">${ challengeList['MONTH'] }월 ${ challengeList['CONSUMECATEGORY'] }줄이기</h5>
										
										<div style="margin-top: 15px;" align="left">
											<a class="fw-bold font-sans-serif" style="margin-top: 15px; font-size: 18px; margin-left: 28px; margin-right: 300px; display: inline-block; font-family: 'InfinitySans-RegularA1';" > 현재 소비 금액</a>
											<a class="fw-bold font-sans-serif" style="margin-top: 15px; font-size: 18px; margin-left: 25px; text-align: left; font-family: 'InfinitySans-RegularA1';" > 목표 소비 금액</a>
										</div>
										<div style="margin-top: 10px;" align="left">
											<a class="font-sans-serif" style="font-size: 18px; margin-left: 30px; margin-right: 338px; display: inline-block; font-family: 'InfinitySans-RegularA1';" > <fmt:formatNumber value="${ challengeList['NOWSPANDING'] }" pattern="#,###원"/></a>
											<a class="font-sans-serif" style="margin-top: 15px; font-size: 18px; margin-left: 15px; text-align: left; font-family: 'InfinitySans-RegularA1';" > <fmt:formatNumber value="${ challengeList['CHALLENGEGOAL'] }" pattern="#,###원"/></a>
										</div>
										
									<div class="progress" style="width: 90%; height:25px; margin-left: -10px; margin-top: 30px; margin-bottom: 5px; margin-right: 10px;" align="left">
									 
									    	<c:choose>
									    		
									    		<c:when test="${ (challengeList['CHALLENGEGOAL'] - challengeList['NOWSPANDING']) lt 0 }">
													  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40" 
													  	aria-valuemin="0" aria-valuemax="100" style="font-size : 15px; width: ${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }%; background-color : red;">		
													  	<fmt:formatNumber  value="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }" />%
													  </div>	
									    		</c:when>
									    		
								    			<c:when test="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 gt 80 }">
												  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40" 
												  	aria-valuemin="0" aria-valuemax="100" style="font-size : 15px; width: ${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }%; background-color : orange;">		
												  	<fmt:formatNumber  value="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }" />%
												  </div>	
								    			</c:when> 
								    			
								    			<c:otherwise>
							    				  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40" 
												  	aria-valuemin="0" aria-valuemax="100" style="font-size : 15px; width: ${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }%; background-color : green; ">		
												  <fmt:formatNumber  value="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }" />%
												   
												  </div>	
								    			</c:otherwise>
									    	</c:choose>
									    	
									  </div>

									  <div style="margin-top: 20px; font-family: 'InfinitySans-RegularA1'; margin-right: 50px;" align="right">
										<a>  혼자서 도전중 </a>
									  </div>
									  <div style="margin-top: 20px;">
										<button class="listBtn2" style="font-family: 'InfinitySans-RegularA1'; position: relative; bottom: 2px;" data-toggle="modal" data-target="#exampleModal" id="openModal">자세히 보기</button>
									  </div>
									</div>
								</div>
							</div>
						</c:if>
						
						<c:if test="${challengeList['TYPE'] eq 'b' }">
							<div style="margin-bottom : 3%; width: 70%; padding: 0 0 50px 00px" align="center">
								<div class="card" id="challengeList" style="height: 280px;">
									<div>
									<h5 class="fw-bold" style="margin-top: 15px; font-size: 23px; margin-left: 25px; font-family: 'InfinitySans-RegularA1';"align="left">${ challengeList['MONTH'] }월 ${ challengeList['CONSUMECATEGORY'] }줄이기</h5>
										
										<div style="margin-top: 15px;" align="left">
											<a class="fw-bold font-sans-serif" style="margin-top: 15px; font-size: 18px; margin-left: 28px; margin-right: 300px; display: inline-block; font-family: 'InfinitySans-RegularA1';" > 현재 소비 금액</a>
											<a class="fw-bold font-sans-serif" style="margin-top: 15px; font-size: 18px; margin-left: 25px; text-align: left; font-family: 'InfinitySans-RegularA1';" > 목표 소비 금액</a>
										</div>
										<div style="margin-top: 10px;" align="left">
											<a class="font-sans-serif" style="font-size: 18px; margin-left: 30px; margin-right: 338px; display: inline-block; font-family: 'InfinitySans-RegularA1';" > <fmt:formatNumber value="${ challengeList['NOWSPANDING'] }" pattern="#,###원"/></a>
											<a class="font-sans-serif" style="margin-top: 15px; font-size: 18px; margin-left: 15px; text-align: left; font-family: 'InfinitySans-RegularA1';" > <fmt:formatNumber value="${ challengeList['CHALLENGEGOAL'] }" pattern="#,###원"/></a>
										</div>
										
									<div class="progress" style="width: 90%; height:25px; margin-left: -10px; margin-top: 30px; margin-bottom: 5px; margin-right: 10px;" align="left">
									 
									    	<c:choose>
									    		
									    		<c:when test="${ (challengeList['CHALLENGEGOAL'] - challengeList['NOWSPANDING']) lt 0 }">
													  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40" 
													  	aria-valuemin="0" aria-valuemax="100" style="font-size : 15px; width: ${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }%; background-color : red;">		
													  	<fmt:formatNumber  value="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }" />%
													  </div>	
									    		</c:when>
									    		
								    			<c:when test="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 gt 80 }">
												  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40" 
												  	aria-valuemin="0" aria-valuemax="100" style="font-size : 15px; width: ${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }%;">		
												  	<fmt:formatNumber  value="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }" />%
												  </div>	
								    			</c:when> 
								    			
								    			<c:otherwise>
							    				  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="40" 
												  	aria-valuemin="0" aria-valuemax="100" style="font-size : 15px; width: ${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }%; background-color : green; ">		
												  <fmt:formatNumber  value="${ challengeList['NOWSPANDING'] * 100 / challengeList['CHALLENGEGOAL'] * 100 / 100 }" />%
												   
												  </div>	
								    			</c:otherwise>
									    	</c:choose>
									    	
									  </div>

									  <div style="margin-top: 20px; font-family: 'InfinitySans-RegularA1'; margin-right: 50px;" align="right">
										<a>  친구와 함께 도전중 </a>
									  </div>
									  <div style="margin-top: 20px;">
										<button class="listBtn2" style="font-family: 'InfinitySans-RegularA1'; position: relative; bottom: 2px;" data-toggle="modal" data-target="#exampleModal" id="openModal">자세히 보기</button>
										
									  </div>
									</div>
								</div>
							</div>
						</c:if>		
			       <!-- Modal -->
       
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document" style="margin-top: 140px;">
					    <div class="modal-content" style="width: 120%; margin-left: -20%;">
					        <div class="modal-header">
						        <h5 class="modal-title fw-bold font-sans-serif" id="exampleModalLabel" style="color: #555; font-size: 23px;">도전 상세보기</h5>
						        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true"></span>
						        </button>
					        </div>
					      	<div class="modal-body" style="margin-bottom: 10px;">
					    		<form name="challengeDetail">
					    			<input type="hidden" name="rate" value="${challengeList['PENALTYRATE']}">
								    <table border=1  width=100% style="margin-left: 20px;">
								    	<tbody>
								    	  <tr>
									        <td>도전상태</td>
									        <td>
									          <c:choose>
									          	<c:when test="${ (challengeList['CHALLENGEGOAL'] - challengeList['NOWSPANDING']) lt 0 }">
									          		<a style="color: red">실패</a>
									          	</c:when>
									          	<c:otherwise>
									          		<a style="color: blue">성공</a>
									          	</c:otherwise>
									          </c:choose>
									        </td>
									      </tr>
									      <tr>
									        <td>목표금액</td>
									        <td>
									          <input style="border: none; color: #555;" type="text" name="goal"value="<fmt:formatNumber value="${challengeList['CHALLENGEGOAL']}" pattern="#,###원" />" readonly>
							
									        </td>
									      </tr>
									      <tr>
									        <td>소비금액</td>
									        <td>
									           <input style="border: none; color: #555;" type="text" name="spanding"value="<fmt:formatNumber value="${challengeList['NOWSPANDING']}" pattern="#,###원" />" readonly>
									        </td>
									      </tr>
									      <tr>
									        <td>패널티</td>
									          <th id="penalty" style="padding-left: 11px; color: #555;"></th>
									      </tr>
								        </tbody>
								    </table>
								  </form>			    
					        </div>
			                <div class="modal-footer">
			                   <button type="button" data-dismiss="modal" aria-label="Close" id="closeBtn"> <span aria-hidden="true">닫기</span></button>
			                   
			                </div>
				    	</div>
					  </div>    
					 </div> 
					  <!-- Modal -->
       
					<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document" style="margin-top: 140px;">
					    <div class="modal-content" style="width: 120%; margin-left: -20%;">
					        <div class="modal-header">
						        <h5 class="modal-title fw-bold font-sans-serif" id="exampleModalLabel" style="color: #555; font-size: 23px;">도전 상세보기</h5>
						        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true"></span>
						        </button>
					        </div>
					      	<div class="modal-body" style="margin-bottom: 10px;">
					    		<form name="challengeDetail">
					    			<input type="hidden" name="rate" value="${challengeList['PENALTYRATE']}">
								    <table border=1  width=100% style="margin-left: 20px;">
								    	<tbody>
								    	  <tr>
									        <td>도전상태</td>
									        <td>
									          <c:choose>
									          	<c:when test="${ (challengeList['CHALLENGEGOAL'] - challengeList['NOWSPANDING']) lt 0 }">
									          		<a style="color: red">실패</a>
									          	</c:when>
									          	<c:otherwise>
									          		<a style="color: blue">성공</a>
									          	</c:otherwise>
									          </c:choose>
									        </td>
									      </tr>
									      <tr>
									        <td>목표금액</td>
									        <td>
									          <input style="border: none; color: #555;" type="text" name="goal"value="<fmt:formatNumber value="${challengeList[1]['CHALLENGEGOAL']}" pattern="#,###원" />" readonly>
							
									        </td>
									      </tr>
									      <tr>
									        <td>소비금액</td>
									        <td>
									           <input style="border: none; color: #555;" type="text" name="spanding"value="<fmt:formatNumber value="${challengeList['NOWSPANDING']}" pattern="#,###원" />" readonly>
									        </td>
									      </tr>
									      <tr>
									        <td>패널티</td>
									          <th id="penalty" style="padding-left: 11px; color: #555;"></th>
									      </tr>
								        </tbody>
								    </table>
								  </form>			    
					        </div>
			                <div class="modal-footer">
			                   <button type="button" data-dismiss="modal" aria-label="Close" id="closeBtn1"> <span aria-hidden="true">닫기</span></button>
			                   
			                </div>
				    	</div>
					  </div>    
					 </div>  	 			 	 			
			  </c:forEach>
			 
			  
			  </div>
			</div>
		</div>
  		
	
	</main>

<script>
let form = document.forms.challengeDetail;

form.goal.oninput = challengeDetail;
form.spanding.onchange = challengeDetail;
form.rate.oninput = challengeDetail;

function challengeDetail() {
  let goal = parseInt(form.goal.value.replace(/,/g , ''));
  if (!goal) return;
  console.log("goal : " + goal);
  
  let spanding = parseInt(form.spanding.value.replace(/,/g , ''));
  if (!spanding) return;
  console.log("spanding : " +spanding);
  
  let rate = parseInt(form.rate.value);
  if (!rate) return;
  console.log("rate : "+ rate);
  console.log(rate / 100);
  
  let result = spanding * (rate / 100);
  
  console.log(result);
  document.getElementById('penalty').innerHTML = result.toLocaleString() +"원";
  
}

challengeDetail();
 
$('#openModal').click(function(e){
    e.preventDefault();
    $('#exampleModal').modal("show");
 });
 
$('#openModal1').click(function(e){
    e.preventDefault();
    $('#exampleModal1').modal("show");
 });
 
 $('#closeBtn').click(function(){
	 $('#exampleModal').modal("hide");
 })

  $('#closeBtn1').click(function(){
	 $('#exampleModal1').modal("hide");
 })
 
function findParent(el, className){
	  let check = el.parentNode.classList.contains(className);
	  
	  if(check === true){
	     return el.parentNode;
	  }else{
	    return findParent(el.parentNode, className);
	  }
	}

	function bindingTabEvent(wrap){
	  let wrapEl = document.querySelectorAll(wrap);
	  
	  wrapEl.forEach(function(tabArea){
	    let btn = tabArea.querySelectorAll('.btn_tab');
	    
	    btn.forEach(function(item){
	      item.addEventListener('click', function(){
	        let parent = findParent(this, 'tab_area');
	        let idx = this.dataset['idx'];
	        let depth = this.dataset['depth'];
	        let btnArr = parent.querySelectorAll('.btn_tab[data-depth="'+ depth +'"]');
	        let contentArr = parent.querySelectorAll('.content_area[data-depth="'+ depth +'"]');
	        
	        btnArr.forEach(function(btn){ btn.classList.remove('act'); });
	        this.classList.add('act');
	        contentArr.forEach(function(content){ content.classList.remove('act'); });
	        parent.querySelector('.content_area[data-idx="'+ idx +'"][data-depth="'+ depth +'"]').classList.add('act');
	      });
	    });
	  });
	}

	bindingTabEvent('.tab_wrap');
</script>
</body>
</html>