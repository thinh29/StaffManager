<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Phòng chat nhân viên</title>
</head>
<body>	

		<nav class="navbar navbar-dark bg-primary">
		<img style="border-radius: 80%;" src="https://firebasestorage.googleapis.com/v0/b/luu-hinh-voi-firebase.appspot.com/o/love-letter.gif?alt=media&token=bf145af3-9037-4b29-8247-653f5d3d28ca" 
			alt="this slowpoke moves"  width="50" />
			<h2 style="color:white">Phòng chat nhân viên trực tuyến</h2>
			<img style="border-radius: 80%;" src="https://firebasestorage.googleapis.com/v0/b/luu-hinh-voi-firebase.appspot.com/o/message.gif?alt=media&token=4add73f0-fa1a-4858-96ce-417e9656a118" 
			alt="this slowpoke moves"  width="50" />
		</nav>
		<div class="table-wrapper-scroll-y my-custom-scrollbar" id="scroll-view" style="height:300px; border-style: groove">
			<!-- ---------------- -->
		 	<aside class="tengah-side">
		 		<div class="group-rom">
                    	<div class="textAreaMessage" id="textAreaMessage"></div>
                	</div>
		 		 	 
           </aside>
		<!-- ------------------------- -->
		</div><br>
		
		<div class="row">
			<div class="col-lg-3">
				<input id="textMessage" type="text" value="${account.username}" readonly required="required" class="form-control"
				placeholder="Nhập tin nhắn..." />
			</div>
			<div class="col-lg-1.5">
				<input id="send" onclick="sendMessage()" value="Kết nối" type="button" class="btn btn-outline-primary my-2 my-sm-0"/> <br/><br/>
			</div>
		</div>
		
		
		
		
		<script type="text/javascript">
			var websocket = new WebSocket("ws://localhost:8080/chatRoomServer");
				websocket.onopen = function(message) {processOpen(message);};
				websocket.onmessage = function(message) {processMessage(message);};
				websocket.onclose = function(message) {processClose(message);};
				websocket.onerror = function(message) {processError(message);};

			function processOpen(message) {
				var div = document.getElementById('textAreaMessage');
				div.innerHTML +="<div style=margin:20px><span class='badge badge-success' style=font-size:16px;padding:10px>Hệ thống: Máy chủ đã kết nối... </span></div>";
				div.innerHTML +="<div style=margin:20px><span class='badge badge-success' style=font-size:16px;padding:10px>Hệ thống: Vui lòng kết nối tài khoản vào phòng chat... </span></div>";
				var element = document.getElementById("scroll-view");
				element.scrollTop = element.scrollHeight;
			}
			function processMessage(message) {
				textAreaMessage.value =message.data + " \n";
				var usernameSplit = textAreaMessage.value.split('(');
				var div = document.getElementById('textAreaMessage');
				var username='${account.username}';
				if(textAreaMessage.value.includes("Hệ thống")){
					div.innerHTML += "<div style=margin:20px><span class='badge badge-success' style=font-size:16px;padding:10px>"+textAreaMessage.value+"</span></div>";
				}else{
					if(usernameSplit[0]==username){
						div.innerHTML += "<div class=text-right style=margin:20px><span class='badge badge-primary' style=font-size:16px;padding:10px>(Bạn)"+textAreaMessage.value+"</span></div>";
					}else{
						div.innerHTML += "<div style=margin:20px><span class='badge badge-dark' style=font-size:16px;padding:10px>"+textAreaMessage.value+"</span></div>";
					}
				}
				var element = document.getElementById("scroll-view");
				element.scrollTop = element.scrollHeight;
			}
			
			function processClose(message) {
				var div = document.getElementById('textAreaMessage');
				div.innerHTML +="<div style=margin:20px><span class='badge badge-danger' style=font-size:16px;padding:10px>Hệ thống: Máy chủ đã ngắt kết nối... </span></div>";
				var element = document.getElementById("scroll-view");
				element.scrollTop = element.scrollHeight;
			}
			function processError(message) {
				var div = document.getElementById('textAreaMessage');
				div.innerHTML +="<div style=margin:20px><span class='badge badge-danger' style=font-size:16px;padding:10px>Hệ thống: Lỗi... </span></div>";
				var element = document.getElementById("scroll-view");
				element.scrollTop = element.scrollHeight;
			}

			function sendMessage() {
				if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
					websocket.send(textMessage.value);
					textMessage.value = "";
					$("#textMessage").prop('readonly', false);
					send.value="Gửi tin nhắn";
					$('#select').prop('disabled',false);
				}
			}

		</script>
		
</body>
</html>