<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<TABLE WIDTH=500 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>주소찾기 - 2단계</B></FONT></TD>
	</TR>

<%
	int ok=0;
	if( ok != 0 ) {
		//------------------------------- 해당 주소가 존재하는 경우 주소 선택
%>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=450 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR>
 					<TD ALIGN=CENTER HEIGHT=30><BR>총 1개의 주소가 검색되었습니다.</TD>
				</TR>
				<TR><TD HEIGHT=2 BGCOLOR=#AAAAAA></TD></TR>
 				<TR><TD HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=400 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR><TD WIDTH=400 HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
				<TR>
 					<TD>[135-810] 서울시 강남구 개포1동 660</TD>
				</TR>
				<TR><TD HEIGHT=1 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#E2E2E2></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

	<TR>
		<TD ALIGN=CENTER>
			<TABLE WIDTH=450 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
				<TR><TD HEIGHT=10 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=3 BGCOLOR=#AAAAAA></TD></TR>
				<TR><TD HEIGHT=3 BGCOLOR=#FFFFFF></TD></TR>
			</TABLE>
		</TD>
	</TR>

<%
	} else {
	//------------------------------- 해당 주소가 존재하지 않는 경우 처리
%>

	<TR>
		<TD ALIGN=CENTER>
		
			<FORM NAME="AddressSearch2" METHOD=POST ACTION="AddressSearch_2.jsp">
			
			<TABLE WIDTH=400 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>
			
				<TR><TD WIDTH=400 HEIGHT=2 BGCOLOR=#FFFFFF></TD></TR>
				
				<TR>
					<TD ALIGN=CENTER><BR>해당 주소가 존재하지 않습니다. 다시 입력하세요.</TD>
				</TR>
				
				<TR><TD HEIGHT=3 BGCOLOR=#FFFFFF></TD></TR>
				<TR><TD HEIGHT=1 BGCOLOR=#E2E2E2></TD></TR>
				<TR><TD HEIGHT=4 BGCOLOR=#FFFFFF></TD></TR>
				
				<TR>
					<TD ALIGN=CENTER>
						<INPUT TYPE=TEXT NAME="UserAddress" SIZE=20 MAXLENGTH=20>
						<IMG SRC="../images/btn_search.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND><BR><BR>
						찾고자 하시는 읍, 명, 동의 이름을 입력하세요.<BR>(예) 신도림동인 경우 '신도림'
					</TD>
				</TR>
				
			</TABLE>
			
			</FORM>
			
		</TD>
	</TR>

<%
	}
%>

</TABLE>