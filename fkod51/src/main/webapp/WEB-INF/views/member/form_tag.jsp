<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../global/header.jsp"%>
<form action="${context}/form_tag/school_register.do" id="frm_checkbox">
	이름 : <input type="text" name="name" />
	나이 : <input type="text" name="age" />
	<h1>주소</h1>
	<input type="radio" name="addr" value="서울" checked/> 서울
	<input type="radio" name="addr" value="인천" /> 인천
	<input type="radio" name="addr" value="경기" /> 경기
	<input type="radio" name="addr" value="부산" /> 부산
	<h1>전공</h1>
	<select name="major" id="major">
		<option value="not">전공선택</option>
		<option value="컴퓨터공학">컴퓨터공학</option>
		<option value="네트워크공학">네트워크공학</option>
		<option value="정보통신">정보통신</option>
		<option value="응용프로그래밍">응용프로그래밍</option>
	</select>
	<h1>수강 과목</h1>
	<input type="checkbox" name="subject" value="ASP프로그래밍"/> ASP프로그래밍
	<input type="checkbox" name="subject" value="PHP프로그래밍" /> PHP프로그래밍
	<input type="checkbox" name="subject" value="JSP프로그래밍" /> JSP프로그래밍
	<input type="checkbox" name="subject" value="Java프로그래밍" /> Java프로그래밍
	<input type="checkbox" name="subject" value="오라클" /> 오라클
	<input type="checkbox" name="subject" value="스프링" /> 스프링
	<input type="checkbox" name="subject" value="리눅스" /> 리눅스
	<input type="checkbox" name="subject" value="노드JS" /> 노드JS
	<input type="checkbox" name="subject" value="웹표준" /> 웹표준
	<input type="button" id="btn_form_tag" value="확 인" />
</form>
<script type="text/javascript">
$('#btn_form_tag').click(function() {
	var addr = $("input:radio[name=addr]:checked").val();
	var count = $("input:checkbox:checked").length;
	var subjects = formTag.checkbox($("input:checkbox:checked"));
	var major = $("select[name=major] option:selected").val();
	var name = $('input:text[name=name]').val();
	var age = $('input:text[name=age]').val();
	alert('이름 : '+name+",나이: "+age+",주소 :"+addr+"\n전공: "
			+major+"\n수강과목("+count+"과목): "+subjects);
});
var formTag = {};
formTag.checkbox = function(subjects) {
	var arr = [];
	subjects.each(function() {
		arr.push($(this).val());
	});
	return arr;
}
</script>