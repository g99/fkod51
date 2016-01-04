<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>아이디 중복검사</B></FONT></TD>
	</TR>
<%
  int ok=0;
  if(ok == 0) {
		//-------------------------------아이디가 이미 존재하는 경우
%>

	<TR>
		<TD ALIGN=CENTER>

			<FORM NAME="IdCheck" METHOD=POST ACTION="IdCheck.jsp">
			
			<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<TD ALIGN=CENTER HEIGHT=70>
						입력하신 은(는) 이미 등록된 아이디입니다.<BR>다른 아이디를 선택하세요.
					</TD>
				</TR>
				
				<TR>
					<TD ALIGN=CENTER HEIGHT=40>
 						<INPUT TYPE=TEXT NAME="UserId" SIZE=20 MAXLENGTH=20>
							<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE>
					</TD>
				</TR>
				
			</TABLE>
			
			</FORM>

		</TD>
	</TR>

<%
  } else {
		//------------------------------- 사용 가능한 아이디일 경우
%>

	<TR>
		<TD ALIGN=CENTER>
		
			<TABLE WIDTH=300 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR>
					<TD ALIGN=CENTER HEIGHT=70>
						입력하신 은(는) 사용가능한 아이디입니다.<BR>이 아이디를 사용하시겠습니까?
					</TD>
				</TR>
				
				<TR>
					<TD ALIGN=CENTER HEIGHT=40>
						<IMG SRC="../images/btn_id_confirm.gif" BORDER=0 STYLE=CURSOR:HAND>
					</TD>
				</TR>
				
			</TABLE>
			
		</TD>
	</TR>

<%
//------------------------------- JSP CODE START 
  }
//------------------------------- JSP CODE END 
%>

</TABLE>