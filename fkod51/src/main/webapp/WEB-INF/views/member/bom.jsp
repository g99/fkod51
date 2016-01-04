<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../global/header.jsp"%>
<div class="outbox">
	<div class="box">
		<input type="button" id="back" value="뒤로가기" />
		<h3>자바스크립트 객체와 자바의 차이점</h3>
		JS 는 객체기반언어이다. Java 는 객체지향언어이다. <br />
		두 언어간의 차이점은 객체를 표현하는데 있어서, 자바는 클래스(객체의 정의)와 <br />
		인스턴스(객체의 실체)를 정확히 구분한다. <br />
		반면 JS는 이의 구별없이 단순히 객체라고 통합하여 말한다. 
	</div>
	<div class="pad"></div>
	<h3>객체의 구분</h3>
	<ul>
		<li>기본객체 : String, Math, Date, Array</li>
		<li>내장객체 : 브라우저객체(BOM), 다큐먼트객체(DOM)</li>
		<li>사용자정의객체 : 개발자가 직접 만든 객체들..예를 들어 var member = {}</li>
	</ul>
	<h3>브라우저 객체(BOM : Browser Object Model) 의 종류</h3>
	웹 브라우저는 최초 HTML 이 로드할 때, HTML 문서와 관계없이  <br />
	5개의 브라우저 객체를 생성한다.
	<ol>
		<li>Window</li>
		<li>Document</li>
		<li>Location</li>
		<li>Navigator</li>
		<li>History</li>
	</ol>
	<p>
		브라우저 객체는 Window 객체라고 불리우며, 브라우저 창이 열릴 때마다
		하나씩만들어진다. ==> ★★★ 
		브라우저 창안에 존재하는 모든 요소(객체)들의 상위객체 window.alert() 와
		같이 사용해야 하나, window 를 생략하고 사용 가능하다.
		(자바에서의 this 의 개념으로 이해하시길...)
		Window 가 최상위 객체이긴 하나, 추상적인 개념의 최상위 객체인 Object 가 존재한다.
	</p>
	<a href="#" id="opener">window.open 열기</a> <br />
	<a href="${context}/js/main.do?page=popup" target="_blank">a태그 새창 열기</a> <br />
	<a href="#" id="location">DOM 페이지 이동</a>
</div>
<script>	
	$('#opener').click(function() {
		bom.popup();
	});
	$('#location').click(function() {
		location.href = "${context}/js/main.do?page=dom";
	});
	$('#back').click(function() {
		history.go(-1);
	});
	var bom = {};
	bom.popup = function() {
		var url     = "${context}/js/main.do?";
        var name    = "팝업";
        var style   = "toolbar=no,status=no,directories=no,scrollbars=yes,location=no,resizable=no,border=0,menubar=no";
        var param   = "page=popup";      //없으면 지워도 됨.
        var width   = 600;   //가로 사이즈 조절
        var height  = 400;    //세로 사이즈 조절
        var xpos    = (screen.availWidth - width  ) / 2;
        var ypos    = (screen.availHeight- height ) / 2;
        style       = style+',top='+ypos+',left='+ xpos +',width=' + width + ',height=' + height;
        url         = url+param;
        window.open(url,'',style);
	        
	}
</script>