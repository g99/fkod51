<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FKOD - member</title>

<link href="${admin_css}/bootstrap.min.css" rel="stylesheet">
<link href="${admin_css}/datepicker3.css" rel="stylesheet">
<link href="${admin_css}/bootstrap-table.css" rel="stylesheet">
<link href="${admin_css}/styles.css" rel="stylesheet">

<!--Icons-->
<script src="${admin_js}/lumino.glyphs.js"></script>


</head>

<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${context}/admin/main"><span>MTB</span>관리자</a>
				<a id="admin_logout" class="navbar-brand" href="#" style="float:right;">로그아웃</a>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li class="active"><a href="${context}/admin/main"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> 홈</a></li>
			<li><a href="${context}/admin/member"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> 회원관리</a></li>
			<li><a href="${context}/admin/movie"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> 영화관리</a></li>
			<li><a href="${context}/admin/board"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> 게시판관리</a></li>
			<li><a href="${context}/admin/chart"><svg class="glyph stroked app-window"><use xlink:href="#stroked-app-window"></use></svg> 차트</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
				
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">회원관리</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="position:relative;">
					<div class="panel-heading">회원 목록</div>
					<div class="panel-body">
					<div id="my_menu" style="position:absolute; top:11%;">
						<button id="modify" style="background:#E9ECF2; border:none;">수정</button>&nbsp;
						<button id="delete" style="background:#E9ECF2; border:none;">삭제</button>&nbsp;
					</div>
						<table id="member_table" data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
							    <tr>
							        <th data-field="check" data-checkbox="true" ></th>
							        <th data-field="name" data-sortable="true">이름</th>
							        <th data-field="id" data-sortable="true">ID</th>
							        <th data-field="password"  data-sortable="true">비밀번호</th>
							        <th data-field="email" data-sortable="true">이메일</th>
							        <th data-field="phone" data-sortable="true">핸드폰</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach items="${list}" var="member">
						    		<tr>
						    			<td></td>
						    			<td class="member_name">${member.name}</td>
						    			<td class="member_id">${member.id}</td>
						    			<td class="member_password">${member.password}</td>
						    			<td class="member_email">${member.email}</td>
						    			<td class="member_phone">${member.phone}</td>
						    		</tr>
						    	</c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
	</div><!--/.main-->

	<script src="${admin_js}/jquery-1.11.1.min.js"></script>
	<script src="${admin_js}/bootstrap.min.js"></script>
	<script src="${admin_js}/bootstrap-datepicker.js"></script>
	<script src="${admin_js}/bootstrap-table.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
		
		$(function() {
			/* 로그아웃 */
			$("#admin_logout").click(function() {
				$.ajax(context + "/admin/logout",{
					data : {
						
					},
					success : function() {
						location.href = context + "/";
					},
					error : function() {
						
					}
				});
			});
			
			// 수정버튼 클릭시
			$("#modify").click(function() {
				var length = $(".selected").length;
				/* 선택된겂이 없으면 수행하지 않는다. */
				if (length != 0) {
					/* 선택된 갯수만큼 반복수행 */
					for (var i = 0; i < length; i++) {
						var id = $(".selected:first .member_id").text();
						var name = $(".selected:first .member_name").text();
						var password = $(".selected:first .member_password").text();
						var email = $(".selected:first .member_email").text();
						var phone = $(".selected:first .member_phone").text();
						console.log(id + name + password + email + phone);
						$(".selected:first .member_password").html('<input type="text" value="'+ password +'">');
						$(".selected:first .member_phone").html('<input type="text" value="'+ phone +'">');
						$(".selected:first").removeClass("selected");
					}
					
					$("#member_table input:checkbox:checked").parent().parent().addClass("selected");
					
					if ($("#confirm").text() != "확인") {
						$("#my_menu").append("<button id='confirm' style='background:#E9ECF2; border:none;'>확인</button>");
					} 
					
					$("#confirm").click(function() {
						/* 선택된 것들만큼 반복할 예정 */
						var length = $(".selected").length;
						for (var i = 0; i < length; i++) {
							$.ajax(context + "/admin/insert",{
	                            data : {
	                                 "name" : $(".selected:first .member_name input").text(),
	                                 "id" : $(".selected:first .member_id").text(),
	                                 "password" : $(".selected:first .member_password input").val(),
	                                 "email" : $(".selected:first .member_email input").val(),
	                                 "phone" : $(".selected:first .member_phone input").val()
	                            },
	                            success : function(data) {
	                            	$(".selected:first").removeClass("selected");
	                            },
	                            async : false,
	                            error : function() {
	                                
	                            }
	                       });
						}
						location.reload();
					});
				}
			});
			
			// 삭제버튼 클릭시 
			$("#delete").click(function() {
				var length = $(".selected").length;
				/* 선택된 체크박스가 있는 경우에만 실행 */
				if (length!=0) {
					for (var i = 0; i < length; i++) {
						$.ajax(context + "/admin/delete",{
							data : {
								"id" : $(".selected:first .member_id").text()
							},
							async : false,
							success : function(data) {
								$(".selected:first").removeClass("selected");
							},
							error : function() {
								
							}
						});
					}
				}
				location.reload();
			});
		});
	</script>	
</body>

</html>
