<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<!-- 트레일러&이벤트 -->
<section class="bg-primary" id="one">
    <div class="container" style="padding-right: 200px;">
                
                <!-- 트레일러 영상 -->
				<div>
					<div>
						<iframe style="width: 80%; height: 75%; float: left; border: none;"
								src="https://www.youtube.com/embed/UZy8aopPmwE"> </iframe>
					</div>
					<div style="width: 10%; height: 75%; float: left; margin-left: 15px;">
							<!-- 포스터, 이미지에 링크 걸어주기 -->
							<img src="${img}/naebuja_Main.jpg" alt="sample_img" 
							style="width: 400%; height: 100%; float: left; display: inline;"/>
					</div>
				</div>
				
				
    </div>
</section>



<!-- 극장, 극장별 설명 - main -->
<section id="two" class="no-padding">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <a href="#starium" class="gallery-box" data-toggle="modal" data-src="${img}/starium_main.jpg">
                        <img src="${img}/starium_main.jpg" class="img-responsive" alt="Image 1" style ="width: 527px; height: 340px;">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg">STARIUM</i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-sm-6">
                    <a href="#sound_X" class="gallery-box" data-toggle="modal" data-src="${img}/sound_X_Main.PNG">
                        <img src="${img}/sound_X_Main.PNG" class="img-responsive" alt="Image 2" style ="width: 527px; height: 340px;">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                               <div>
                                    <i class="icon-lg">Sound-X</i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-sm-6">
                    <a href="#screen_X" class="gallery-box" data-toggle="modal" data-src="${img}/screen_X_Main.PNG">
                        <img src="${img}/screen_X_Main.PNG" class="img-responsive" alt="Image 3" style ="width: 527px; height: 340px;">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg">Screen-X</i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-sm-6">
                    <a href="#i_Max" class="gallery-box" data-toggle="modal" data-src="${img}/i_Max_Main.jpg">
                        <img src="${img}/i_Max_Main.jpg" class="img-responsive" alt="Image 4" style ="width: 527px; height: 340px;">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg">I-MAX</i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-sm-6">
                    <a href="#sweetbox" class="gallery-box" data-toggle="modal" data-src="${img}/sweetbox_Main.PNG">
                        <img src="${img}/sweetbox_Main.PNG" class="img-responsive" alt="Image 5" style ="width: 527px; height: 340px;">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                 <div>
                                    <i class="icon-lg">Sweet BOX</i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-sm-6">
                    <a href="#tempur_Cinema" class="gallery-box" data-toggle="modal" data-src="${img}/tempur_Cinema_Main.PNG">
                        <img src="${img}/tempur_Cinema_Main.PNG" class="img-responsive" alt="Image 6" style ="width: 527px; height: 340px;">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg">TEMPUR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;CINEMA</i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>


<!-- 극장 클릭시, 팝업 페이지들 - Popup(view) -->   
<div id="starium" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-body">
    		<img src="${img}/starium.jpg" id="galleryImage" class="img-responsive" />
    		<p>
    		    <br/>
    		    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
    		</p>
    	</div>
    </div>
    </div>
</div>

<div id="sound_X" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-body">
    		<img src="${img}/sound_X.jpg" id="galleryImage" class="img-responsive" />
    		<p>
    		    <br/>
    		    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
    		</p>
    	</div>
    </div>
    </div>
</div>

<div id="screen_X" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-body">
    		<img src="${img}/screen_X.PNG" id="galleryImage" class="img-responsive" />
    		<p>
    		    <br/>
    		    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
    		</p>
    	</div>
    </div>
    </div>
</div>

<div id="i_Max" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-body">
    		<img src="${img}/i_Max.jpg" id="galleryImage" class="img-responsive" />
    		<p>
    		    <br/>
    		    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
    		</p>
    	</div>
    </div>
    </div>
</div>

<div id="sweetbox" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-body">
    		<img src="${img}/sweetbox.jpg" id="galleryImage" class="img-responsive" />
    		<p>
    		    <br/>
    		    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
    		</p>
    	</div>
    </div>
    </div>
</div>

<div id="tempur_Cinema" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-body">
    		<img src="${img}/tempur_Cinema.PNG" id="galleryImage" class="img-responsive" />
    		<p>
    		    <br/>
    		    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
    		</p>
    	</div>
    </div>
    </div>
</div>











<!-- 예매 -->
<section id="three">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="margin-top-0 text-primary">Flexible Layouts</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 text-center">
                <div class="feature">
                    <i class="icon-lg ion-android-laptop wow fadeIn" data-wow-delay=".3s"></i>
                    <h3>Responsive</h3>
                    <p class="text-muted">Your site looks good everywhere</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 text-center">
                <div class="feature">
                    <i class="icon-lg ion-social-sass wow fadeInUp" data-wow-delay=".2s"></i>
                    <h3>Customizable</h3>
                    <p class="text-muted">Easy to theme and customize with SASS</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 text-center">
                <div class="feature">
                    <i class="icon-lg ion-ios-star-outline wow fadeIn" data-wow-delay=".3s"></i>
                    <h3>Consistent</h3>
                    <p class="text-muted">A mature, well-tested, stable codebase</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 극장 -->
<section class="container-fluid" id="four">
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
            <h2 class="text-center text-primary">Features</h2>
            <hr>
            <div class="media wow fadeInRight">
                <h3>Simple</h3>
                <div class="media-body media-middle">
                    <p>What could be easier? Get started fast with this landing page starter theme.</p>
                </div>
                <div class="media-right">
                    <i class="icon-lg ion-ios-bolt-outline"></i>
                </div>
            </div>
            <hr>
            <div class="media wow fadeIn">
                <h3>Free</h3>
                <div class="media-left">
                    <a href="#alertModal" data-toggle="modal" data-target="#alertModal"><i class="icon-lg ion-ios-cloud-download-outline"></i></a>
                </div>
                <div class="media-body media-middle">
                    <p>Yes, please. Grab it for yourself, and make something awesome with this.</p>
                </div>
            </div>
            <hr>
            <div class="media wow fadeInRight">
                <h3>Unique</h3>
                <div class="media-body media-middle">
                    <p>Because you don't want your Bootstrap site, to look like a Bootstrap site.</p>
                </div>
                <div class="media-right">
                    <i class="icon-lg ion-ios-snowy"></i>
                </div>
            </div>
            <hr>
            <div class="media wow fadeIn">
                <h3>Popular</h3>
                <div class="media-left">
                    <i class="icon-lg ion-ios-heart-outline"></i>
                </div>
                <div class="media-body media-middle">
                    <p>There's good reason why Bootstrap is the most used frontend framework in the world.</p>
                </div>
            </div>
            <hr>
            <div class="media wow fadeInRight">
                <h3>Tested</h3>
                <div class="media-body media-middle">
                    <p>Bootstrap is matured and well-tested. It's a stable codebase that provides consistency.</p>
                </div>
                <div class="media-right">
                    <i class="icon-lg ion-ios-flask-outline"></i>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 이벤트 -->
<section class="" id="five">
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</table>
</section>

<!-- 사용하지 않음 참고용 -->
<aside class="bg-dark">
    <div class="container text-center">
        <div class="call-to-action">
            <h2 class="text-primary">Get Started</h2>
            <a href="http://www.bootstrapzero.com/bootstrap-template/landing-zero" target="ext" class="btn btn-default btn-lg wow flipInX">Free Download</a>
        </div>
        <br>
        <hr/>
        <br>
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="row">
                    <h6 class="wide-space text-center">BOOTSTRAP IS BASED ON THESE STANDARDS</h6>
                    <div class="col-sm-3 col-xs-6 text-center">
                        <i class="icon-lg ion-social-html5-outline" title="html 5"></i>
                    </div>
                    <div class="col-sm-3 col-xs-6 text-center">
                        <i class="icon-lg ion-social-sass" title="sass"></i>
                    </div>
                    <div class="col-sm-3 col-xs-6 text-center">
                        <i class="icon-lg ion-social-javascript-outline" title="javascript"></i>
                    </div>
                    <div class="col-sm-3 col-xs-6 text-center">
                        <i class="icon-lg ion-social-css3-outline" title="css 3"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</aside>


<!-- Contact Us -->
<section id="last">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="margin-top-0 wow fadeIn">Get in Touch</h2>
                <hr class="primary">
                <p>We love feedback. Fill out the form below and we'll get back to you as soon as possible.</p>
            </div>
            <div class="col-lg-10 col-lg-offset-1 text-center">
                <form class="contact-form row">
                    <div class="col-md-4">
                        <label></label>
                        <input type="text" class="form-control" placeholder="Name">
                    </div>
                    <div class="col-md-4">
                        <label></label>
                        <input type="text" class="form-control" placeholder="Email">
                    </div>
                    <div class="col-md-4">
                        <label></label>
                        <input type="text" class="form-control" placeholder="Phone">
                    </div>
                    <div class="col-md-12">
                        <label></label>
                        <textarea class="form-control" rows="9" placeholder="Your message here.."></textarea>
                    </div>
                    <div class="col-md-4 col-md-offset-4">
                        <label></label>
                        <button type="button" data-toggle="modal" data-target="#alertModal" class="btn btn-primary btn-block btn-lg">Send <i class="ion-android-arrow-forward"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>





<!-- 로그인 버튼을 클릭하였을 경우 -->
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-body">
    		<h2 class="text-center">로그인</h2>
    		<hr />
    		<h5 class="text-center">
    		    저희 MTB BOX를 방문해주셔서 감사합니다.
    		</h5>
    		<br />
    		<label for="id" style="padding-left:10%">아이디</label>
    		<input type="text" name="id" id="id" placeholder="아이디" style="color: black;"/> &nbsp;&nbsp;
    		<label for="password">비밀번호</label>
    		<input type="password" name="password" id="password" placeholder="비밀번호" style="color: black;"/>
    		<br/>
    		<button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" id="login" > login </button>
    	</div>
    </div>
    </div>
</div>


<!-- 회원가입 버튼을 클릭하였을 경우 -->
<div id="joinModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content" style="height: 570px;">
    	<div class="modal-body">
    		<h2 class="text-center">회원가입</h2>
    		<hr />
    		<h5 class="text-center">
    		   저희 사이트에서 제공하는 서비스를 사용하시려면, 회원가입을 먼저 진행해주세요.
    		</h5>
    		<br />
    		<div class="col-lg-10 col-lg-offset-1 text-center">
                <form class="contact-form row">
                
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="ID" id="join_Id">
                    	<div style="height:12px;"></div>
                    </div>
                    
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="email" class="form-control" placeholder="Email" id="email">
                    	<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="password" class="form-control" placeholder="password" id="join_Password">
                   		<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="Name" id="name">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="Phone(  -없이 입력해주세요)" id="phone">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 180px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="인증번호" id="confirm_num"></input>
                        <div style="height:12px;"></div>
                    </div>
                    
                    <button type="button" id="btn_confirm"
                    style="margin-top:6px; font-size: 12px; width: 100px; border-radius: 10px; float: left;" 
                    class="btn btn-primary btn-block">인증번호 발송</button>
                    
                    <div class="col-md-4 col-md-offset-4" style="padding-top: 25px;">
                        <label></label>
                        <button type="button" data-toggle="modal" data-dismiss="modal" class="btn btn-primary btn-block btn-lg" id="join">회원가입 <i class="ion-android-arrow-forward"></i></button>
                    </div>
                    
                </form>
            </div>
    	</div>
    </div>
    </div>
</div>




<div id="alertModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-body">
    		<h2 class="text-center">Nice Job!</h2>
    		<p class="text-center">You clicked the button, but it doesn't actually go anywhere because this is only a demo.</p>
    		<p class="text-center"><a href="http://www.bootstrapzero.com">Learn more at BootstrapZero</a></p>
    		<br/>
    		<button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">OK <i class="ion-android-close"></i></button>
    	</div>
    </div>
    </div>
</div>





<script type="text/javascript">
/* 로그인 */

$("#login").click(function(){
	Members.login();
});

$("#btn_confirm").click(function(){
	Members.join_Auth();
	$("#btn_confirm").remove();
});

$("#join").click(function(){
	Members.join();
});



var Members = {
		login : function() {
			$.ajax(context + "/member/login",{
				data : {"id" : $("#id").val(),
						"password" :$("#password").val()
				},
				type : "post",
				success : function(data) {
					//로그인 결과가 성공이면
					if(data.id != null){
						alert(data.id+"님 로그인을 환영합니다");
					} else{
					//로그인 결과가 실패면 (데이터가 널이면,)
						alert("아이디 혹은 패스워드를 다시한번 확인해주세요");
					}
				},
				error : function() {
				}
			});
		},
		
		join_Auth : function() {
			$.ajax(context + "/member/join_auth",{
				data : {"id" : $("#id").val(),
						"e_mail" :$("#email").val(),
						"name" :$("#name").val()
				},
				type : "post",
				success : function(data) {
					//이메일이 발송.
					if(data.success == "success"){
						alert("인증번호가 이메일로 발송되었습니다.");
					} else{
					//이미 가입되어 있는 아이디일 경우(컨트롤러에서 체크)
						alert("이미 가입되어 있는 아이디 입니다.");
					}
				},
				error : function() {
				}
			});
		},
		
		join : function() {
			var join_Mem = {
				"id" :$("#join_Id").val(),
				"email" :$("#email").val(),
				"password" :$("#join_Password").val(),
				"name" :$("#name").val(),
				"phone" :$("#phone").val(),
				"confirm_num" :$("#confirm_num").val()
			};
			$.ajax(context + "/member/join",{
				data : JSON.stringify(join_Mem),
				dataType : "json",
				type : 'post',
				contentType : "application/json;",
				mimeType: "application/json;",
				async : false,
				success : function(data) {
					if(data.result == "success"){
						alert(data.name+"님 회원가입이 완료되었습니다.");
						
					}
					if(data.result == "fail"){
						alert("회원가입을 실패하였습니다. 다시 시도해주세요.");
					}
					if(data.result == "not_Agreement"){
						alert("인증번호가 일치하지 않습니다. 인증을 다시 해주세요.");
					}
				},
				error : function(xhr, status, msg) {
				}
			});
		},
		
		
		
};


</script>
