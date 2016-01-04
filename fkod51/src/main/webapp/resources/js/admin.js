	var Admin = {
			 	home : function(project) {
					$("#box").load(project + "/member/Member.do?page=admin_home");
				},
				member : function(project) {
					 $.getJSON(project + '/admin/Admin.do?page=member_list', function(data) {
						 var arr = [];
						 var table = '<div id="member_list"><h1>회원목록</h1>'
								+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th>'
								+'<th>이름</th><th>생년</th><th>성별</th>'
								+'<th>전화번호</th><th>주소</th><th>이메일</th><th>등록일</th></th>';
								$.each(data, function() {
									arr.push(this.id);
									table +='<tr><td><button id="' + this.id + '" href=#>'+this.id+'</button></td><td>'+this.password+'</td>'
										+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
										+'<td>'+this.gender+'</td><td>'+this.phone+'</td>'
										+'<td>'+this.addr+'</td><td>'+this.email+'</td>'
										+'<td>'+this.regdate+'</td></tr>'
								});
								table += '</table></div>';
								$(table).appendTo($('#box').empty());
								// 아이디별로 버튼 달기
								$.each(data, function(index) {
									$("#"+this.id).click(function() {
										Bom.popup(project,arr[index]);
									});
								});
								
								// css 부분
								$("#member_list").css({
														"padding-top" : "50px",
														"padding-left" : "150px",
														"background":"white",
														"height":"1000px"
														});
								$("#member_list button").css({
									"border":"none",
									"background":"none"
									
								});
								$("#tab_member").css("width","90%");
								$("#tab_member").add("#tab_member tr").add("#tab_member th").add("#tab_member td").css({
									"border" : "1px solid black",
									"border-collapse" : "collapse",
									"text-align" : "center",
								});
					});
				},
				movie : function(project) {
					 $.getJSON(project + '/admin/Admin.do?page=movie_list', function(data) {
						 var arr = [];
						 var table = '<div id="movie_list"><h1>영화목록</h1>'
						 	 	   + '<table id="tab_movie"><tr><th>영화번호</th><th>영화이름</th>'
						 	       + '<th>감독</th><th>배우</th><th>등급</th><th>런타임</th><th>가격</th>'
						 	       + '<th>장르</th><th>개봉일</th><th>종료일</th><th>줄거리</th>'
						 	       + '<th>스틸컷</th><th>트레일러</th></tr>';
							 $.each(data, function() {
								arr.push(this.filmNumber);
								table +='<tr><td><button id="'+this.filmNumber+'">'+this.filmNumber+'</button</td><td>'+this.filmName+'</td>'
									+'<td>'+this.director+'</td><td>'+this.actor+'</td>'
									+'<td>'+this.rate+'</td><td>'+this.runtime+'</td>'
									+'<td>'+this.price+'</td><td>'+this.genre+'</td>'
									+'<td>'+this.releaseDate+'</td><td>'+this.endDate+'</td>'
									+'<td>'+this.story+'</td><td><div>'+this.cut+'</div></td>'
									+'<td><div>'+this.trailer+'</div></td></tr>'
								});
								table += '</table>';
								$(table).appendTo($('#box').empty());
								// 아이디별로 버튼 달기
								$.each(data, function(index) {
									$("#"+this.filmNumber).click(function() {
										Bom2.popup(project,arr[index]);
									});
								});
								$("#movie_list div").css({
														"width":"150px",
														"overflow":"auto"
														});
								$("#movie_list").css({
									"padding-top" : "20px",
									"padding-left" : "20px",
									"padding-right" : "20px",
									"background":"white",
									"height":"1000px",
									});
								$("#movie_list button").css({
									"background":"none",
									"border":"none"
								});
								$("#tab_movie").css("width","100%");
								$("#tab_movie tr").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
								$("#tab_movie th").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
								$("#tab_movie td").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
					});
				}
	 };
