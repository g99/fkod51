<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>404 에러</title>
</head>
<body>
	<div>
	<img src="${img}/error404.png" alt="error404" />
	</div>
</body>
</html>
<!-- 
	HTTP 프로토콜에 정의된 에러번호
	200 : 정상, success
	307 : 리다이렉트, response.sendRedirect()를 이용할 경우
	400 : 문법에러
	401 : 접근불가 Access Deny
	404 : URL에 따른 페이지가 존재하지 않음
	405 : 요청된 메소드는 허용불가(get/post 방식)
	500 : JSP 문서내에서 오류발생
	503 : 서버부하, 예) 디도스
 --> 