<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	* {padding:0; margin:0;}
	.tabs li {
		list-style:none;
		display:inline;
	}
	.tabs a {
		padding:5px 10px;
		display:inline-block;
		background:#666;
		color:#fff;
		text-decoration:none;
	}
	.tabs a.active {
		background:#fff;
		color:#000;
	}
</style>

<link rel="stylesheet" href="${css}/common.css" type="text/css" />
	<div class="ticket_wrap">
		<div class="ticket_flex-container">
			<div class="ticket_flex-item ticket_item1">
				<h4>영화</h4>
				<div id="ticket_container">
				<nav id="ticket_menu">
					<ul class='tabs'>
					    <li><a href='#tab1'>예매율</a></li>
					    <li><a href='#tab2'>가나다</a></li>
					</ul>
					<form action="" id="movie_list">
					  <div id='tab1' class="ticket_sub">
					  
					  </div>
					  <div id='tab2' class="ticket_sub">
					  
					  </div>
					 </form>
				</nav>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item2">
				<h4>극장</h4>
				<div class="ticket_bookmark">
					<label class="ticket_subtitle">자주 가는 극장</label>
					<div class="ticket_list-category">
						<dl>
							<dt>
								<a href="#">강남점</a>
							</dt>
							<dt>
								<a href="#">압구정점</a>
							</dt>
							<dt>
								<a href="#">강변점</a>
							</dt>
						</dl>
					</div>
				</div>
				<div class="ticket_normal">
					<label class="ticket_subtitle">일반</label>
					<div id="theater_list">
					
					</div>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item3">
				<h4>날짜</h4>
				<div class="ticket_normal">
					<div id="date_list">
					
					</div>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item4">
				<h4>시간</h4>
				<div class="ticket_times" id="times_list">
				</div>
				<label id="ticket_choiceseat" class="ticket_choiceseatlabel">좌석선택</label>
			</div>
		</div>
	</div>
<script src="${js}/tab.js"></script>
<script type="text/javascript">
$(function() {
	tabs.make();
	Ticket.initList("${context}");
	$('.ticket_sub').click(function() {
		alert("티켓서브실행전"+Ticket.movie);
		Ticket.ticket_sub("${context}");
		alert("티켓서브실행후");
	});
	$('#theater_list').click(function() {Ticket.theater_list("${context}");});
	$('#date_list').click(function() {Ticket.date_list("${context}");});
	$('#ticket_choiceseat').click(function() {Ticket.ticket_choiceseat("${context}");});
	
});
</script>