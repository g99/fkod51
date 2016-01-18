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
            	<c:set var="userid" value="${user.id}"></c:set>
            	<ul class="nav navbar-nav navbar-right">
               		 <li>
                 	   <a class="page-scroll" data-toggle="modal" 
                 	   href="#mypage_Modal" id="id_Click" 
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
         <div class="inner" style="padding-top:45%;">
             <h1 class="cursive" >MTB BOX</h1>
             <h4>세상을 바꾸는 힘.</h4>
             <hr>
             <a href="#video-background" id="toggleVideo" data-toggle="collapse" class="btn btn-primary btn-xl">동영상 끄기</a>
         </div>
         <div class="image_container" style="visibility:hidden;">
			 <div class="slider_wrapper">
				<ul id="image_slider">
					<li><img src="${img}/movie-slide1.jpg" style="height:100%;"></li>
					<li><img src="${img}/movie-slide2.jpg" style="height:100%;"></li>
					<li><img src="${img}/movie-slide3.jpg" style="height:100%;"></li>
					<li><img src="${img}/movie-slide4.jpg" style="height:100%;"></li>
					<li><img src="${img}/movie-slide5.jpg" style="height:100%;"></li>
					<li><img src="${img}/movie-slide6.jpg" style="height:100%;"></li>
				</ul>					
				<span class="nvgt" id="prev"></span>
				<span class="nvgt" id="next"></span>		
			 </div>
			 <ul id="pager">
			 </ul>
	     </div>
     </div>
     <video autoplay="" loop="" class="fillWidth fadeIn wow collapse in" data-wow-delay="0.0s" poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg" id="video-background">
         <source src="https://drive.google.com/uc?export=download&id=0B_K1Ynnn_h7QMFdybTM0TTRacGM" type="video/mp4">Your browser does not support the video tag. I suggest you upgrade your browser.
     </video>
</header>

<script>
	 var userid = "${userid}";
	 $(function() {
		 $("#toggleVideo").click(function() {
			this.remove();
			slider.init();
			$(".inner").animate({
				"padding-top" : "0",
			},1000, function() {
				$(".image_container").removeAttr("style");
				$(".inner h1, .inner h4").css("color","bisque");
			});
			
			});
		 newEvent.init(1);
		 
	 });
 </script>