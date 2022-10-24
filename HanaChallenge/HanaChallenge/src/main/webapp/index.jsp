<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="kr.ac.kopo.Util" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <link id="pagestyle" href="/style/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
  	<script src="https://kit.fontawesome.com/b3a7369db8.js" crossorigin="anonymous"></script>
  
    <title>hana</title>
	  <style>
		.bg-gradient-primary{
			background-image: linear-gradient(30deg, rgb(9,154,150) 0%, #44bdba 100%);
		}
		
		#su {
			 font-family: "Open Sans", sans-serif;
			 
		}
	</style>
  </head>
 <body>
   <header>
   	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
   </header>
    <!-- main -->
    <main class="hana__main-wrap">
      <div class="hana__main__banner-wrap">
        <div class="hana__main__banner-inner">
          <div class="swiper mySwiper">
            <ul class="swiper-wrapper">
              <li class="swiper-slide hana__main__banner-slide-list">
                <img src="./image/img/main_1.png" alt="banner_img" />
              </li>
              <li class="swiper-slide hana__main__banner-slide-list">
                <img src="./image/img/main_2.png" alt="banner_img" />
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
      <div class="fixed-plugin">
	    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2" style="width: 70px; height: 70px;" id="chat">
	      <img src="/image/img/talk.png" style="width: 40px; padding-top: 5px;">
	    </a>
	    <div class="card shadow-lg" id="chat2" style="height: 80%; top: 180px; border: 3px solid rgb(9,154,150); border-radius: 50px;">
	      <div class="card-header pb-0 pt-3 " style="border-radius: 50px; margin-bottom: 15px;">
	        <div class="float-start">
	          <h5 class="mt-3 mb-0" id="su" style="font-size: 20px;">실시간 채팅 상담</h5>
	          <p id="su" style="font-size: 16px;">채팅을 통해 문의를 남겨주세요 </p>
	        </div>
	        <div class="float-end mt-4">
	          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button"  id="cl">
	            <i class="fa fa-close"></i>
	          </button>
	        </div>
	        <!-- End Toggle Button -->
	      </div>	
	      <div class="card-body pt-sm-3 pt-0 overflow-auto" style="border-radius: 20px; box-shadow: 2px 2px 2px 2px rgba(151,151,151,0.2); flex: none; width: 400px; margin-left: 15px; height: 520px;">
	        <!-- Navbar Fixed -->
	        <div class="mt-2 mb-5 d-flex">
	          <h6 id="greetings2" class="mb-0"></h6>
	          <div class="form-check form-switch ps-0 ms-auto my-auto">
	          </div>
	        </div>
	
	      </div>
	      <div class="card-body pt-sm-3 pt-0 overflow-auto" style="padding-left: 20px; padding-right: 10px; margin-top: 15px;">
	     	<input type="text" id="name2" style="outline: none; width: 310px; border-radius: 10px; height: 40px; border: none; box-shadow: 2px 2px 2px 2px rgba(151,151,151,0.3)">
	     	<button onclick="sendName2();" class="btn bg-gradient-primary px-3 active" data-class="bg-white" style="margin-bottom: 0px; margin-left: 15px;">전송</button>
	      </div>
	    </div>
	  </div>
 
  <script src="/js/core/popper.min.js"></script>
  <script src="/js/core/bootstrap.min.js"></script>
  <script src="/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="/js/plugins/chartjs.min.js"></script>

   

    <script
    src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/js/websocket/websocket.js"></script>
    <script>
      const swiper = new Swiper(".mySwiper", {
        loop: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
      });
      
      $('#chat').click(function(){
    	  $('#chat2').css({
    		  "right" :"0px"
    	  }); 
    	  connect();
      });
      
      $('#cl').click(function(){
    	  $('#chat2').css({
    		  "right" : "-450px"
    	  });
      })
    </script>
  </body>
</html>
