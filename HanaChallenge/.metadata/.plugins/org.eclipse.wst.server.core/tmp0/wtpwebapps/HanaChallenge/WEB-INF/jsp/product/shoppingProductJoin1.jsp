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
<link rel="stylesheet" href="/style/css/bootstrap.css" />
<link rel="stylesheet" href="/style/css/main2.css" />
<link rel="stylesheet" href="/style/css/table.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
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
	label {
	  display: block;
	}
	.accordion-button:not(.collapsed){
		color : black;
		background-color: white;
	}
	.accordion-button:focus{
		box-shadow: none;
	}
	.chal:after{
	       	content: "";
	        display: block;
	        width: 60px;
	        border-bottom: 1.5px solid rgb(9,154,150);
	        margin: 0px auto;
    }
    
    th, tr, td{
    font-family: 'InfinitySans-RegularA1'
    }
</style>
</head>
<body>
<%
	int savingCode = Integer.parseInt(request.getParameter("savingCode"));
	float interestrate = Float.parseFloat(request.getParameter("interestRate"));
	String savingName = request.getParameter("savingName");
%>
	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header> 
	
	<main class="hana__main-wrap" style="margin: 155px 140px">
		<section class="pt-3 pb-7 ">
			<div align="center">
				<h2 align="center" class="container-fluid fw-bold font-sans-serif py-4" style= "font-size: 30px;"><%=savingName %> 가입</h2>	
				<a class="chal""></a>
			</div> 
		
			<div class="container" style="width :60%; margin-top: 50px;">
				<table border=1 align="center" width=100% style="font-family: InfinitySans-RegularA1;">
					<tbody>
						<tr>
							<td style="width: 20%; font-weight: bold; height: 50px; padding-top: 18px; ">상품특징</td>
							<td>무신사 사이트에서 하나카드로 소비하는 누적 소비액에 따라 우대금리를 제공하는 상품</td>
						</tr>
						<tr>
							<td style="font-weight: bold; height: 50px;  padding-top: 18px;">가입대상</td>
							<td>만 14세 이상 만 100세 이하</td>
						</tr>
						<tr>
							<td rowspan="2" style="font-weight: bold; height: 50px; padding-top: 18px;">가입기간</td>
							<td style="border-bottom: none;">최소 6개월</td>
						</tr>
						<tr>
							<td>최소 24개월</td>
						</tr>
						<tr>
							<td style="font-weight: bold; height: 50px; padding-top: 18px;">가입금액</td>
							<td>1천원 이상 ~ 50만원 이하</td>
						</tr>
						<tr>
							<td rowspan="2" style="font-weight: bold; height: 50px; padding-top: 18px;">우대금리</td>
							<td style="padding-bottom: 20px;">최대 연 5%</td>
						</tr>
						<tr>
							<td style="padding-left: 0px;">
								<table border=1 align="center" width=80%>
									<thead>
										<tr>
											<th style="color: #555; font-weight: bold; border-bottom: 1.5px solid">누적소비액</th>
											<th style="color: #555; font-weight: bold; border-bottom: 1.5px solid">우대금리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="height: 40px;">50,000원</td>
											<td>1.5%</td>
										</tr>
										<tr>
											<td style="height: 40px;">200,000원</td>
											<td>2%</td>
										</tr>
										<tr>
											<td style="height: 40px;">400,000원</td>
											<td>2.6%</td>
										</tr>
										<tr>
											<td style="height: 40px;">600,000원</td>
											<td>3.2%</td>
										</tr>
										<tr>
											<td style="height: 40px;">800,000원</td>
											<td>4%</td>
										</tr>
										<tr>
											<td style="height: 40px;">1,000,000원</td>
											<td>5%</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				
				<label for="agree_all" style="margin-bottom: 25px; margin-top: 80px;">
				  <input type="checkbox" name="agree_all" id="agree_all" style ="width: 18px; height: 16px;">
				  <span style="font-size: 23px; text-align: center;">모두 동의합니다</span>
				</label>
				<div class="accordion accordion-flush" id="faqlist1">
					<div class="accordion-item">
						 <h2 class="accordion-header" id="headingone">
							<label for="agree">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
							  <input type="checkbox" name="agree" value="1" style ="width: 16px; height: 15px;">
							  <span style="font-size: 18px;">&nbsp적금거래기본 약관</span>
							  </button>
							</label>
						</h2>
						 	<div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  				<div class="accordion-body">
	                  				<p style="text-align: right; margin-bottom: 30px; font-size: 12px;">개정준법감시인 심의필 제2022-약관-104호(2022.06.23)</p>
									<p style="text-align: center; font-size: 20px; font-weight: bold; margin-bottom: 50px;">예금거래 기본약관</p>
									<p style="line-height: 1.2; margin-bottom: 15px;">이 적금거래기본약관(이하 “약관”이라 한다)은 (주)하나은행(이하 “은행”이라 한다)과 거래처(또는 예금주)가 서로 믿음을 바탕으로 예금거래를 빠르고 틀림 없이 처리하는 한편, 서로의 이해관계를 합리적으로 조정하기 위하여 기본적이고 일반적인 사항을 정한 것이다. 은행은 이 약관을 영업점에 놓아두고, 거래처는 영업시간 중 언제든지 이 약관을 볼 수 있고 또한 그 교부를 청구할 수 있다.</p>
									
									<p style="font-weight: bold; margin-bottom: 10px;">제1조 적용범위</p>
									<p style= "margin-bottom: 20px;">이 약관은 거치식적금 및 적립식예금 거래에 적용한다.</p>
									
									<p style="font-weight: bold; margin-bottom: 10px;">제2조 실명거래</p>
									<p style="margin-bottom: 8px;">① 거래처는 실명으로 거래하여야 한다.</p>
									<p style="line-height: 1.2; margin-bottom: 15px;">② 은행은 거래처의 실명확인을 위하여 주민등록증ㆍ사업자등록증 등 실명확인증표 또는 그밖에 필요한 서류의 제시나 제출을 요구할 수 있고, 거래처는 이에 따라야 한다.</p>
									<p style="font-weight: bold; margin-bottom: 10px;">제3조 거래장소</p>
									<p style="line-height: 1.2; margin-bottom: 20px;">거래처는 예금계좌를 개설한 영업점(이하 “개설점”이라 한다)에서 모든 예금거래를 한다. 다만, 은행이 정하는 바에 따라 다른 영업점이나 다른 금융기관, 또는 현금자동지급기ㆍ현금자동입출금기ㆍ컴퓨터ㆍ전화기 등(이하 “전산통신기기”)을 통하여 거래할 수 있다.</p>
									
									<p style="font-weight: bold; margin-bottom: 10px;">제4조 거래방법</p>
									<p style="line-height: 1.2; margin-bottom: 20px;">거래처는 은행에서 내준 통장(증서· 전자통장을 포함한다) 또는 수표· 어음용지로 거래하여야 한다. 그러나 입금할 때, 자동이체약정ㆍ전산통신 기기이용약정에 따라 거래하는 경우 및 기등록된 생체정보(이하”바이오 정보”), 실명확인증표 등을 통해 본인확인된 경우에는 통장없이(이하”무통장”)도 거래할 수 있다.</p>
									
									<p style="font-weight: bold; margin-bottom: 10px;">제5조 인감, 비밀번호 등의 신고</p>
									<p style="line-height: 1.2; margin-bottom: 8px;">① 거래처는 예금계좌를 개설할 때 인감 또는 서명, 비밀번호, 성명, 상호, 대표자명, 대리인명, 주소 등 거래에 필요한 사항을 신고하여야 한다. 다만, 비밀번호는 비밀번호 입력기(이하 “PIN-Pad기”라 한다)에 의하여 거래처가 직접 등록할 수 있으며, 거래처가 은행에 내점할 수 없는 경우 거래처는 개설된 예금의 첫거래 전에 은행이 정한 방법에 따라 전산통신기기를 이용하여 비밀번호를 등록하여야 한다.</p>
									<p style="line-height: 1.2; margin-bottom: 8px;">② 제 1항에 불구하고 거치식·적립식 예금은 비밀번호를 신고하지 않을 수 있다.</p>
									<p style="line-height: 1.2; margin-bottom: 8px;">③ 거래처는 인감과 서명을 함께 신고하거나, 인감 또는 서명을 추가 신고할 수 있다.</p>
									<p style="line-height: 1.2; margin-bottom: 20px;">④ 통장을 발행하지 않은 경우, 은행은 거래처로부터 인감 또는 서명의 신고 절차를 생략할 수 있다.</p>
                  				</div>
						</div>
					</div>
				</div>
				
				<div class="accordion accordion-flush" id="faqlist2">
					<div class="accordion-item">
						 <h2 class="accordion-header" id="headingtwo">
							<label for="agree">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-2">
							  <input type="checkbox" name="agree" value="1" style ="width: 16px; height: 15px;">
							  <span style="font-size: 18px;">&nbsp적립식 적금 약관</span>
							  </button>
							</label>
						</h2>
						 	<div id="faq-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  				<div class="accordion-body">
                  				<p style="text-align: right; margin-bottom: 30px; font-size: 12px;">개정준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</p>
                  				<p style="text-align: center; font-size: 20px; font-weight: bold; margin-bottom: 50px;">적립식예금약관</p>
                  				<p style="font-weight: bold; margin-bottom: 10px;">제1조 적용범위</p>
                  				<p style="line-height: 1.2; margin-bottom: 8px;">① 적립식예금(이하 '이 예금'이라 한다)이라 함은 기간을 정하고 그 기간중에 미리 정한 금액이나 불특정 금액을 정기 또는 부정기적으로 입금하는 예금을 말한다.</p>
                  				<p style="line-height: 1.2; margin-bottom: 20px;">② 이 약관에서 정하지 아니한 사항은 예금거래기본약관의 규정을 적용한다.</p>
                  				<p style="font-weight: bold; margin-bottom: 10px;">제2조 지급시기</p>
                  				<p style="line-height: 1.2; margin-bottom: 20px;">이 예금은 약정한 만기일 이후 거래처가 청구할 때 지급한다. 다만 거래처가 부득이한 사정으로 청구할 때에는 만기전이라도 지급할 수 있다.</p>
                  				<p style="font-weight: bold; margin-bottom: 10px;">제3조 저축금의 입금</p>
                  				<p style="line-height: 1.2; margin-bottom: 20px;">거래처는 계약기간 동안 매월 약정한 날짜에 월저축금을 입금하여야 한다.</p>
                  				</div>
						</div>
					</div>
				</div>
				
				<div class="accordion accordion-flush" id="faqlist3">
					<div class="accordion-item">
						 <h2 class="accordion-header" id="headingthree">
							<label for="agree">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
							  <input type="checkbox" name="agree" value="1" style ="width: 16px; height: 15px;">
							  <span style="font-size: 18px;">&nbsp개인(신용)정보 수집 이용 동의서<strong style="font-weight: bold;"> (필수)</strong> </span>
							  </button>
							</label>
						</h2>
						 	<div id="faq-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  				<div class="accordion-body">
                  				<p style="text-align: right;">개정준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</p>
                  				</div>
						</div>
					</div>
				</div>
				<div class="accordion accordion-flush" id="faqlist4">
					<div class="accordion-item">
						 <h2 class="accordion-header" id="headingfour">
							<label for="agree">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-4">
							  <input type="checkbox" name="agree" value="1" style ="width: 16px; height: 15px;">
							  <span style="font-size: 18px;">&nbsp계좌간 자동이체 약관</span>
							  </button>
							</label>
						</h2>
						 	<div id="faq-content-4" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  				<div class="accordion-body">
                  				<p style="text-align: right;">개정준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</p>
                  				</div>
						</div>
					</div>
				</div>
				
					<div class="accordion accordion-flush" id="faqlist5">
					<div class="accordion-item">
						 <h2 class="accordion-header" id="headingfive">
							<label for="agree">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-5">
							  <input type="checkbox" name="agree" value="1" style ="width: 16px; height: 15px;">
							  <span style="font-size: 18px;">&nbsp비과세종합저축특약</span>
							  </button>
							</label>
						</h2>
						 	<div id="faq-content-5" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  				<div class="accordion-body">
                  				<p style="text-align: right;">개정준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</p>
                  				</div>
						</div>
					</div>
				</div>
				
				
			</div>
			
			
		    
		    <div class="text-center pt-4" style="margin-top: 100px;">
		    <form action="${pageContext.request.contextPath}/shoppingProductJoin2" method="post">
		    	<input type="hidden" id="savingCode" name="savingCode" value="<%=savingCode%>" >
		    	<input type="hidden" id="interestRate" name="interestRate" value="<%=interestrate %>">
		    	<input type="hidden" id="savingName" name="savingName" value="<%=savingName%>">
		    	<input class="homeBtn" type="submit" value="가입하기" style="text-align: center; width: 150px; font-size: 18px;" >
		    </form>
		    
		    
			</div>
		</section>
	</main>

</body>
<script>
	const agreeChkAll = document.querySelector('input[name=agree_all]');
	
	agreeChkAll.addEventListener('change', (e) => {
		let agreeChk = document.querySelectorAll('input[name=agree]');
		for(let i = 0; i < agreeChk.length; i++){
		  agreeChk[i].checked = e.target.checked;
		}
	});
</script>
</html>