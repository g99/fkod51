<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<title>FKOD51 THEATER</title>
  	<meta name="description" content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">
   
    <!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link rel="stylesheet" href="${css}/styles.css" />
	
    <!-- 부트스트랩 스크립트 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
    <script src="${js}/scripts.js"></script>
<<<<<<< HEAD
     <!-- 무비  -->
    <script src="${js}/movie.js"></script>
    <link rel="stylesheet" href="${css}/movie.css" />
    <!-- css추가 -->
    <link rel="stylesheet" href="" />
=======
    
    <!-- css추가 준규-->
    <link rel="stylesheet" href="${css}/new_event.css" />
    
    <!-- js추가 준규 -->
    <script type="text/javascript" src="${js}/new_event.js"></script>
>>>>>>> refs/remotes/origin/master
</head>
<body>
	<div id="wrop">	
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<section class="sectionClass">
				<div class="mainView">
					<tiles:insertAttribute name="content" />
				</div>
			</section>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>

