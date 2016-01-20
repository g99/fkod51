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
				<h1 class="page-header">영화등록하기</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="position:relative;">
					<div class="panel-heading"></div>
					<div id="my_menu" style="position:absolute; top:4%; left:1%;">
						<button id="cancel" style="background:#E9ECF2; border:none;">취소</button>&nbsp;
						<button id="confirm" style="background:#E9ECF2; border:none;">확인</button>&nbsp;
					</div>
					<div class="panel-body">
						<form id="stillcut">
							<label for="subject" style="display:block;">영화명</label>
							<input type="text" name="subject" style="width:60%" placeholder="영화명"/>
							<br />
							<label for="number" style="display:block;">영화번호</label>
							<input type="text" name="number" style="width:60%" placeholder="A000"/>
							<br />
							<label for="director" style="display:block;">감독</label>
							<input type="text" name="director" style="width:60%" placeholder="감독"/>
							<br />
							<label for="actor" style="display:block;">배우</label>
							<input type="text" name="actor" style="width:60%" placeholder="배우"/>
							<br />
							<label for="country" style="display:block;">국가</label>
							<input type="text" name="country" style="width:60%" placeholder="국가"/>
							<br />
							<label for="rate" style="display:block;">등급</label>
							<input type="text" name="rate" style="width:60%" placeholder="등급"/>
							<br />
							<label for="genre" style="display:block;">장르</label>
							<input type="text" name="genre" style="width:60%" placeholder="장르"/>
							<br />
							<label for="runtime" style="display:block;">상영시간</label>
							<input type="number" name="runtime" style="width:60%" placeholder="000"/>
							<br />
							<label for="price" style="display:block;">가격</label>
							<input type="number" name="price" style="width:60%" placeholder="000"/>
							<br />
							<label for="release" style="display:block;">개봉일</label>
							<input type="date" name="release" style="width:60%" placeholder="2016.01.18"/>
							<br />
							<label for="end" style="display:block;">종료일</label>
							<input type="date" name="end" style="width:60%" placeholder="2016.01.18"/>
							<br />
							<label for="story" style="display:block;">스토리</label>
							<input type="text" name="story" style="width:60%" placeholder="내용"/>
							<br />
							<label for="trailer" style="display:block;">트레일러</label>
							<input type="text" name="trailer" style="width:60%" placeholder="first/second/third"/>
							<br />
						
							<label for="poster" style="display:block;">스틸컷</label>
							<input type="file" name="poster" style="width:60%" multiple/>
						</form>
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
			
			/* 취소 버튼 */
			$("#cancel").click(function() {
				location.href = context + "/admin/movie";
			});
			
			/* 확인 버튼 */
			$("#confirm").click(function() {
				var postData = new FormData($("#stillcut")[0]);
				/* 공란이 없으면 수행 */
						$.ajax(context + "/admin/add",{
							data : postData,
							type : "post",
							mimeType : 'multipart/form-data',
							contentType : false,
							processData : false,
							success : function() {
								location.href= context + "/admin/movie";
							},
							error : function() {
								
							}
						});
			});
		});
	</script>	
</body>

</html>
