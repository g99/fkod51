<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<FORM NAME="Login" id="frm_login" ACTION="${context}/member/mypage.do">

<TABLE WIDTH=620 BORDER=0 ALIGN=CENTER CELLSPACING=0 CELLPADDING=0>

	<TR>
		<TD ALIGN=CENTER WIDTH=320>
			아이디 <INPUT TYPE=TEXT id="userid" SIZE=10 MAXLENGTH=20>&nbsp;&nbsp;
			패스워드 <INPUT TYPE=PASSWORD id="password" SIZE=10 MAXLENGTH=20>
			<IMG id="btn_login" SRC="${context}/images/btn_login.gif" WIDTH=41 HEIGHT=22 ALIGN=ABSBOTTOM STYLE=CURSOR:HAND>
		</TD>    
		<TD ALIGN=RIGHT WIDTH=300>
			<IMG SRC="${context}/images/btn_idpw_srch.gif" STYLE=CURSOR:HAND>
			<IMG SRC="${context}/images/btn_be_member.gif" STYLE=CURSOR:HAND>
		</TD>		
	</TR>
</TABLE>

</FORM>
<SCRIPT>
	$(function() {
		$('#btn_login').click(function() {
			$.ajax({
				url : '${context}/member.do',
				data : {
					userid : $('#userid').val(),
					password : $('#password').val(),
					page : 'login'
				},
				dataType : 'json',
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(data) {
					if (data.result === 'success') {
						$('<div id="login_result"></div>').appendTo($('#frm_login').empty());
						$('#login_result').html(
							'<div>환영합니다 '+data.name+' 님</div>"><button id="close">닫기</button>'
						);
						$('#close').click(function() {
							window.opener.top.location.href 
								= "${context}/main.do?page=auth&userid="+data.userid;
							window.close();
						});
					} else {
						alert('로그인 실패');
					}
				},
				error : function() {
					alert('ajax 실패');
				}
			});
		});
	});
	
</SCRIPT>





