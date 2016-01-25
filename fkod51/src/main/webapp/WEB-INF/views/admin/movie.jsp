<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FKOD - movie</title>

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
				<a class="navbar-brand" href="${context}/admin/main"><span>MTB</span> 관리자 </a>
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
				<h1 class="page-header">영화관리</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="position:relative;">
					<div class="panel-heading">영화 목록</div>
					<div class="panel-body">
					<div id="my_menu" style="position:absolute; top:11%;">
						<button id="add" style="background:#E9ECF2; border:none;">등록</button>&nbsp;
						<button id="delete" style="background:#E9ECF2; border:none;">삭제</button>&nbsp;
					</div>

					<div id="my_menu" style="position:absolute; top:15%;">

					</div>

					</div>
						<table id="movie_table" data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
							    <tr>
							        <th data-field="check" data-checkbox="true"></th>
							        <th data-field="filmNumber" data-sortable="true">영화번호</th>
							        <th data-field="filmName" data-sortable="true">영화이름</th>
							        <th data-field="director" data-sortable="true">감독</th>
							        <th data-field="actor" data-sortable="true">배우</th>
							        <th data-field="rate" data-sortable="true">등급</th>
							        <th data-field="runtime" data-sortable="true">상영시간</th>
							        <th data-field="price" data-sortable="true">가격</th>
							        <th data-field="genre" data-sortable="true">장르</th>
							        <th data-field="country" data-sortable="true">국가</th>
							        <th data-field="releaseDate" data-sortable="true">개봉일</th>
							        <th data-field="endDate" data-sortable="true">종료일</th>
							        <th data-field="story" data-sortable="true">스토리</th>
							        <th data-field="cut" data-sortable="true">스틸컷</th>
							        <th data-field="trailer" data-sortable="true">트레일러</th>
							        <th data-field="tRate" data-sortable="true">..</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach items="${list}" var="movie">
						    		<tr>
						    			<td></td>
						    			<td class="movie_filmNumber">${movie.filmNumber}</td>
						    			<td class="movie_filmName">${movie.filmName}</td>
						    			<td class="movie_director">${movie.director}</td>
						    			<td class="movie_actor">${movie.actor}</td>
						    			<td class="movie_rate">${movie.rate}</td>
						    			<td class="movie_runtime">${movie.runtime}</td>
						    			<td class="movie_price">${movie.price}</td>
						    			<td class="movie_genre">${movie.genre}</td>
						    			<td class="movie_country">${movie.country}</td>
						    			<td class="movie_releaseDate">${movie.releaseDate}</td>
						    			<td class="movie_endDate">${movie.endDate}</td>
						    			<td class="movie_story">${movie.story}</td>
						    			<td class="movie_cut">${movie.cut}</td>
						    			<td class="movie_trailer">${movie.trailer}</td>
						    			<td class="movie_tRate">${movie.tRate}</td>
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
			
			/* 등록버튼 클릭시 */
			$("#add").click(function() {
				location.href = context + "/admin/add_movie";
			});
		
			
			// 삭제버튼 클릭시 
			$("#delete").click(function() {
				var length = $(".selected").length;
				/* 선택된 체크박스가 있는 경우에만 실행 */
				if (length!=0) {
					for (var i = 0; i < length; i++) {
						$.ajax(context + "/admin/delete_movie",{
							data : {
								"filmNumber" : $(".selected:first .movie_filmNumber").text()
							},
							async : false,
							success : function() {
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
