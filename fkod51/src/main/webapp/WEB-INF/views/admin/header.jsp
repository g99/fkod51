<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>MTB</span> 관리자 페이지</a>
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
			<li class="active"><a href="#"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-home"></use></svg> 메인페이지</a></li>
			
			<li role="presentation" class="divider"></li>
			
			<li><a href="#회원관리" ><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>회원관리</a></li>
			<li><a href="${context}/admin/member"><svg class="glyph stroked calendar"><use xlink:href="#stroked-calendar"></use></svg>회원목록</a></li>
			
			<li role="presentation" class="divider"></li>
			
			<li><a href="#영화관리"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg>영화관리</a></li>
			<li><a href="${context}/admin/movie"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>영화등록</a></li>
			
			<li role="presentation" class="divider"></li>
			
			<li><a href="${context}/admin/chart"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>차트</a></li>
			<li><a href="${context}/admin/board"><svg class="glyph stroked app-window"><use xlink:href="#stroked-app-window"></use></svg> Alerts &amp; Panels</a></li>

		</ul>

	</div>