<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
  <link rel="stylesheet" href="./style/css/main.css" />
 <link rel="stylesheet" href="./style/css/main2.css" />
 <link rel="stylesheet" href="./style/bootstrap.css" />
 <link rel="stylesheet" href="./style/bootstrap-utilities.css" />


</head>
<body>
<!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="footer-content">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>하나챌린지</h3>
              <p>
                인천 서구 에코로 167 하나금융그룹 <br>
                통합데이터센터 비전센터 5층<br><br>
                <strong>Phone:</strong> 02-2151-6400<br>
                <strong>Fax:</strong> 02-2151-6410<br>
              </p>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>회사소개</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">CEO</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">비전과 미션</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">연혁</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">알림</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">하나금융그룹</a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>기술</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">사업영역</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">신성자동력</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">전문서비스</a></li>
              
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Location</h4>
             <div id="map" style="width:600px;height:200px;"></div>

		         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbd5593625485c63ff901a78742bce4e&libraries=services,clusterer"></script>
		         <script>
		         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		             mapOption = { 
		                 center: new kakao.maps.LatLng(37.556088112071826, 126.6287096567498), // 지도의 중심좌표
		                 level: 3 // 지도의 확대 레벨
		             };
		         
		         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		         
		         // 마커가 표시될 위치입니다 
		         var markerPosition  = new kakao.maps.LatLng(37.556088112071826, 126.6287096567498); 
		         
		         // 마커를 생성합니다
		         var marker = new kakao.maps.Marker({
		             position: markerPosition
		         });
		         </script>

        </div>
      </div>
    </div>

    <div class="footer-legal text-center">
      <div class="container d-flex flex-column flex-lg-row justify-content-center justify-content-lg-between align-items-center">

        <div class="d-flex flex-column align-items-center align-items-lg-start">
          <div class="copyright">
            &copy; Copyright <strong><span>HeroBiz</span></strong>. All Rights Reserved
          </div>
          <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/herobiz-bootstrap-business-template/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>

        <div class="social-links order-first order-lg-last mb-3 mb-lg-0">
          <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
          <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
          <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
          <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>

      </div>
    </div>

  </footer><!-- End Footer -->


</body>
</html>