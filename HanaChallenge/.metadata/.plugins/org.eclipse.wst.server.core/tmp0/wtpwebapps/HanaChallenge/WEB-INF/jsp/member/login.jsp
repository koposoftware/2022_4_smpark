<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%	
	String redirectPath = request.getParameter("redirect");
	if (redirectPath == null || "null".equals(redirectPath)) {
		redirectPath = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="./style/css/main.css" />
<link rel="stylesheet" href="./style/css/main2.css" />
<link rel="stylesheet" href="./style/css/theme.css" />
<link rel="stylesheet" href="./style/css/table.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
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
		th, td{
		border-bottom: none;
		}
</style>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script  type="text/javascript">
Kakao.init('bbd5593625485c63ff901a78742bce4e');
console.log(Kakao.isInitialized()); // sdk초기화여부판단

 function kakaoLogin() {
	 Kakao.Auth.login({
	    	scope: 'account_email',
	        success: function(response) {
	        	
	            Kakao.API.request({ // 사용자 정보 가져오기 
	                url: '/v2/user/me',
	                data: {
	                    property_keys: [
	                      'properties.nickname',
	                      'kakao_account.email',
	                    ],
	                  },
	                success: (response) => {
	                	var kakaoemail = response.kakao_account.email;
	                	$('#kakaoLogin input[name=email]').val(kakaoemail);
	                	document.querySelector('#kakaoLogin').submit();
	                }
	            });
	            // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
	        },
	        fail: function(error) {
	            alert(error);
	        }
	    });
	}

	function createHiddenLoginForm(kakaoId){
		
		var frm = document.createElement('form');
		frm.setAttribute('method', 'post');
		frm.setAttribute('action', '/member/kakaoLogin.go');
		var hiddenInput = document.createElement('input');
		hiddenInput.setAttribute('type','hidden');
		hiddenInput.setAttribute('name','userid');
		hiddenInput.setAttribute('value',kakaoId);
		frm.appendChild(hiddenInput);
		document.body.appendChild(frm);
		frm.submit();
		
	}
 
	function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
                console.log(response)
            },
            fail: function (error) {
              console.log(error)
            },
          })
          Kakao.Auth.setAccessToken(undefined)
        }
      }  

</script>


</head>
<body>

	<header>
   	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	<main class="hana__main-wrap">
		<div align="center" style="margin-top: 200px; margin-bottom: 100px">
			
			<h2 class="container-fluid fw-bold font-sans-serif py-3" style="font-size: 25px;">로그인</h2>
			
			<br>
			<form:form action="${pageContext.request.contextPath}/login" method="post" modelAttribute="memberVO">
			<table style="margin-bottom: 3rem; width:300px; align="center">
					<tr>
						<th style="width:40%;">ID</th>
				
							<td>
								<form:input path="id" style="border: none; border-bottom: 2px solid; width:98%; " />
								<form:errors path="id" />
							</td>
					</tr>
			
					<tr>
						<th style="width:40%;">PASSWORD</th>
							<td>
								<form:input type="password" path="password"  style="border: none; border-bottom: 2px solid; width:98%; " />
								<form:errors path="password" />
							</td>
					</tr>
			</table>
			<input type="submit" value="로그인" align="center"
					class="btn btn-dark order-1 order-lg-0 mt-lg-3 mb-2" style="width:300px; height:45px" data-toggle="modal" data-target="#loginModal"></br>
				<a id="custom-login-btn" href="javascript:kakaoLogin()" class="order-1 order-lg-0 mt-lg-3">
				  <img src="./image/img/kakao.png" alt="카카오 로그인 버튼"/>
				</a>
				<br>
			<input type="hidden" name="redirectPath" value="<%=redirectPath%>">
			</form:form>
			<form:form id="kakaoLogin" action="${pageContext.request.contextPath}/login" method="post" modelAttribute="memberVO">
    			<input type="hidden" name="email"/>
    			<input type="hidden" name="redirectPath" value="<%=redirectPath%>">
			</form:form>
	</div>
	</main>
	
	 <footer>
    	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
    </footer> 
    
    <script
    src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
</body>
</html>