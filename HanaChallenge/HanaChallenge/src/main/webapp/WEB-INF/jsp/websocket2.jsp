<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="/webjars/sockjs-client/sockjs.min.js"></script>
		<script src="/webjars/stomp-websocket/stomp.min.js"></script>
		<script
		  src="https://code.jquery.com/jquery-3.6.0.js"
		  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		  crossorigin="anonymous">
		</script>
		<script src="/js/core/bootstrap.min.js"></script>
		<script src="/js/websocket/websocket.js"></script>
		<title>Insert title here</title>
	</head>
	<body>
		<section id="main-content">
			<section class="wrapper">
				<h3><i class="fa fa-angle-right"></i> WebSocket</h3>
				<div class="row">
				    <div class="col-md-6">
				        <form class="form-inline">
				            <div class="form-group">
								<label for="connect">WebSocket connection:</label>
				                <button id="connect" class="btn btn-default" type="submit">Connect</button>
				                <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">Disconnect
				                </button>
				            </div>
				        </form>
				    </div>
				    <div class="col-md-6">
				        <form class="form-inline">
				            <div class="form-group">
				                <label for="name">websocket2</label>
				                <input type="text" id="name2" class="form-control" placeholder="Your name here...">
				            </div>
				            <button id="send2" class="btn btn-default" type="submit">Send</button>
				        </form>
				    </div>
				</div>
				<div class="row">
				    <div class="col-md-12">
				        <table id="conversation" class="table table-striped">
				            <thead>
				            <tr>
				                <th>Greetings</th>
				            </tr>
				            </thead>
				            <tbody id="greetings2">
				            </tbody>
				        </table>
				    </div>
				</div>
			</section>
		</section>
	</body>
</html>