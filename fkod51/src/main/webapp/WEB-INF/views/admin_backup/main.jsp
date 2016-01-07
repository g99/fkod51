<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>하이</h1>

<!-- <a href="" onclick=""></a>
<script type="text/javascript">
$(function() {
	admin.draw("1");
});	

 var admin = {
		 draw : function(page) {
				$.getJSON(context+'/admin/member_list/'+page,function(data) {
					var count = data.count;
					var pageNo = parseInt(data.pageNo);
					var startPage = parseInt(data.startPage);
					var lastPage = parseInt(data.lastPage);
					var totalPage = parseInt(data.totalPage);
					var groupSize = parseInt(data.groupSize);
					
					var table = 
						"<div id='boardList'><h1 align=center style='color:white;margin-bottom:30px'>회원목록</h1>"
						+"<TABLE id='tab_boardList'>"
						+"<TR><TD STYLE='TEXT-ALIGN:RIGHT;' COLSPAN='5'>회원수 : "+count+"</TD></TR>"
						+"<TR ALIGN=CENTER>"
						+"<TD WIDTH=10%><B>번호</B></TD>"
						+"<TD WIDTH=20%><B>아이디</B></TD>"
						+"<TD WIDTH=20%><B>회원명</B></TD>"
						+"<TD WIDTH=30%><B>이메일</B></TD>"
						+"<TD WIDTH=18%><B>가입일</B></TD></TR>";
						$.each(data.list,function(index,value) {
							table += 
							"<TR><TD WIDTH=10% ALIGN=CENTER>"+(index+1)+"</TD>"
							+"<TD WIDTH=20% ALIGN=CENTER>"+this.id+"</TD>"
							+"<TD WIDTH=20% ALIGN=CENTER><A HREF='BoardContent.jsp'>"+this.name+"</A></TD>"
							+"<TD WIDTH=30% ALIGN=LEFT>"+this.email+"</TD>"
							+"<TD WIDTH=18% ALIGN=CENTER>"+this.regdate+"</TD></TR>"
						});
						table += "</TABLE></div>";
						var pagination = 
							'<TABLE id="pagination">'
							+'<TR>'
							+'<TD ALIGN=LEFT WIDTH=100>'
							+'<IMG SRC="${img}/btn_new.gif" onClick=""; STYLE=CURSOR:HAND>'
							+'</TD>'
							+'<TD WIDTH=320 ALIGN=CENTER>';
						
						if (startPage != 1) {
							pagination += 
							'<a href="#" onclick="admin.draw(1)">'
							+'<IMG SRC="${img}/btn_bf_block.gif">&nbsp;'
							+'</a>'
							+'<a href="#" onclick="admin.draw('+(startPage-groupSize)+')">'
							+'<IMG SRC="${img}/btn_bf_page.gif">&nbsp;'
							+'</a>'
						}
						
						for (var i = startPage; i <= lastPage; i++) {
							if (i == pageNo ) {
								pagination +=
									'<font style="color:red;font-size: 20px">'+i+'</font>';
							} else {
								pagination +=
									'<a href="#" onclick="admin.draw('+i+')">'
									+'<font>'+i+'</font>'
									+'</a>';
							}
						}
						
						if (lastPage != totalPage) {
							pagination +=
							    '<a href="#" onclick="admin.draw('+(startPage + groupSize)+')">'
			    	            +'<IMG SRC=" ${img}/btn_nxt_page.gif"> &nbsp;'
			           			+'</a>'
			           			+'<a href="#" onclick="admin.draw('+(totalPage - ((totalPage-1) % groupSize))+')">'
			                	+'<IMG SRC=" ${img}/btn_nxt_block.gif"> &nbsp;'
			           			+'</a>';
						}
						
						pagination +=
						'</TD>'
						+'<TD WIDTH=200 ALIGN=RIGHT><FORM NAME="memberSearch" action="${context}/event/memberSearch/1">'
						+'<SELECT NAME="column" SIZE=1>'
						+'<OPTION VALUE="" SELECTED>선택</OPTION>'
						+'<OPTION VALUE="id">ID</OPTION>'
						+'<OPTION VALUE="name">이름</OPTION>'
						+'<OPTION VALUE="gender">성별</OPTION>'
						+'</SELECT> '
						+'<INPUT TYPE=TEXT NAME="keyword" SIZE=10 MAXLENGTH=20>'
						+'<input type="submit" value="검 색">'
						+'</FORM>'
						+'</TD>'
						+'</TR>'
						+'</TABLE>';
						
						table += pagination;
						$('.mainView').html(table);
				});
		}
 };
 </script> -->