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
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenLite.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/easing/EasePack.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/plugins/CSSPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>
<link rel="stylesheet" href="./style/css/main2.css" />
<script src="https://kit.fontawesome.com/b3a7369db8.js" crossorigin="anonymous"></script>
<style>
		@font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }
		@font-face {
		    font-family: 'InfinitySans-RegularA1';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
		#wrap{   position: relative; overflow: hidden;}
		#wrap #gameContainer{width:508px; height:671px; text-align: center; position: relative;margin:0px auto;}
		#wrap #gameContainer h1{}
		#wrap #gameContainer .obj{position: absolute;}
		#wrap #gameContainer .board_start{  
		    padding: 10px;
		    background: #f00;
		    text-align: center;
		    vertical-align: middle; 
		  	line-height: 100px; 
		    color: #fff474;   
		    background: #000;
		    text-align: center;
		    vertical-align: middle;
		    font-weight: bold;
		position:absolute; left:195px; top:240px;z-index:9; width:120px; border-radius:100px;}
		#wrap #gameContainer .board_start
		img{width:100%;}
		#wrap #gameContainer .board_bg{width:508px; height:508px; top:40px; left:0px; z-index: 2;}
		#wrap #gameContainer .board_bg img{width:100%;}
		#wrap #gameContainer .board_on{width:550px; height:550px; top:30px; left:-20px; z-index: 3; background-image: url('./image/img/circle_bg.png');    background-size: 551px;
		}
		#wrap #gameContainer .board_on img{position:absolute; width:155px;top:50px; height:100px;}
		#wrap #gameContainer .board_on img:nth-child(1){    left: 40px;  transform: rotate( -60deg );  top: 133px;}
		#wrap #gameContainer .board_on img:nth-child(2){left: 38px;  transform: rotate( -113deg );  top: 316px;  }
		#wrap #gameContainer .board_on img:nth-child(3){  left: 198px;  top: 409px; transform: rotate(-180deg);}  
		#wrap #gameContainer .board_on img:nth-child(4){left: 351px; top: 315px;  transform: rotate(-245deg);}
		#wrap #gameContainer .board_on img:nth-child(5){ left: 353px;  top: 137px;  transform: rotate(-292deg);   }
		#wrap #gameContainer .board_on img:nth-child(6){  left: 197px;  top: 35px;  transform: rotate(5deg); }  
		
		#wrap #gameContainer .obj.board_arrow{width:90px; height:105px; top:0px; left:195px; z-index: 5;}
		#wrap #gameContainer .char1{width:259px; height:246px; top:400px; left:90px; z-index: 1;}
		#wrap #gameContainer .char2{width:175px; height:198px; top:449px; left:600px; z-index: 1;}
		#wrap #gameContainer .char3{width:112px; height:108px; top:540px; left:550px; z-index: 3;}
		#wrap #gameContainer .txt1{width:420px; height:30px; bottom:20px; left:260px; z-index: 3;}
		
		.popup {display: none; position: fixed; left: 50%; z-index: 99999; text-align: center; background:#fff; font-size:20px; color:#000;}
		#fade {display: none;background: #000;position: fixed;left: 0;top: 0;width: 100%;height: 100%;opacity: .60;z-index: 9999;}
		#popup_gift{width:495px; height:450px; top:210px; border-radius: 10px;}
		#popup_gift .lottery_present {text-align:center;}
		#popup_gift .lottery_present img{ display:block; margin: 35px auto 00px;     height: 230px; width: 400px;}
		
		#popup_fail{width:475px; height:505px; top:120px;}
		.popup  .close{ display:inline-block; width:150px; hegiht:50px; line-height:50px; color:#fff; background:#333; margin: 30px 0 0;} 
		canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
		
		#notice {
			font-weight: normal;
			font-size: 20px;
			margin-bottom: 10px;
		}
</style>
</head>
<body>
 	<header>
   		<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	</header>
	<main class="hana__main-wrap" style="margin-top: 110px;">
		<img src = "/image/img/event.png" style="width: 1707px; height: 815px; position:absolute; ; z-index: 1;" >
		<img src = "/image/img/lucky.png" style="z-index: 2;  position:relative; width: 350px; margin-top: 35px; margin-left: 655px;">
		<div id="wrap" style="position: relative; z-index: 2; height: 600px; margin-left: -50px;" align="center">
					<img src = "/image/img/tri.png" style="z-index: 4;  position:absolute; width: 30px; height: 40px; top: 30px; left: 865px;">
			<div id="gameContainer">  
		        <div class="board_start join" style="font-size: 30px; font-family: 'InfinitySans-RegularA1';">START</div>
		        <div class="board_on obj"></div>
			</div>
		</div>
			<div id="popup_gift" class="popup">
			    <div class="lottery_present"></div>
	        	<a href="javascript:;" class="close">닫기 </a>
			</div>
		<div class="buttonContainer">
			<button class="canvasBtn" id="stopButton">Stop Confetti</button>
			<button class="canvasBtn" id="startButton">Drop Confetti</button>	
		</div>
		<canvas id="canvas"></canvas>
		<div style="position: relative; height: 200px; background-color: #f9f3f3">
			<div class="container" style="width: 80%; margin-left: 400px; margin-right: 400px; padding-top: 25px;">
				<div style="display: inline-block;"><img src="/image/img/notice.png" style="width: 60px; margin-bottom: 30px;"></div>
				<a style="font-size: 25px; font-weight: bold; position: relative; bottom: 50px; left: 15px;">공지사항</a>
				<div style="margin-top: 15px; display: inline-block; margin-left: 70px;">
					<h5 id="notice"> 	- 본 이벤트는 ID당 1회 참여 가능합니다.</h5>
					<h5 id="notice">	- 본 이벤트는 제휴적금에 가입한 회원만 참여 가능합니다. </h5>
					<h5 id="notice">	- 이벤트로 수령하신 쿠폰으로 구매한 상품은 환불/연장이 불가합니다. </h5>
					<h5 id="notice">	- 본 이벤트는 사정에 따라 예고없이 변동되거나 종료될 수 있습니다. </h5>
				</div>
			</div>
		</div>
	</main>
	
<script>
$(document).ready(function() {
	  var gift;
	       var  present =[ 1,2,3 , 4,5,6 ]

	  iniGame = function(num){
	    gift = num;
	    TweenLite.killTweensOf($(".board_on"));
	    TweenLite.to($(".board_on"), 0, {css:{rotation:rotationPos[gift]}});
	    TweenLite.from($(".board_on"),5, {css:{rotation:-3000}, onComplete:endGame, ease:Sine.easeOut});
	               console.log("gift 숫자 : "+ (gift +1) +"rotationPos" + rotationPos );
	  }

	  var rotationPos = new Array(60,120,180,240,300,360);

	  TweenLite.to($(".board_on"), 360, {css:{rotation:-4000}, ease: Linear.easeNone});
	  function endGame(){
	              var  copImg= "./image/img/coupon"+( gift +1) + ".png";
	                console.log("이미지 : " + copImg );

				  $("#startButton").trigger("click");
				  	setTimeout(function(){
				  		$("#stopButton").trigger("click");
				  	}, 3000);
	                     $("#popup_gift .lottery_present" ).html('당첨을 축하드립니다!! <br><br>' +  '마이페이지 > 내정보 > 쿠폰함에서 확인해주세요');
	                     
	                          $( '<img  src="' + copImg+ '" />' ).prependTo("#popup_gift .lottery_present");
	  setTimeout(function() {openPopup("popup_gift"); }, 1000);
	}
	
	  $(".uoc-icon").on('click', function(){
		  endGame();
	  }); 

	  $(".popup .btn").on("click",function(){
	    location.reload();
	  });
	  function openPopup(id) {
	    closePopup();
	    $('.popup').slideUp(0);
	    var popupid = id
	    $('body').append('<div id="fade"></div>');
	    $('#fade').css({
	    'filter' : 'alpha(opacity=60)'
	    }).fadeIn(300);
	    var popuptopmargin = ($('#' + popupid).height()) / 2;
	    var popupleftmargin = ($('#' + popupid).width()) / 2;
	    $('#' + popupid).css({
	      'margin-left' : -popupleftmargin
	    });
	    $('#' + popupid).slideDown(500);
	  }
	  function closePopup() {
	    $('#fade').fadeOut(300, function() {
	      // $(".player").html('');
	    });
	    $('.popup').slideUp(400);
	    return false
	  }
	  $(".close").click(closePopup);

	});



	$(function() {
	  var clicked  =0;
	  for(i=1; i<7; i++){
	  
	    var  pictures = "./image/img/coupon"+ i  + ".png";
	    $(".board_on").append('<img  src="' + pictures + '" />');
	  }

	  $(".join").on("mousedown",function(){
	    if( clicked <= 0){    iniGame(Math.floor(Math.random() *6));    }
	    else  if( clicked >=1 ){    event.preventDefault(); 
	    Swal.fire({
	    	  icon: 'info',
	    	  text: '이미 이벤트에 참여하셨습니다.',
	    	 
	    	}) }
	    clicked ++
	  });
	})
</script>
</body>

</html>