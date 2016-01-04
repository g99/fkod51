var Member = {
		join : function(project) {
			$("#box").load(project + "/member/Member.do");
		},
		login : function(project) {
			var member = {
					"id":$("#id").val(),
					"password":$("#password").val()
			};
			$.ajax(project + "/member/login",{
				data : JSON.stringify(member),
				dataType : "json",
				type : "post",
				contentType : "application/json",
				mimeType : "application/json",
				async : false,
				success : function(data) {
					//로그인 결과가 성공이면
					if(data != null){
						alert("로그인 성공!!!!!!!");
						/*$("#frm_toggle").load(project + "/global/Main.do?page=header #frm_logined");*/
						location.href = project+"/member/mypage";
						// 관리자 아이디로 확인되면
						if(member.id === "choa") {
							$("#outbox").append(
								'<table id="admin_nav"><tr><td><button id="admin_home">홈</button></td></tr>'+
								'<tr><td><button id="admin_member">회원관리</button></td></tr>'+
								'<tr><td><button id="admin_movie">영화관리</button></td></tr>'+
								'<tr><td><button id="admin_statistics">통계보기</button></td></tr>'+
								'<tr><td><button id="admin_board">게시판관리</button></td></tr></table>');
							$("#admin_nav").css({
											"text-align": "center",
											"height": "450px",
											"background": "rgba(105, 4, 4, 0.41)",
											"position": "absolute",
											"right": "20px",
											"top": "40px"
							});
							$("#admin_nav a").css({
												"border":"none",
												"color":"white",
												"font-weight":"900"
												});
						}
					} else{
					//로그인 결과가 실패면
						alert("아이디 패스워드를 다시한번 확인해주세요");
					}
				},
				error : function() {
					
				}
			});
		},
		logout : function(project) {
					location.href = project+"/member/logout"; 
		},
		
		/* 회원가입 html */
		memberJoin : function(project) {
			$('#big_wrap').html('<link rel="stylesheet" href="../css/member.css" />'
			+'<html id="main_Html"><div id="mainDiv" class="wrap"><div id="subDiv"><h3 class="inline">&nbsp;&nbsp;본인 인증</h3>'
			+'<h5 class="inline">&nbsp;&nbsp;&nbsp;안전한 서비스 이용을 위해 본인확인을 진행하고 있습니다.</h5>'
			+'<br><br><br><h4>&nbsp;&nbsp;&nbsp;본인인증시 제공되는 정보는 해당 사이트에서 직접 수령하며,인증 이외의 용도로 이용 또는 저장하지 않습니다.</h4><br><br>'
			+'<div id="imgDiv"><img src="../images/lock.png" alt="" /><br><br><img id="join" src="../images/join.PNG" alt="" /></div>'
			+'<br><br><br><br><br><br><br><br><p id ="p_f">&nbsp;&nbsp;&nbsp;입력하신 소중한 개인정보는 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않으며,자사의 보안시스템을 통해 외부위협으로부터 보호하고 있습니다.</p></div></html>'
			);
			
			$("#join").click(function(){
				history.pushState("Member_provision","","");
				Member.webEmpty();
				Member.provision(project);
			});
			
		},
		
		
		/* 약관 html 로드 */
		provision : function(project) {
			$('#big_wrap').load(project + '/member/Member.do?page=provision' )
		},
		
		
		
		/* 박스 비우기 */
		webEmpty : function() {
			$('').appendTo($('#big_wrap').empty());
		},
		
		
		
		/* 마이페이지 상세화면 => 마이페이지.jsp에서 구현*/
		
	};
