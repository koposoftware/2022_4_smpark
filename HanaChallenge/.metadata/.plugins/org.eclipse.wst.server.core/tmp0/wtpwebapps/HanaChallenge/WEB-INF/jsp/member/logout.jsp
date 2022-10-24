<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init('bbd5593625485c63ff901a78742bce4e');
	kakaoLogout();  

	function kakaoLogout() {
		if (!Kakao.Auth.getAccessToken()) {
			//alert('Not logged in.');
			location.href = "${pageContext.request.contextPath}/"
			return;
    	 }
		
    	Kakao.Auth.logout(function() {
      		//alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
      		location.href = "${pageContext.request.contextPath}/"
    	});
    }
</script>