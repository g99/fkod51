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
	
	<!-- 관리자 css -->
	<link rel="stylesheet" href="${admin_css}/common.css"/>
 	
 	<!-- 관리자 스크립트 -->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 	<script src="${admin_js}/lumino.glyphs.js"></script>
 	<script src="${admin_js}/bootstrap-datepicker.js"></script>
	<script src="${admin_js}/bootstrap-table.js"></script>
	<script src="${admin_js}/bootstrap.js"></script>
	<script src="${admin_js}/bootstrap.min.js"></script>
	<script src="${admin_js}/html5shiv.min.js"></script>
	<script src="${admin_js}/respond.min.js"></script>
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

