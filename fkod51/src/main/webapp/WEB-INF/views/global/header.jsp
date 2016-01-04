<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<div>
	<div id="frm_toggle">
	<c:if test="${empty sessionScope.user}">
	   	<!-- 로그인 안한 상태 -->
		<div id="frm_login" class="form-2">
			<p class="float">
				<label for="login"><i class="icon-user">ID</i></label> <input type="text" id="id" name="id" placeholder="UserID">
			</p>
			<p class="float">
				<label for="password"><i class="icon-user">PW</i></label> <input type="password" id="password" name="password" placeholder="Password" class="showpassword">
			</p>
			<p class="clearfix">
				<a id="join_btn" class="log-twitter">회원 가입</a> 
				<a id="login_btn" class="log-twitter" style="margin-left:10px;">로그인</a> 
			</p>
		</div>
		</c:if>
		<c:if test="${not empty sessionScope.user}">
			<div id="frm_logined" class="form-2">
				<p style="color:white;">${user.name}님 반갑습니다.</p><p class="clearfix"></p>
					<input id="logout_btn" type="submit" name="submit" value="로그아웃">
					<input id="mypage_btn" type="submit" name="submit" value="마이 페이지" style="width: 85px;">
			</div>
		</c:if>
		</div>

		<div id="home" class="brand" style="padding-left: 390px; padding-right: 390px;">MTB BOX</div>

		<div class="address-bar" style="padding-left: 400px; padding-right: 400px;">
		세상을 바꾸는 힘, Culture MTB(Movie Theater BOX)</div>
	</div>

	<!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation" >
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style=" margin-left:33%;" >
                <ul class="nav navbar-nav">
                    <li>
                        <button id="movie_btn">영화</button> <!-- 네비바 해당 링크 존재 -->
                    </li>
                    <li>
                        <button id="ticket_btn">예매</button>
                    </li>
                    <li>
                        <button id="theater_btn">극장</button>
                    </li>
                    <li>
                        <button id="article_btn">게시판</button>
                    </li>
                    <li>
                        <button id="admin_btn">관리자</button>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
    </nav>

<script type="text/javascript">
	$(function() {
		
		/* 메인 버튼 */
		$("#home").click(function() {
			$("#box").load(context + "/global/Main.do?page=default");
		});
		
		/* 네비게이션 버튼 */
		$("#movie_btn").click(function() {
			alert("영화버튼 클릭");
			Movie.home(context);
		});
		
		$("#ticket_btn").click(function() {
			$("#box").load(context + "/ticket/Ticket.do");
		});
		
		$("#theater_btn").click(function() {
			location.href = context + "/global/new";
		});
		
		$("#article_btn").click(function() {
			location.href=context + "/article/home";
		});
		
		$("#admin_btn").click(function() {
			location.href=context + "/admin/main";
		});
		
		/* 로그인 버튼 */
		$("#header").on("click","#join_btn",function() {
			Member.join(context);
		});
	
		$("#header").on("click","#login_btn",function() {
			Member.login(context);
		});
		
		$("#header").on("click","#logout_btn",function() {
			Member.logout(context);
		});
		
		/*마이페이지 버튼 */
		$("#header").on("click", "#mypage_btn",function() {
			$("#box").load(context + "/member/Member.do?page=mypage");
		});
		
		/* 관리자 버튼 */
		$("#outbox").on("click","#admin_home",function() {
			Admin.home(context);
		});
		$("#outbox").on("click","#admin_member",function() {
			Admin.member(context);
		});
		$("#outbox").on("click","#admin_movie",function() {
			Admin.movie(context);
		});
	});
</script>
