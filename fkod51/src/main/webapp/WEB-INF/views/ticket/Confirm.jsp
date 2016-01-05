<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common.css" type="text/css">
<div class="confirm_wrap">
		<form action="ticket.html">
		<!-- FLEX-CONTAINER -->
		<div class="confirm_flex-container">
				<div class="confirm_flex-item confirm_item1">
					<h3>예매 확인</h3>
					<div class="confirm_infomain">
						<div class="confirm_info" style="display: inline-block;">
							<div class="confirm_info">
					<div class="confirm_movieinfo">
						<div class="confirm_infoline">
							<label class="confirm_infotitle">영화</label>
							<h5 style="display: inline-block;margin: 0;">${movie}</h5>
						</div>
						<div class="confirm_infoline">
							<label class="confirm_infotitle">일시</label>
							<h5 style="display: inline-block;margin: 0;">${ticket.date} ${ticket.startTime}</h5>
						</div>
						<div class="confirm_infoline">
							<label class="confirm_infotitle">인원</label>
							<h5 style="display: inline-block;margin: 0;">일반${ticket.adult}명</h5>
							<h5 style="display: inline-block;margin: 0;">청소년${ticket.teenager}명</h5>
							<h5 style="display: inline-block;margin: 0;">우대${ticket.oldMan}명</h5>
						</div>
						<div class="confirm_infoline">
							<label class="confirm_infotitle">좌석번호</label>
							<h5 style="display: inline-block;margin: 0;">${ticket.seatNumber}</h5>
						</div>
					</div>
					<div class="confirm_cal">
						<div class="confirm_normal">
							<label class="confirm_infotitle">일반</label>
							<h5 style="display: inline-block;margin: 0;">10,000원 X ${ticket.adult}</h5>
						</div>
						<div class="confirm_adolescent">
							<label class="confirm_infotitle">청소년</label>
							<h5 style="display: inline-block;margin: 0;">7,000원 X ${ticket.teenager}</h5>
						</div>
						<div class="confirm_treatment">
							<label class="confirm_infotitle">우대</label>
							<h5 style="display: inline-block;margin: 0;">4,000원 X ${ticket.oldMan}</h5>
						</div>
						<div class="confirm_sum">
							<label class="confirm_infotitle">총금액</label>
							<h5 style="display: inline-block;margin: 0;">${ticket.price}원</h5>
						</div>
					</div>
				</div>
						</div>
						<div class="confirm_image" style="display: inline-table;">
							<img src="../images/ssk.jpg" alt="" height="300px" width="200px"/>
						</div>
					</div>
				<input id="confirm_resconfirm" class="confirm_resconfirm" name="next" type="submit">
				<label class="confirm_resconfirmlabel" for="confirm_resconfirm">확 인</label>
				</div>
				
		</div>
		</form>
	</div>