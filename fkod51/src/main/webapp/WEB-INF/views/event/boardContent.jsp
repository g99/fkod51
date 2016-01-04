<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="${css}/board.css"/>		
	<TITLE>게시글 출력</TITLE>
</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER><FONT SIZE=4><B>게시판 ( 게시글 출력 )</B></FONT></TD>
	</TR>
</TABLE>

<BODY>

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=1 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>
		<TD WIDTH=500>홍길동</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>전자우편</B></TD>
		<TD WIDTH=500>hong@abc.com</TD>
	</TR>
	
		<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>홍길동입니다.</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>안녕하세요.<BR>홍길동입니다.</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>첨부파일</B></TD>
		<TD WIDTH=500>첨부된 파일이 없습니다.</TD>
	</TR> 
	 
</TABLE>


<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH="310" ALIGN=LEFT>
			<IMG SRC="${img}/btn_list.gif" STYLE=CURSOR:HAND onClick="javascript:location.replace('BoardList.jsp')">
		</TD>
		<TD WIDTH="310" ALIGN=RIGHT>    	
			<IMG SRC="${img}/btn_reply.gif" STYLE=CURSOR:HAND onClick="javascript:location.replace('BoardReply.jsp')">&nbsp;&nbsp;
			<IMG SRC=".${img}/btn_mdfy.gif" STYLE=CURSOR:HAND onClick="javascript:location.replace('BoardModify.jsp')">&nbsp;&nbsp;
			<IMG SRC="${img}/btn_del.gif" STYLE=CURSOR:HAND onClick="javascript:location.replace('BoardDelete.jsp')">
		</TD>
	</TR>
	
</TABLE>

</BODY>
</HTML>