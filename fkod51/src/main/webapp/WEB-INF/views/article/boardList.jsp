<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="PAGESIZE" value="5"/>
<c:set var="GROUPSIZE" value="2"/>
<style>
.white-popup {
  position: relative;
  background: #FFF;
  padding: 20px;
  width: auto;
  max-width: 500px;
  margin: 20px auto;
}
</style>
<div id="test-popup" class="white-popup mfp-hide">
	<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER><FONT SIZE=4><B>게시판 ( 게시글 입력 )</B></FONT></TD>
	</TR>
</TABLE>



<FORM NAME="BoardWrite" METHOD=POST ACTION="BoardWriteProc.jsp">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="subject" SIZE=70>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="content" COLS=70 ROWS=8></TEXTAREA>
		</TD>
	</TR>
	
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=110 ALIGN=LEFT>
			<IMG id="go_list" SRC="${img}/btn_list.gif" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=400 ALIGN=CENTER>		
			<IMG id="save" SRC="${img}/btn_save.gif" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<IMG SRC="${img}/btn_cancel.gif" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>   
	</TR>
	
</TABLE>
</div>
<a href="#test-popup" class="open-popup-link">Show inline popup</a>
<a href="mobile-friendly-page.html" data-mfp-src="#test-popup" class="open-popup-link">Show inline popup</a>
<script type="text/javascript">
	$(function() {
		board.init(context + "/article/list/1");
	    $('.open-popup-link').magnificPopup({
	    	 type:'inline',
	    	 midClick: true 
	    	});
	});
	
	var board = {
		
		init : function(url) {
			$.getJSON(url, function(data) {
				var table =	'<div id="boardList"><TABLE id="tab_top"><TR BGCOLOR=#A0A0A0><TD ALIGN=CENTER><FONT SIZE=4><B>자유게시판</B></FONT></TD></TR></TABLE>'+
							'<table id="member"><tr><td>게시글수 : '+ data.count+'&nbsp;&nbsp;&nbsp;<button id="btn_write" style="color:black;">글쓰기</button></td></tr></table>'+
							'<TABLE id="tab_boardList"><TR ALIGN=CENTER><TD WIDTH=5%><B>번호</B></TD><TD WIDTH=10%><B>이름</B></TD><TD WIDTH=50%><B>제목</B></TD><TD WIDTH=15%><B>등록일</B></TD><TD WIDTH=10%><B>방문자수</B></TD></TR>';
				
				$.each(data.list, function() {
					table += '<TR><TD WIDTH=5% ALIGN=CENTER>'+this.rcdNo+'</TD><TD WIDTH=10% ALIGN=CENTER>'+this.usrName+'</TD><TD WIDTH=50% ALIGN=CENTER><A HREF="BoardContent.jsp">'+this.usrSubject+'</A></TD><TD WIDTH=15% ALIGN=CENTER>'+this.usrDate+'</TD><TD WIDTH=10% ALIGN=CENTER>'+this.usrRefer+'</TD></TR>';
				});
				
				table += '</TABLE></div>';
				$(".mainView").html(table);
				$("#btn_write").click(function() {
					board.write();
				});
			});
		},
		write : function() {
			location.href = "${context}/article/write";
		} 
	}
</script>
<!-- 전체 레코드 수 - ((현재페이지 번호-1)*현재페이지당 레코드수+현재게시물출력순서)
count - ((nowPage-1)*rowPerPage + status.index) -->