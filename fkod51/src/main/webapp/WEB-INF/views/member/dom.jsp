<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../global/header.jsp"%>
<div class="outbox">
	<div class="box">
		<h3>DOM (Document Object Model) : 문서객체모델</h3>
		HTML 과 XML 문서에 대한 프로그래밍 인터페이스 <br />
		문서에 대한 구조적 정보를 제공하고 문서 구조나 외양 및 내용을 <br />
		바꿀 수 있도록 프로그램에서 접근하는 방법을 제공함 <br />
		DOM 은 속성과 기능을 가지는 객체와 <br />
		노드와 트리구조로 표현됨. 웹 페이지를 스크립트나 개발 언어로 접근 시 필수적 <br />
		<div class="pad"></div>
		<h3>DOM 객체</h3>
		window 안에 있는 HTML 문서 자체를 document 라고 함.
		<h3>element 객체</h3>
		문서에 삽입되어 태그로 만들어진 모든 요소
		<h3>attribute 속성</h3>
		엘리먼트가 가진 속성
		<h3>노드(node)</h3>
		객체를 상징한다. 엘리먼트도 노드이고, 어트리뷰트도 노드이며 엘리먼트 <br />
		내부의 글은 텍스트 노드라고 함.
		<h3>노드가 일반적으로 가지고 있는 메소드</h3>
		<ol>
			<li> creat : 만들다</li>
			<li> add : 추가하다</li>
			<li> append : 붙이다</li>
			<li> remove : 지우다(공간을 그대로 두고 null 값만 바꾼다)</li>
			<li> delete : 삭제하다(공간까지 제거 즉 메모리 회수)</li>
			<li> set : 설정하다</li>
			<li> get : 가져오다</li>
			<li> child : 하나의 직속 하위 객체(노드)</li>
			<li> children : 둘 이상의 직속 하위 객체</li>
			<li> parent : 직속 상위 객체</li>
		</ol>
	</div>
	<div class="box">
		<h3>동적으로 노드 만들기</h3>
		<input type="button" id="btn_open" value="열 기"/>
		<input type="button" id="btn_close" value="닫 기"/>
	</div>
	<div id="domBox" style='background-color : RED;width : 500px; height : 100px; '></div>
</div>
<script type="text/javascript">
	$('#btn_close').click(function() {
		domController.hide(); 
	});
	$('#btn_open').click(function() {
		domController.show();
	});
	var domController = {
		hide : function() {
			$('#domBox').css('display','none');
		},
		show : function() {
			var elem = document.createElement('div');
			var attr = document.createAttribute('style');
			attr.nodeValue = 'background-color : RED; width : 500px; height : 100px;';
			elem.setAttributeNode(attr);
			document.body.appendChild(elem);
		},
		createTag1 : function() {
			
		},
		createTag2 : function() {
			
		},
		selectByTagName : function() {
			
		},
		selectByName : function() {
			
		}
	}
</script>
