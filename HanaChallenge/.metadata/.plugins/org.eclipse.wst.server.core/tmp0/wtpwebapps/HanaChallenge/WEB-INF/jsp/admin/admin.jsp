<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();

	int calMonth = cal.get(Calendar.MONTH)+1;

	session.setAttribute("tYear", "" + Calendar.YEAR);
	session.setAttribute("tMonth", "" + calMonth);
	session.setAttribute("tDay", "" + cal.get(Calendar.DATE));
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <link rel="stylesheet" href="./style/css/main.css" />
    <link rel="stylesheet" href="./style/css/main2.css" />
  
    <title>admin</title>
  </head>
 <body>
   <header>
   	<jsp:include page="/WEB-INF/jsp/include/adminheader.jsp"></jsp:include>
   </header>
    <!-- main -->
    <main class="hana__main-wrap">
      <div class="hana__main__banner-wrap">
        <div class="hana__main__banner-inner">
          <div class="swiper mySwiper">
            <ul class="swiper-wrapper">
              <li class="swiper-slide hana__main__banner-slide-list">
                <img src="./image/img/sample1.jpg" alt="banner_img" />
              </li>
              <li class="swiper-slide hana__main__banner-slide-list">
                <img src="./image/img/sample2.jpg" alt="banner_img" />
              </li>
              <li class="swiper-slide hana__main__banner-slide-list">
                <img src="./image/img/sample3.jpg" alt="banner_img" />
              </li>
            </ul>
          </div>
        </div>
        <nav class="hana__main__nav-wrap">
          <ul class="hana__main__nav">
            <li>
              <a href="${pageContext.request.contextPath}/report">나의 리포트</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/challenge">도전하기</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/product">맞춤 상품</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/mypage">마이페이지</a>
              
            </li>
         
          </ul>
        </nav>
      </div>
      <div class="hana__main-inner">
        <section class="hana__main__section">
          <span class="hana__main__title">금융상품</span>
          <ul class="hana__main__list-wrap">
            <li>
              <span class="hana__icon icon--deposit"></span>
              예/적금
            </li>
            <li>
              <span class="hana__icon icon--loan"></span>
              대출
            </li>
            <li>
              <span class="hana__icon icon--foreign"></span>
              외화
            </li>
            <li>
              <span class="hana__icon icon--insurance"></span>
              보험
            </li>
            <li>
              <span class="hana__icon icon--fund"></span>
              펀드
            </li>
            <li>
              <span class="hana__icon icon--trust"></span>
              신탁
            </li>
            <li>
              <span class="hana__icon icon--pension"></span>
              퇴직연금
            </li>
            <li>
              <span class="hana__icon icon--isa"></span>
              ISA
            </li>
          </ul>
        </section>
      </div>

    </main>
    <!-- main -->
    

   

    <script
    src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script>
      const swiper = new Swiper(".mySwiper", {
        loop: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
      });
    </script>
  </body>
</html>
