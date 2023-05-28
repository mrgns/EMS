<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col">
				<nav class="navbar navbar-expand-lg navbar-light"
					style="height: 73px; background:#AFD3E2; display: flex; justify-content: center;">
					<a class="navbar-brand" style="color: white;" href="#"><b><h2>EMPLOYEE
								MANAGEMENT SYSTEM</h2></b></a>
				</nav>
				</div>
				<div class="container" id="warning">
					<h1>Please Login <a href='home'>again</a></h1>
				</div>
				<script>
				 $(document).ready(function(){
			 		 var status = '${status}';
			 		if(status != ""){
				 		 if(status == 'success'){
				 			swal({
				 				  title: 'Username/Password wrong',
				 				  text: 'login again',
				 				  icon: "error",
				 				  button: "close",
				 			});
				 		 }
			 		} else{
			 			swal({
			 				  title: 'Session Expired',
			 				  text: 'login again',
			 				  icon: "error",
			 				  button: "close",
			 			});
			 		 }
			 		
			 	}); 
				</script>
</body>
</html>
