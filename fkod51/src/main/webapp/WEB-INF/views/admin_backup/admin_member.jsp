<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date"/>
<div id="header"></div>
<div class="list-group" id="main_left">
  <a href="#" class="list-group-item active">
    관리자 기능
  </a>
  <a href="#" class="list-group-item" id="admin_home">홈</a>
  <a href="#" class="list-group-item" id="mgmt_member">회원관리</a>
  <a href="#" class="list-group-item" id="mgmt_prod">제품관리</a>
  <a href="#" class="list-group-item" id="mgmt_emp">사원관리</a>
  <a href="#" class="list-group-item" id="mgmt_stat">통계보기</a>
</div>
<div id="main_right">
<h1>회원목록</h1>
<c:choose>
 <c:when test="${fn:length(memberList)==0}">
  <table id="tab_member">
   <tr>
    <th>아이디</th>
    <th>이름</th>
    <th>성별</th>
    <th>생년원일</th>
    <th>전화번호</th>
    <th>이메일</th>
   </tr>
   <tr>
    <td colspan="6"><h2>회원목록이 없습니다.</h2></td>
   </tr>
  </table>
 </c:when>
 <c:otherwise>
  <table id="tab_member">
  <tr>
    <th>아이디</th>
    <th>이름</th>
    <th>성별</th>
    <th>생년원일</th>
    <th>전화번호</th>
    <th>이메일</th>
   </tr>
   <c:forEach var="member" items="${memberList}">
    <tr>
     <td>${member.userid}</td>
     <td>${member.name}</td>
     <td>${member.gender}</td>
     <td>${member.birth}</td>
     <td>${member.phone}</td>
     <td>${member.email}</td>
    </tr>
   </c:forEach>
  </table>
 </c:otherwise>
</c:choose>
<h1>테이블 생성</h1>
<form action="${context}/bank/main.do" id="frm_admin_result"
 id="frm_admin_table">
 <input type="text" name="table_name" placeholder="테이블명 입력" /> <input
  type="text" name="column" placeholder="컬럼명 입력" /> <input type="text"
  name="pk" placeholder="프라이머리 키 입력" /> <input type="button"
  id="btn_admin_table" value="생 성" />
 <!--  GET 방식 <input type="hidden" name="page" value="admin_result"/> -->
</form>
</div>
<script>
$(function() {
	$('#header').load('${context}/admin.do?page=header');
	$('#main_left').css("float","left").css('width','300px').css('text-align','center');
	$('#main_right').css("float","left").css("margin-left","150px").css('width','50%');
	$('#tab_member').css('width','100%');
	$('#mgmt_member').click(function() {
		Admin.memberList();
	});
});	
 $('#btn_admin_table').click(function() {
    $('#btn_admin_table').submit();
  });
 var Admin = {
	 memberList : function() {
		
	}
 };
</script>