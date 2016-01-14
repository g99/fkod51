<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 네비게이션 -->
<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand page-scroll" href="#first"><i class="ion-ios-analytics-outline"></i>MTB BOX</a>
        </div>
        <div class="navbar-collapse collapse" id="bs-navbar">
            <ul class="nav navbar-nav">
                <li>

                    <a class="page-scroll" href="#two" style="font-size:1.5em;" id="movie_btn" >영화</a>

                </li>
                <li>
                    <a class="page-scroll" href="#three" style="font-size:1.5em;" id="ticketing_btn">예매</a>
                </li>
                <li>
                    <a class="page-scroll" href="#four" style="font-size:1.5em;" id="theater_btn">극장</a>
                </li>
                <li>
                    <a class="page-scroll" href="#five" style="font-size:1.5em;" id="event_btn">이벤트</a>
                </li>
                <li>
                    <a class="page-scroll" href="#six" style="font-size:1.5em;" id="contact_btn">오시는길</a>
                </li>
                <li>
                    <a class="page-scroll" href="#last" style="font-size:1.5em;" id="contact_btn">팀원소개</a>
                </li>
                <li>
                    <a class="page-scroll" href="${context}/admin" style="font-size:1.5em;" id="contact_btn">관리자</a>
                </li>

                
                <!-- 로그인을 하지 않았을 때 -->
                <c:if test= "${empty sessionScope.user}">
					<li><a class="page-scroll" data-toggle="modal" href="#joinModal" style="font-size: 1.5em;">회원가입</a>
					</li>
				</c:if>
				
				<!-- 로그인 한 후, 로그아웃 버튼 (클릭시, 현재 서버의 logout을 타고 완전 메인으로 리다이렉트 하도록 설정함.) => 현재 이 기능은 마이페이지에서 구현하고 있음
				<c:if test= "${not empty sessionScope.user}">
					<li><a class="page-scroll" href="${context}/member/logout" 
					style="font-size: 1.5em;">로그아웃</a>
					</li>
				</c:if>
				-->
				
            </ul>
            <!-- 로그인을 하지 않았을 때 -->
            <c:if test= "${empty sessionScope.user}">
            	<ul class="nav navbar-nav navbar-right">
               		 <li>
                 	   <a class="page-scroll" data-toggle="modal" title="A free Bootstrap video landing theme" href="#loginModal" style="font-size:1.5em;">로그인</a>
              	 	</li>
            	</ul>
            </c:if>
            
             <!-- 로그인을 하였을 때, 마이페이지와 내정보수정페이지 띄우기. -->
            <c:if test= "${not empty sessionScope.user}">
            	<ul class="nav navbar-nav navbar-right">
               		 <li>
                 	   <a class="page-scroll" data-toggle="modal" 
                 	   href="#mypage_Modal" 
                 	   style="font-size:1.5em;">${user.id}</a>
              	 	</li>
            	</ul>
            </c:if>
        </div>
    </div>
</nav>

<!-- 헤더 -->
<header id="first">
     <div class="header-content">
         <div class="inner">
             <h1 class="cursive">MTB BOX</h1>
             <h4>세상을 바꾸는 힘.</h4>
             <hr>
             <a href="#video-background" id="toggleVideo" data-toggle="collapse" class="btn btn-primary btn-xl">동영상 끄기</a>
         </div>
     </div>
     <video autoplay="" loop="" class="fillWidth fadeIn wow collapse in" data-wow-delay="0.5s" poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg" id="video-background">
         <source src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Traffic-blurred2.mp4" type="video/mp4">Your browser does not support the video tag. I suggest you upgrade your browser.
     </video>
     <div id = "open_Wrap"></div>
</header>

<script>
	 $(function() {
		 $("#toggleVideo").click(function() {
			 	$("#toggleVideo").remove();
				$(".header-content").animate({
					"padding-bottom":"40%"
				},1200);
				$("#open_Wrap").load(context + "/home");
		 });
		 
		 newEvent.init(1);
	 });
 </script>