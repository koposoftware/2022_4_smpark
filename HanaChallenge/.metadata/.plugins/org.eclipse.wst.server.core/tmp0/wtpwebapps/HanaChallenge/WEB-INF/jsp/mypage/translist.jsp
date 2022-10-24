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
<style>
   .chal:after{
	   	content: "";
	    display: block;
	    width: 60px;
	    border-bottom: 1.5px solid rgb(9,154,150);
	    margin: 0px auto;
   } 
</style>

</head>
<body>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header> 
	<main class="hana__main-wrap" style="margin: 155px 140px">
		<h1 align="center" style="font-size: 32px; font-weight: bold;" class="container-fluid fw-bold font-sans-serif py-4">계좌 내역 조회</h1>
		<a class="chal""></a>
		<section class="pt-3">
			<div class="container" style="width :100%;" align="center">
			
				<table style="width: 80%; margin-top: 50px;"align="center">
				<thead class="tab-3" style="font-size: 18px;">
				<tr>
					<th style="width: 20%; height: 40px;">거래일자</th>
					<th style="width: 20%;">거래 대상</th>
					<th style="width: 20%;">거래액</th>
					<th style="width: 20%;">내 잔액</th>
					<th style="width: 20%;">거래 유형</th>
				</tr>
				</thead>
				
				<tbody style="height: 40px;">
				<c:if test="${ empty translist }">
					<tr>
						<td colspan="5" style="text-align: center; padding-top: 12px;">거래 내역이 없습니다.</td>
					</tr>
					</c:if>
						<c:forEach items="${translist}" var="translist" varStatus="loop" >
							<tr>
								<td style="padding-top: 12px;"><c:out value="${translist['TRANSDATE'] }" /></td>
								<td><c:out value="${translist['TARGETNAME'] }" /></td>
								<td><fmt:formatNumber value="${translist['TRANSAMOUNT'] }" type="number"/>원</td>
								<td><fmt:formatNumber value="${translist['MYBALANCE']}" type="number"/>원</td>
								<td>
									<c:if test="${translist['TRANSTYPE'] eq '입금'}">
											<strong style="color: red;"><c:out value="${translist['TRANSTYPE'] }" /></strong>
									</c:if>
									<c:if test="${translist['TRANSTYPE'] eq '출금'}">
											<strong style="color: blue;"><c:out value="${translist['TRANSTYPE']}" /></strong>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
				
			</div>
		
		
		</section>
	</main>

</body>
</html>