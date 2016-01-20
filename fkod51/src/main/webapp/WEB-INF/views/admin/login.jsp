<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${admin_css}/bootstrap.min.css" rel="stylesheet">
<link href="${admin_css}/datepicker3.css" rel="stylesheet">
<link href="${admin_css}/bootstrap-table.css" rel="stylesheet">
<link href="${admin_css}/styles.css" rel="stylesheet">

<!--Icons-->
<script src="${admin_js}/lumino.glyphs.js"></script>

<div style="margin-top:10%; margin-left:45%;">
	<h1>[ Admin ]</h1>
	<br />
	<label for="id" style="display:block;" >아이디</label>
	<input id="id" name="id" type="text" />
	<label for="password" style="display:block;" >비밀번호</label>
	<input id="password" name="password" type="password" / style="display:block;">
	<br />
	<button id="confirm" style="margin-left:15%;">확인</button>
</div>
<br />
<div style="text-align:center; background:white;">
		관리자 계정 : choa <br />
		비 밀 번 호 : 1  
</div>
<script>
	$(function() {
		$("#confirm").click(function() {
			$.ajax(context + "/admin/login",{
				data : {
					"id" : $("#id").val(),
					"password" : $("#password").val()
				},
				success : function(data) {
					if (data.result === "success") {
						location.href = context + "/admin/main";
					} else {
						alert("아이디 비밀번호를 다시 확인해주세요");
					}
				},
				error : function() {
					
				}
			});
		});
	});
</script>