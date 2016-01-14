<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 트레일러&이벤트 -->
<section class="bg-primary" id="one" style="">
	<div style="width: 95%; height: 95%; margin: auto;">
		<div>
			<iframe style="width: 70%; height: 90%; float: left; border: none;"
				src="https://www.youtube.com/embed/UZy8aopPmwE"> </iframe>
		</div>
		<div style="width: 10%; height: 90%; float: left; margin-left: 15px;">
			<img src="${img}/naebuja_Main.jpg" alt="sample_img"
				style="width: 300%; height: 100%; float: left; display: inline;" />
		</div>
	</div>
</section>

<!-- 영화 -->
<section id="two" class="no-padding" style="height: 100%;">
	<div id="movielay" class="container-fluid" style="height: 95%; padding-left: 4%;">
		<div class="row no-gutter">
		</div>
	</div>
	<div style="width: 480px; margin: auto;" id="sWindow">
	
	</div>
</section>

<!-- 예매 -->
<section id="three" style="height:100%;">
    
</section>

<!-- 극장 -->
    <section id="four" class="no-padding" style="height:100%; padding-top:5%;">
        <div class="container-fluid" style="height: 95%;">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <a href="#starium" class="gallery-box" data-toggle="modal" data-src="${img}/starium_main.jpg">
                        <img src="${img}/starium_main.jpg" class="img-responsive" alt="Image 1" style ="width: 100%; height: 49%;">
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
                        <img src="${img}/sound_X_Main.PNG" class="img-responsive" alt="Image 2" style ="width: 100%; height: 49%;">
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
                        <img src="${img}/screen_X_Main.PNG" class="img-responsive" alt="Image 3" style ="width: 100%; height: 49%;">
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
                        <img src="${img}/i_Max_Main.jpg" class="img-responsive" alt="Image 4" style ="width: 100%; height: 49%;">
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
                        <img src="${img}/sweetbox_Main.PNG" class="img-responsive" alt="Image 5" style ="width: 100%; height: 49%;">
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
                        <img src="${img}/tempur_Cinema_Main.PNG" class="img-responsive" alt="Image 6" style ="width: 100%; height: 49%;">
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

<!-- 이벤트 -->
<section class="bg-dark" id="five" style="height:100%; padding-top:5%;">
</section>

<!-- 구글맵 -->
<section id="six" style="height:100%;">
	<div class="container text-center">
	  <div class="call-to-action">
            <h2 class="text-primary">오시는길</h2>
        </div>
    </div>
    <div class="container">
        <div class="row">
        	<div id="map-canvas" style="width: 100%; height: 100%;"></div>
        </div>
    </div>
</section>

<!-- 팀원소개 -->
<aside  id="last" style="height:100%;">
    <div class="container text-center">
        <div class="call-to-action">
            <h2 class="text-primary">FKOD 팀 소개</h2>
        </div>
        <hr/>
        <br>
        <div class="row" style="margin-bottom:3%;">
	        <div id="junekyu" style="float:left; width:30%; margin-left:3%;">
	            <label></label>
	            <input type="text" class="form-control" value="팀장 : 박준규" style="width:60%; background:#36333D;" readOnly>
	            <label></label>
	            <textarea class="form-control" rows="9" style="width:80%; height:35%; background:#36333D;" readOnly>같이하는 코딩이 너무 재미있고,
	             
아직 개발중인만큼 디테일한 부분들을 

계속해서 개선해 나가겠습니다.
	            </textarea>
	        </div>
	        <div id="chanho" style="float:left; width:30%; margin-left:4%;">
	         	<label></label>
	        	<input type="text" class="form-control" value="영화 : 김찬호" style="width:60%; background:#36333D;" readOnly>
	            <label></label>
	            <textarea class="form-control" rows="9" placeholder="내용" style="width:80%; height:35%; background:#36333D;" readOnly>같이 개발한 팀원들 모두

고생많았고 앞으로 힘내자.	            
	            </textarea>
	        </div>
	        <div id="inseok" style="float:left; width:30%; margin-left:3%;">
	         	<label></label>
	        	<input type="text" class="form-control" value="예매 : 강인석" style="width:60%; background:#36333D;" readOnly>
	            <label></label>
	            <textarea class="form-control" rows="9" placeholder="내용" style="width:80%; height:35%; background:#36333D;" readOnly>좋은 강사님, 좋은 팀원들을 만나서
	             
그간의 배움이 잘 녹아든 결과물을 

만들어 낼 수 있었던 것 같다.

팀장 준규와, 찬호 형, 순환이 형, 성한이 

모두 책임감 있게 잘 해줘서 고맙습니다~
	            </textarea>
	        </div>
        </div>
	 	<div class="row">
	        <div id="sunghan" style="clear:both; float:left; width:30%; margin-left:3%;">
	         	<label></label>
	        	<input type="text" class="form-control" value="로그인/회원관리 : 이성한" style="width:60%; background:#36333D;" readOnly>
	            <label></label>
	            <textarea class="form-control" rows="9" placeholder="내용" style="width:80%; height:35%; background:#36333D;" readOnly>프로젝트 초기 단계에는 여러기능을
	             
코딩하며 발생한 문제도 많았지만,

구글링도 해가며 하나씩 해결하고 

이렇게 팀원들과 함께 프로젝트를 

완성할 수 있어서 정말 기쁘네요. 
				</textarea>
	        </div>
	        <div id="soonhwan" style="float:left; width:30%; margin-left:4%;">
	         	<label></label>
	        	<input type="text" class="form-control" value="관리자 : 김순환" style="width:60%; background:#36333D;" readOnly>
	            <label></label>
	            <textarea class="form-control" rows="9" placeholder="내용" style="width:80%; height:35%; background:#36333D;" readOnly>프로젝트 기간동안 어려운점도 있었지만
	            
팀원들과 협심하여 부족한 개념들을

많이 습득하였습니다.

모든 팀원들한테 감사합니다.	            
	            
	            </textarea>
	        </div>
        </div>
    </div>
</aside>

<!--////////////////////////////////////////////////////////////////////////  -->
<!--////////////////////////////////////////////////////////////////////////  -->
<!--////////////////////////////////////////////////////////////////////////  -->

<!-- 영화 팝업 페이지 -->
<div id="movieGalleryModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content" id="movieModal-content">
    	<div class="modal-body" id="movieModal-body">
    	</div>    	
    </div>
    </div>
</div>


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
                        <input type="text" class="form-control" placeholder="ID" id="join_Id" onkeyup="Members.checking_Id()">
                        <label style="float: left; color: red;" id="check_Msg">아이디를 입력해주세요 ♬</label>
                    	<div style="height:20px;"></div>
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



<!-- 마이페이지 -->
<div id="mypage_Modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="">
    <div class="modal-dialog">
    <div class="modal-content" style="height:540px; width:400px; margin-left:100px;">
    	<div class="modal-body">
    		<h2 class="text-center">My Page</h2>
    		<hr />
    		<h5 class="text-center">
    		  마이페이지(My Page)
    		</h5>
    		<br />
    		<div class="col-lg-10 col-lg-offset-1 text-center">
                <form class="contact-form row">
                
                	<div class="col-md-4" style="width: 300px;">
                        <input type="text" class="form-control" value="${user.id}" id="mypage_Id" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="email" class="form-control" value="${user.email}" id="mypage_email" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="password" class="form-control" value="${user.password}" id="mypage_Password" readonly="readonly" style="color: black;">
                   		<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" value="${user.name}" id="mypage_name" readonly="readonly" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" value="${user.phone}" id="mypage_Phone" readonly="readonly" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <button type="button" id="btn_Logout"
                    style="margin-top:6px; margin-left: 45px; 
                    width: 100px; border-radius: 10px; float: left;" 
                    class="btn btn-primary btn-block" data-dismiss="modal">로그아웃</button>
                    
                 	  	 <a class="btn btn-primary btn-block" data-toggle="modal"
                 	  	 data-dismiss="modal"
                 	  	 style="margin-top:6px; width: 100px; margin-left: 10px;
                   		 border-radius: 10px; float: left;"
                 	  	 title="Mypage Update" 
                 	  	 href="#update_Modal">
                 	  	 내정보수정</a>
                    
                </form>
            </div>
    	</div>
    </div>
    </div>
</div>



<!-- 업데이트 페이지 - 정보수정 버튼 클릭했을 때 -->
<div id="update_Modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="">
    <div class="modal-dialog">
    <div class="modal-content" style="height:540px; width:400px; margin-left:100px;">
    	<div class="modal-body">
    		<h2 class="text-center">My Page - 정보수정</h2>
    		<hr />
    		<h5 class="text-center">
    		  내 정보수정 페이지(Update Page)
    		</h5>
    		<br />
    		<div class="col-lg-10 col-lg-offset-1 text-center">
                <form class="contact-form row">
                
                	<div class="col-md-4" style="width: 300px;">
                        <input type="text" class="form-control" value="${user.id}" id="update_Id" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="email" class="form-control" value="${user.email}" id="update_Email" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="password" class="form-control" value="${user.password}" id="update_Password" style="color: black;">
                   		<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" value="${user.name}" id="update_Name"  readonly="readonly" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="${user.phone}" id="update_Phone" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <button type="button" id="btn_Update"
                    style="margin-top:6px; margin-left: 45px; 
                    width: 100px; border-radius: 10px; float: left;" 
                    class="btn btn-primary btn-block" data-dismiss="modal">정보수정</button>
                    
                    <button type="button" id="btn_Delete"
                    style="margin-top:6px; width: 100px; margin-left: 10px; border-radius: 10px; float: left;" 
                    class="btn btn-primary btn-block" data-dismiss="modal">회원탈퇴</button>
                    
                    
                </form>
            </div>
    	</div>
    </div>
    </div>
</div>







<!-- alert 경고창은 이걸로 대체할 것 -->
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

<!-- 글쓰기 눌렀을때 -->
<div id="writeModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="margin-right:37%">
   	<div class="modal-content" style="width:800px;">
   		<div class="modal-body" style="height:600px;">
   			<div style="margin-left:8%;">
   				<label for="title" style="display:block;">제목</label>
    			<input name="title" type="text" size="80" maxlength="100" style="width:90%; color:black;"/>
    		</div>
    		<br />
    		<div style="margin-left:8%">
   				<label for="content" style="display:block;">내용</label>
   				<textarea name="content" cols="82" rows="20" style="width:90%; color:black;"></textarea>
   			</div>
   			<br />
   			<div>
   				<button id="write_close_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="float:left; margin-left:37%; margin-right:20px;">취소 <i class="ion-android-close"></i></button>
    			<button id="write_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="margin:0;">확인 O</button>
    		</div>
    	</div>
   	</div>
   	</div>
</div>

<!-- 글 제목을 눌러 읽을때 -->
<div id="readModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="margin-right:37%">
   	<div class="modal-content" style="width:800px;">
   		<div class="modal-body" style="min-height:800px;">
   			<div style="margin-left:8%;">
   				<!-- 보이지는 않지만 데이터처리의 편의를 위해서 글번호를 적어놈 -->
   				<span id="code" style="visibility:hidden"></span>
   				<label for="title" style="display:block;">제목</label>
    			<input name="title" type="text" disabled size="80" maxlength="100" style="width:90%; color:black;"/>
    		</div>
    		<br />
    		<div style="margin-left:8%">
   				<label for="content" style="display:block;">내용</label>
   				<textarea name="content" disabled cols="82" rows="20" style="width:90%; height:40%; color:black;"></textarea>
   			</div>
   			<br />
    		<div style="margin-left:8%">
   				<label for="reply" style="display:block;">댓글쓰기</label>
   				<textarea name="reply" cols="82" rows="20" style="width:90%; height:10%; color:black;"></textarea>
   			</div>
   			<br />
   			<div>
   				<button id="reply_btn" class="btn btn-primary btn-lg center-block" style="margin-left:35%; margin-right:20px; float:left;">댓글달기</button>
    			<button id="read_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="margin-left:0;">종료</button>
    		</div>
    		<div id="reply_area" style="padding-top:10px;">
    		</div>
    	</div>
   	</div>
   	</div>
</div>

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
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
	      function initialize() {
        var mapLocation = new google.maps.LatLng('37.499200', '127.029239'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng('37.499492', '127.029239'); // 마커가 위치할 위도와 경도
        var mapOptions = {
        		height: "500px",
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 18, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: image, // 마커로 사용할 이미지(변수)
//             info: '말풍선 안에 들어갈 내용',
               title: 'MTB BOX' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
         
        var content = "MTB BOX"; // 말풍선 안에 들어갈 내용
         
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
        infowindow.open(map,marker);
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
         
 
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
      </script>
<script type="text/javascript">

$(function() {
	Movie.ranking();

	
	//----------------------//
	// 글쓰기 내부에 있는 버튼들 //
	//----------------------//
	// 확인//
	$("#write_btn").click(function() {
		if($("#writeModal input:text[name=title]").val() === ""){
			$("#write_btn").attr("data-dismiss","");
			alert("제목을 필수로 입력해주세요.");
		} else {
			$("#write_btn").attr("data-dismiss","modal");
			newEvent.write();
		}
	});
	// 취소 //
	$("#write_close_btn").click(function() {
		$("input:text[name=title]").val("");
		$("textarea[name=content]").val("");
	});
	
	//----------------------//
	//     댓글관련 버튼        //
	//----------------------//
	// 댓글달기 //
	var index = 1;
	$("#reply_btn").click(function() {
		if($(".navbar-right a").text() === "로그인"){
			alert("댓글을 달려면 로그인을 해주세요");
		}else{
			$.ajax(context + "/article/reply ",{
				data : {
					"code" : $("#code").text(),
					"id" : $(".navbar-right a").text(),
					"content" : $("#readModal textarea[name=reply]").val()
				},
				success : function() {
					$("#reply_area").append("<p style='border:solid; position:relative;'>" + $(".navbar-right a").text() + " | " +$("textarea[name=reply]").val() + "<button id='remove_reply"+ (index++) +"' style='position:absolute; right:0; top:0; border:none; color:black; background:white;'>지우기</button></p>");
					// 댓글지우기 //
					$("#remove_reply" + (index-1)).click(function() {
						$("#" + this.id).parent().remove();
					});	
				},
				error : function() {
					
				}
			});
		}
	});
	
	/* 읽은글 종료버튼 */
	$("#read_btn").click(function() {
		$("#reply_area").empty();
	});
	
	
	/* 아이디 실시간 체크 */
	
	
}); 



/* ======== 멤버 ========= */
/* 로그인 */
$("#login").click(function(){
	Members.login();
});

/* 이메일 인증 */
$("#btn_confirm").click(function(){
	var check_Confirm_Email = $("#email").val();
	if(check_Confirm_Email === ""){
		alert('이메일 입력란을 채워주세요.');
	}
	else{
		Members.join_Auth();
	}
});

/* 회원가입 */
$("#join").click(function(){
	var check_id = $("#join_Id").val();
	var check_email = $("#email").val();
	var check_password = $("#join_Password").val();
	var check_name = $("#name").val();
	var check_phone = $("#phone").val();
	var check_confirm_num = $("#confirm_num").val();
	if (check_id === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_email === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_password === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_name === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_phone === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_confirm_num === "") {
		alert('공란을 채워주세요.');
	} else {
		Members.join();	
	}
	
	
});



/* 로그아웃 */
$("#btn_Logout").click(function(){
	location.href = context + "/member/logout";
});


/* 정보수정 버튼 */
$("#btn_Update").click(function(){
	if(confirm('정보수정을 하시겠습니까?')) {
		Members.update();
	}
});

$("#btn_Delete").click(function(){
	if(confirm('정말 회원탈퇴를 하시겠습니까?')) {
		Members.delete_Member();
	}
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
						$("#bs-navbar").load(context + "/member/headerReload #bs-navbar");
						location.reload();
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
				data : {"id" : $("#join_Id").val(),
						"e_mail" :$("#email").val(),
						"name" :$("#name").val()
				},
				type : "post",
				success : function(data) {
					//이메일이 발송.
					//아이디, 이메일이 전부 없을경우
					if(data.success == "success"){
						alert("인증번호가 이메일로 발송되었습니다.");
					}
					// 아이디가 이미 존재할경우.
					else if (data.id_fail == "id_fail") {
						alert("이미 가입되어 있는 아이디 입니다. 아이디/비밀번호 찾기를 이용해주세요.");
					}
					// 이메일이 이미 존재할경우.
					else if (data.email_fail == "email_fail"){
						alert("이미 가입되어 있는 이메일 입니다. 아이디/비밀번호 찾기를 이용해주세요.");
					}
					
				},
				error : function() {
					alert('이메일을 입력하고 눌러주세요.');
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
		
		update : function() {
			// 앞의 id는 MemberVO의 빈객체 네임과 같아야함.
			var update_Mem = {
				"id" :$("#update_Id").val(),
				"password" :$("#update_Password").val(),
				"phone" :$("#update_Phone").val(),
			};
			$.ajax(context + "/member/update",{
				data : JSON.stringify(update_Mem),
				dataType : "json",
				type : 'post',
				contentType : "application/json;",
				mimeType: "application/json;",
				async : false,
				success : function(data) {
					if(data.result == "success"){
						alert("회원정보수정이 완료되었습니다.");
					}
					if(data.result == "fail"){
						alert("정보수정을 실패하였습니다. 다시 시도해주세요.");
					}
				},
				error : function(xhr, status, msg) {
					alert('에러발생, 다시시도해주세요. 다시 시도하셔도 에러가 발생하면 관리자에게 문의해주세요.');
				}
			});
		},
		
		delete_Member : function() {
			$.ajax(context + "/member/delete",{
				data : {"delete_Id" : $("#update_Id").val(),
				},
				type : "post",
				success : function(data) {
					if(data.result == "success"){
						location.reload();
						alert("회원탈퇴가 완료되었습니다.");
					}
					if(data.result == "fail"){
						alert("회원탈퇴를 실패하였습니다.");
					}
				},
				error : function(xhr, status, msg) {
					alert('에러발생, 다시시도해주세요. 다시 시도하셔도 에러가 발생하면 관리자에게 문의해주세요.');
				}
			});
		},
		
		checking_Id : function() {
			$.ajax(context + "/member/checking_Id",{
				data : {"id" : $("#join_Id").val(),
					},
				type : "post",
				success : function(data) {
					// 아이디가 이미 존재할경우.
					if (data.id_fail == "id_fail") {
						document.getElementById('check_Msg').style.color = "red";
						document.getElementById('check_Msg').innerHTML = "가입되어있는 아이디입니다.";
					}
					// 아이디 사용가능할 경우.
					if (data.id_Confirm == "id_Confirm") {
						document.getElementById('check_Msg').style.color = "green";
						document.getElementById('check_Msg').innerHTML = "가능한 아이디입니다.";
					}
				},
				error : function() {
					document.getElementById('check_Msg').style.color = "red";
					document.getElementById('check_Msg').innerHTML = "아이디를 입력하세요.";
				}
			});
		},
		
};
</script>
