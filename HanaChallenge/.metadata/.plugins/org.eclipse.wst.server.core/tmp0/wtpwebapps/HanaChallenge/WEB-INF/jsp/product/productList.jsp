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
<link rel="stylesheet" href="/style/css/theme.css" /> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/style/css/bootstrap.css" />
<link rel="stylesheet" href="/style/css/main2.css" />
<link rel="stylesheet" href="/style/css/table.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="/style/css/main.css" />
<script src="https://kit.fontawesome.com/b3a7369db8.js" crossorigin="anonymous"></script>
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
	.tab_wrap .btn_tab{float:left;width:125px;height:50px;background:#fff;border-radius:50px;text-align:center;line-height:30px; box-shadow: none; border: 2px solid #099a96; margin-right: 25px; }
	.tab_wrap .btn_tab.act{background:#099a96;font-weight:bold; box-shadow: none; color: white;}
	.tab_wrap .content_area{display:none;width:100%;min-height:200px;padding:10px;background:#fff;border-radius:0 0 10px 10px;box-sizing:border-box; box-shadow: none; font-family: "Rubik", "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";}
	.tab_wrap .content_area.act{display:block; box-shadow: none; margin-top: 75px;}
	.tab_wrap *[data-depth="1"]{background:#f4f4f4}
	
	  .chal:after{
       	content: "";
        display: block;
        width: 60px;
        border-bottom: 1.5px solid rgb(9,154,150);
        margin: 0px auto;
       }
       
      #calculate{
      	padding: 10px;
		margin-bottom: 10px;
		border: 3px solid rgb(9,154,150);
		box-shadow:  6px 6px rgba(21,65,64,0.2);
		border-radius: 20px;
      }
      
      .searchbtn{
      	width: 725px; float: right; border: 2px solid rgb(9,154,150); border-radius: 5px; padding-left: 10px; margin-right: 60px;
      	height: 50px;
      }
      
       #search::-webkit-input-placeholder {
		  color : grey !important;
		  font-size: 18px;
		}
	   #search:focus {outline: none;}
	   #saving {width: 25px; background-color: rgb(9,154,150); color: white; padding: 3px 10px 3px 10px; position: relative; top: 20px;left: -425px; bottom: 20px;}
	   #savingName{font-size: 20px; position: relative; top: 40px; left: 55px;}
	   #savingDetail{font-size: 18px; position: relative; left: 55px; top: 50px;}
	   #max{position: relative; font-size: 13px; left: 428px; top: -10px;}
	   #primerate{color: rgb(9,154,150); font-size: 25px; font-family:'InfinitySans-RegularA1'; position: relative; right: 36px; font-weight: bold; margin-bottom: 40px; top: -5px;}
	   #favorite, #favorite2{position: relative; top: 22px; right: 430px;}
	   #keyword:focus {outline: none;}
	   
	   td {
	     border-bottom: none; font-size: 18px; font-weight: bold; width: 100px;	
	   }
	   
	   th {font-size: 17px; color: #555; font-weight: 600;}
	   
	   #months1{
		width: 380px; 
		padding: .8em .5em; 
		border: 1px solid #999;
		font-family: inherit;  
		background: url(../../image/img/selectbox.png) no-repeat 95% 50%; 
		border-radius: 0px; 
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
		height: 40px;
		font-size: 15px;
	}
	
	#months1::-ms-expand {       
	 	display: none;
	}
	
	#money1::-webkit-input-placeholder {
	  text-align: right;
	  color : black !important;
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
	
</style>
</head>
<body>

	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	<main class="hana__main-wrap" style="margin: 150px 140px">
		<h1 align="center" style="font-size: 32px; font-weight: bold;" class="container-fluid fw-bold font-sans-serif py-4">적금 상품</h1>
		<a class="chal"></a> 
		 <div class="tab_wrap tab_area">
		   <form action="" method="GET">
			    <div class="searchbtn">
			    
		<%
			String keyword = "";
			if(request.getParameter("keyword") != null ) {
				keyword = request.getParameter("keyword");
			}
		%>			    
			    	
			        <input autocomplete="off" name="keyword" id="keyword" value="<%=keyword%>" type="text" placeholder="검색어를 입력해주세요" style="border: none; height: 40px; margin-top: 3px; width: 92%">
			    	
			    	<div style="display: inline-block; position: relative; top: 6px;">
			    		<button style="border: none; background: none;"><img src = "/image/img/serach.png" style="width: 28px; float: right; "></button>
			    	</div>
			    </div>		
			</form>
           <div class="btn_area clearfix" style="float: right; margin-top: 20px; padding-left: -50px; margin-right: 35px;">
              <button class="btn btn_tab" data-depth="0" data-idx="1">쇼핑/뷰티</button>
			  <button class="btn btn_tab" data-depth="0" data-idx="2">배달/외식</button>
			  <button class="btn btn_tab" data-depth="0" data-idx="3">여행/숙박</button>
			  <button class="btn btn_tab" data-depth="0" data-idx="4">카페/디저트</button>
			  <button class="btn btn_tab" data-depth="0" data-idx="5">편의점/마트</button>
           </div>
           <button data-toggle="modal" data-target="#exampleModal" id="openModal" style="position: relative; border: none; background: none; left: 55px; width: 20%; top: -3px;">
           <div class= "card" id="calculate" style="height: 110px; width: 100%;  top: 1px; border-radius: 10px; border: 2px solid rgb(9,154,150); background-color: rgba(9,154,150,0.8)">
	           	<a class="fw-bold font-sans-serif" style="font-size: 20px; text-align: center; margin-top: 35px; color: white;">적금 이자 계산기</a>
           </div>
           </button> 
           <!-- Modal -->
       
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document" style="margin-top: 140px;">
			    <div class="modal-content" style="width: 120%; margin-left: -20%;">
			        <div class="modal-header">
				        <h5 class="modal-title fw-bold font-sans-serif" id="exampleModalLabel" style="color: #555; font-size: 23px;">적금 이자 계산기</h5>
				        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true"></span>
				        </button>
			        </div>
			      	<div class="modal-body" style="margin-bottom: 20px;">
			    		<form name="calculator">
						    <table border=1  width=100% style="margin-left: 20px;">
						    	<tbody>
							      <tr>
							        <td>예치금액</td>
							        <td>
							          <input name="money" id="money1"  value="" required style="width: 380px; height:40px; border: 1px solid #adb5bd;" placeholder="원">
							        </td>
							      </tr>
							      <tr>
							        <td>예치기간</td>
							        <td>
							          <select name="months" id="months1">
							            <option value="6">6개월</option>
							            <option value="12" selected>12개월</option>
							            <option value="18">18개월</option>
							            <option value="24">24개월</option>
							            <option value="30">30개월</option>
							            <option value="36">36개월</option>
							          </select>
							        </td>
							      </tr>
							      <tr>
							        <td>연이자율</td>
							        <td>
							          <input name="interest" id="money1"  value="" required style="width: 380px; height:40px; border: 1px solid #adb5bd;" placeholder="%">
							        </td>
							      </tr>
						        </tbody>
						    </table>
						  </form>
						  
						  <table id="diagram" style="width: 100%; margin-top: 25px;">
						    <tr style="text-align: center;"> 
						      <th style="color: #555;">원금</th>
						      <th style="color: #555;">이자</th>
						      <th style="color: #555;">이자과세</th>
						      <th style="color: #555;">실수령액</th>
						    </tr>
						    <tr>
						      <th id="money-before" style="border-bottom: none; text-align: center; font-size: 18px; font-weight: 500; color: #555;"></th>
						      <th id="money-after" style="border-bottom: none; text-align: center; font-size: 18px; font-weight: 500; color: #555;"></th>
						      <th id="money-after2" style="border-bottom: none; text-align: center; font-size: 18px; font-weight: 500; color: #555;"></th>
						      <th id="money-after3" style="border-bottom: none; text-align: center; font-size: 18px; font-weight: 500; color: #555;"></th>
						    </tr>
						  </table>
									    
			        </div>
	                <div class="modal-footer">
	                   <button type="button" data-dismiss="modal" aria-label="Close" id="closeBtn"> <span aria-hidden="true">닫기</span></button>
	                   
	                </div>
		    	</div>
			  </div>    
			 </div>
           
               
	           <div class="content_area act"  data-depth="0" data-idx="0">
	           		<table border=1  width=90% style="margin: auto;">
	           			<thead>
                           <tr class="tab-3">
                              <th style="width:30%; font-weight: bold; font-size: 18px; padding-bottom: 20px; border-bottom-color: black;">총 ${size}개 적금 상품 </th>
                           </tr>
                        </thead>
	           		</table>
	           		<div>
	           			<c:forEach items="${savinglist}" var="savinglist" varStatus="loop">
	           				<div style="margin-bottom : 3%; width: 95%; padding: 0 0 0px 50px; " align="center">
								<div style="height: 150px;">
									<div style="border-bottom: 1px solid gray;" id="area">
									<c:if test="${savinglist['FAVORITEYN'] eq 'N'}">
									<button onclick="changeFavorite(this)" id="favorite" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-regular fa-heart"></i></button>
									</c:if>
									<c:if test="${savinglist['FAVORITEYN'] eq 'Y'}">
									<button onclick="changeFavorite(this)" id="favorite2" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-solid fa-heart"></i></button>
									</c:if>
					
									<a id="saving">적금</a>
									<h5 class="fw-bold font-sans-serif" id="savingName" align="left">${ savinglist['SAVINGNAME']}</h5>
									<h5 id="savingDetail" align="left">${ savinglist['SAVINGDETAIL']}</h5>
									<a id="max">최대 연</a>
									<h5 id="primerate" align="right">${ savinglist['PRIMERATE']}%</h5>
									</div>
								</div>
							</div>
	           			</c:forEach>
	           		</div>
	           </div>
	           <div class="content_area" data-depth="0" data-idx="1">
	           		<table border=1  width=90% style="margin: auto;">
	           			<thead>
                           <tr class="tab-3">
                              <th id="th_count01" style="width:30%; font-weight: bold; font-size: 18px; padding-bottom: 20px; border-bottom-color: black;"></th>
                           </tr>
                        </thead>
	           		</table>
	           			<div>
	           			<c:set var="count01" value="0" />
	           			<c:forEach items="${savinglist}" var="savinglist" varStatus="loop" >
	           				<c:if test="${savinglist['CONSUMECODE'] eq 01}">
	           					<c:set var="count01" value="${count01 + 1}" />
		           				<div style="margin-bottom : 3%; width: 95%; padding: 0 0 0px 50px; " align="center">
								<div style="height: 150px;">
									<div style="border-bottom: 1px solid gray;" id="area">
									<c:if test="${savinglist['FAVORITEYN'] eq 'N'}">
									<button onclick="changeFavorite(this)" id="favorite" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-regular fa-heart"></i></button>
									</c:if>
									<c:if test="${savinglist['FAVORITEYN'] eq 'Y'}">
									<button onclick="changeFavorite(this)" id="favorite2" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-solid fa-heart"></i></button>
									</c:if>
					
									<a id="saving">적금</a>
									<h5 class="fw-bold font-sans-serif" id="savingName" align="left">${ savinglist['SAVINGNAME']}</h5>
									<h5 id="savingDetail" align="left">${ savinglist['SAVINGDETAIL']}</h5>
									<a id="max">최대 연</a>
									<h5 id="primerate" align="right">${ savinglist['PRIMERATE']}%</h5>
									</div>
								</div>
								</div>
							</c:if>
	           			</c:forEach>
	           			<input type="hidden" id="input_countId" value='<c:out value="${count01}" />' >
	           		</div>
	           </div>
	           <div class="content_area" data-depth="0" data-idx="2">
			   	<table border=1  width=90% style="margin: auto;">
	           			<thead>
                           <tr class="tab-3">
                              <th style="width:30%; font-weight: bold; font-size: 18px; padding-bottom: 20px; border-bottom-color: black;">총 3개 적금 상품 </th>
                           </tr>
                        </thead>
	           		</table>
	           			<div>
	           			<c:forEach items="${savinglist}" var="savinglist" varStatus="loop" >
	           				<c:if test="${savinglist['CONSUMECODE'] eq 02}">
		           				<div style="margin-bottom : 3%; width: 95%; padding: 0 0 0px 50px; " align="center">
									<div style="height: 150px;">
										<div style="border-bottom: 1px solid gray;" id="area">
										<c:if test="${savinglist['FAVORITEYN'] eq 'N'}">
									<button onclick="changeFavorite(this)" id="favorite" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-regular fa-heart"></i></button>
									</c:if>
									<c:if test="${savinglist['FAVORITEYN'] eq 'Y'}">
									<button onclick="changeFavorite(this)" id="favorite2" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-solid fa-heart"></i></button>
									</c:if>
						
										<a id="saving">적금</a>
										<h5 class="fw-bold font-sans-serif" id="savingName" align="left">${ savinglist['SAVINGNAME']}</h5>
										<h5 id="savingDetail" align="left">${ savinglist['SAVINGDETAIL']}</h5>
										<a id="max">최대 연</a>
										<h5 id="primerate" align="right">${ savinglist['PRIMERATE']}%</h5>
										</div>
									</div>
								</div>
							</c:if>
	           			</c:forEach>
	           		</div>
			   </div>
	           <div class="content_area" data-depth="0" data-idx="3">
	           		<table border=1  width=90% style="margin: auto;">
	           			<thead>
                           <tr class="tab-3">
                              <th style="width:30%; font-weight: bold; font-size: 18px; padding-bottom: 20px; border-bottom-color: black;">총 5개 적금 상품 </th>
                           </tr>
                        </thead>
	           		</table>
	           			<div>
	           			<c:forEach items="${savinglist}" var="savinglist" varStatus="loop" >
	           				<c:if test="${savinglist['CONSUMECODE'] eq 04}">
		           				<div style="margin-bottom : 3%; width: 95%; padding: 0 0 0px 50px; " align="center">
									<div style="height: 150px;">
										<div style="height: 150px;">
											<div style="border-bottom: 1px solid gray;" id="area">
											<c:if test="${savinglist['FAVORITEYN'] eq 'N'}">
											<button onclick="changeFavorite(this)" id="favorite" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-regular fa-heart"></i></button>
											</c:if>
											<c:if test="${savinglist['FAVORITEYN'] eq 'Y'}">
											<button onclick="changeFavorite(this)" id="favorite2" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-solid fa-heart"></i></button>
											</c:if>
							
											<a id="saving">적금</a>
											<h5 class="fw-bold font-sans-serif" id="savingName" align="left">${ savinglist['SAVINGNAME']}</h5>
											<h5 id="savingDetail" align="left">${ savinglist['SAVINGDETAIL']}</h5>
											<a id="max">최대 연</a>
											<h5 id="primerate" align="right">${ savinglist['PRIMERATE']}%</h5>
										</div>
									</div>
									</div>
								</div>
							</c:if>
	           			</c:forEach>
	           		</div>
	           </div>
	           
	           <div class="content_area" data-depth="0" data-idx="4">
	           		<table border=1  width=90% style="margin: auto;">
	           			<thead>
                           <tr class="tab-3">
                              <th style="width:30%; font-weight: bold; font-size: 18px; padding-bottom: 20px; border-bottom-color: black;">총 5개 적금 상품 </th>
                           </tr>
                        </thead>
	           		</table>
	           			<div>
	           			<c:forEach items="${savinglist}" var="savinglist" varStatus="loop" >
	           				<c:if test="${savinglist['CONSUMECODE'] eq 06}">
		           				<div style="margin-bottom : 3%; width: 95%; padding: 0 0 0px 50px; " align="center">
									<div style="height: 150px;">
										<div style="border-bottom: 1px solid gray;" id="area">
										<c:if test="${savinglist['FAVORITEYN'] eq 'N'}">
										<button onclick="changeFavorite(this)" id="favorite" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-regular fa-heart"></i></button>
										</c:if>
										<c:if test="${savinglist['FAVORITEYN'] eq 'Y'}">
										<button onclick="changeFavorite(this)" id="favorite2" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-solid fa-heart"></i></button>
										</c:if>
						
										<a id="saving">적금</a>
										<h5 class="fw-bold font-sans-serif" id="savingName" align="left">${ savinglist['SAVINGNAME']}</h5>
										<h5 id="savingDetail" align="left">${ savinglist['SAVINGDETAIL']}</h5>
										<a id="max">최대 연</a>
										<h5 id="primerate" align="right">${ savinglist['PRIMERATE']}%</h5>
										</div>
									</div>
								</div>
							</c:if>
	           			</c:forEach>
	           		</div>
	           </div>
	           
	           <div class="content_area" data-depth="0" data-idx="5">
	           		<table border=1  width=90% style="margin: auto;">
	           			<thead>
                           <tr class="tab-3">
                              <th style="width:30%; font-weight: bold; font-size: 18px; padding-bottom: 20px; border-bottom-color: black;">총 3개 적금 상품 </th>
                           </tr>
                        </thead>
	           		</table>
	           			<div>
	           			<c:forEach items="${savinglist}" var="savinglist" varStatus="loop" >
	           				<c:if test="${savinglist['CONSUMECODE'] eq 07}">
		           				<div style="margin-bottom : 3%; width: 95%; padding: 0 0 0px 50px; " align="center">
									<div style="height: 150px;">
										<div style="border-bottom: 1px solid gray;" id="area">
										<c:if test="${savinglist['FAVORITEYN'] eq 'N'}">
										<button onclick="changeFavorite(this)" id="favorite" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-regular fa-heart"></i></button>
										</c:if>
										<c:if test="${savinglist['FAVORITEYN'] eq 'Y'}">
										<button onclick="changeFavorite(this)" id="favorite2" style="background: none; border: none; font-size: 25px; color: red;"><i class="fa-solid fa-heart"></i></button>
										</c:if>
						
										<a id="saving">적금</a>
										<h5 class="fw-bold font-sans-serif" id="savingName" align="left">${ savinglist['SAVINGNAME']}</h5>
										<h5 id="savingDetail" align="left">${ savinglist['SAVINGDETAIL']}</h5>
										<a id="max">최대 연</a>
										<h5 id="primerate" align="right">${ savinglist['PRIMERATE']}%</h5>
										</div>
									</div>
								</div>
							</c:if>
	           			</c:forEach>
	           		</div>
	           </div>
         </div>      

	</main>
<script>
 
	let form = document.forms.calculator;
	
	form.money.oninput = calculate;
	form.months.onchange = calculate;
	form.interest.oninput = calculate;
	
	function calculate() {
	  let years = parseInt(form.months.value);
	  if (!years) return;
	  console.log("years : " + years);
	  
	  let initial = +form.money.value * years ;
	  if (!initial) return;
	  console.log("value: " +form.money.value);
	  console.log("initial :" + initial);
	  
	  
	  let interest = form.interest.value *0.01;
	  if (!interest) return;
	  console.log("interest : " +interest);
	

	  console.log("이자율 : " + interest + "기간 : " + years);
	  console.log("이자과세 : " + initial * interest * (years+1) / 24 * 0.154);
	  
	  let result = initial * interest * (years+1) / 24
	  let result2 = initial * interest * (years+1) / 24 * 0.154
	  let result3 = initial + result - result2;
	  
	  
	  console.log(result2);
	  console.log(result3);

	  document.getElementById('money-before').innerHTML = (form.money.value * years).toLocaleString() +"원";
	  document.getElementById('money-after').innerHTML = result.toLocaleString() +"원" ;
	  document.getElementById('money-after2').innerHTML = result2.toLocaleString() +"원";
	  document.getElementById('money-after3').innerHTML = result3.toLocaleString() +"원";
	}
	
	calculate();
	
	
	$('#openModal').click(function(e){
	    e.preventDefault();
	    $('#exampleModal').modal("show");
	 });
	 
	 $('#closeBtn').click(function(){
		 $('#exampleModal').modal("hide");
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
	        
	        if(idx == 1) {
	        	$("#th_count01").text("총 " + $("#input_countId").val() + "개 적금 상품 ");
	        }
	      });
	    });
	  });
	}

	bindingTabEvent('.tab_wrap');
	
	function changeFavorite(th, inx){
		if(th.innerHTML == '<i class=\"fa-regular fa-heart\"></i>') {
			th.innerHTML = '<i class=\"fa-solid fa-heart\"></i>';
		} else {
			th.innerHTML = '<i class=\"fa-regular fa-heart\"></i>';
		}
		
		
		return;		  
	}
		
</script>
</body>
</html>