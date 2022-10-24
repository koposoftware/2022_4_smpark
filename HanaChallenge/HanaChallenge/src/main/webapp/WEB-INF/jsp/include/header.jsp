<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/main2.css" />

<style>
	@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{
	 font-family : 'InfinitySans-RegularA1';
	}
</style>
<title>header</title>
</head>
<body>
 <!-- header -->
    <header class="hana__header-wrap fixed-top" style="margin: 0 0 0 0; padding: 0 0 0 0; border-bottom: 2px solid #0a9b97; background-color: #f4f9f9">
      <div class="hana__header-inner">
        <h1 class="hana__logo-wrap">
          <a href="${pageContext.request.contextPath}/index.jsp" class="hana__logo-link">
            <img src="${pageContext.request.contextPath}/image/logo/logo.png" alt="logo" />
          </a>
        </h1>
        <div class="hana__header-right">
          <div class="hana__header__button-wrap" style="margin-top:0px;">
	          <c:if test="${ not empty loginVO }">
	          		<a class="hana__header__button" style="font-size: 13.3333px; background-color: #f4f9f9; font-weight: 400;" > ${ loginVO.name}님, 안녕하세요 </a>
		            <button class="hana__header__button" style="font-size: 13.3333px; background-color: #f4f9f9; font-weight: 400;"><a href="${ pageContext.request.contextPath}/logout" style="font-family : 'InfinitySans-RegularA1';">로그아웃</a></button>
	          </c:if>
          </div>
          
          <div class="hana__header-right2">
          	<div class="hana__header__button-wrap">
          	<c:if test="${empty loginVO }">
            	<button class="hana__header__button" style="font-size: 13.3333px; background-color: #f4f9f9; font-weight: 600;">회원가입</button>
            	<button class="hana__header__button" style="font-size: 13.3333px; background-color: #f4f9f9; font-weight: 400;"><a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/login" style="font-family : 'InfinitySans-RegularA1'; color: #575757"> 로그인 </a></button>
          	</c:if>
          	</div>
          </div>
 
          

          <nav class="hana__header__nav-wrap">
            <ul style="margin: 0 0 0 0; padding: 0 0 0 0;">
              <li>
                <a href="${pageContext.request.contextPath}/index.jsp" style="font-weight: 500;">HOME</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/productList" style="font-weight: 500;">상품</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/report" style="font-weight: 500;">리포트</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/challenge" style="font-weight: 500;">도전하기</a>
              </li>
              <li>
                <a href="#" style="font-weight: 500;">마이페이지</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/event" style="font-weight: 500;">이벤트</a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    <!-- header -->


</body>
</html>