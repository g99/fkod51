<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common.css" type="text/css">
<div class="seats_wrap">
		<form action="confirm.html">
		<!-- FLEX-CONTAINER -->
		<div class="seats_flex-container">
			<div class="seats_flex-item seats_item1">
				<h3>인원 / 좌석</h3>
				<div class="seats_number">
					<div class="seats_normal">
						<label class="seats_ratelist">일반</label>
						<!-- <input type="number" name="quantity" min="1" max="5">
						<input type="submit" value="Send"> -->
						<select name="normal">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
					</div>
					<div class="seats_teenager">
						<label class="seats_ratelist">청소년</label>
						<select name="teenager">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
					</div>
					<div class="seats_treatment">
						<label class="seats_ratelist">우대</label>
						<select name="treatment">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
					</div>
				</div>
				<div class="seats_seats">
					<div class="seats_screenborder">
						<label class="seats_screen">SCREEN</label>
					</div>
					<div class="seats_seatsblock" id="seats_seatsblock">
						<!-- <label class="seats_rownum" for="seats_">A</label>
						<input id="seats_check1" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check1">1</label>
						<input id="seats_check2" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check2">2</label>
						<label class="seats_empty"></label>
						<input id="seats_check3" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check3">3</label>
						<input id="seats_check4" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check4">4</label>
						<input id="seats_check5" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check5">5</label>
						<input id="seats_check6" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check6">6</label>
						<input id="seats_check7" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check7">7</label>
						<input id="seats_check8" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check8">8</label>
						<label class="seats_empty"></label>
						<input id="seats_check9" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check9">9</label>
						<input id="seats_check10" class="seats_check" name="chair" type="checkbox">
						<label class="seats_seatnum" for="seats_check10">10</label><br> -->
					</div>
					<div>
					<label id="reset_seats">다시선택하기</label>
					</div>
				</div>
			</div>
			<div class="seats_flex-item seats_item2">
				<h3>결제 정보</h3>
				<div class="seats_info">
					<div class="seats_movieinfo">
						<div class="seats_infoline" id="movie_info">
							<label class="seats_infotitle">영화</label>
							<h6 style="display: inline-block;margin: 0;">${movie}</h6>
						</div>
						<div class="seats_infoline">
							<label class="seats_infotitle">일시</label>
							<h5 style="display: inline-block;margin: 0;">${date}</h5>
							<h5 style="display: inline-block;margin: 0;">${time}</h5>
						</div>
						<div class="seats_infoline">
							<label class="seats_infotitle">인원</label>
							<div id="ea">
							<!-- <h5 style="display: inline-block;margin: 0;">일반3명</h5>
							<h5 style="display: inline-block;margin: 0;">청소년3명</h5>
							<h5 style="display: inline-block;margin: 0;">우대3명</h5> -->
							</div>
						</div>
						<div class="seats_infoline">
							<label class="seats_infotitle">좌석번호</label>
							<div id="seat_num">
							<!-- <h5 style="display: inline-block;margin: 0;">F5, F6, F7, F8, G5, G6, G7, G8, G9</h5> -->
							</div>
						</div>
					</div>
					<div class="seats_cal">
						<div id="seats_normal">
							<label class="seats_infotitle">일반</label>
							<div id="normal_cal">
							<!-- <h5 style="display: inline-block;margin: 0;">10,000원 X 3</h5> -->
							</div>
						</div>
						<div id="seats_teenager">
							<label class="seats_infotitle">청소년</label>
							<div id="teenager_cal">
							<!-- <h5 style="display: inline-block;margin: 0;">7,000원 X 3</h5> -->
							</div>
						</div>
						<div id="seats_treatment">
							<label class="seats_infotitle">우대</label>
							<div id="treatment_cal">
							<!-- <h5 style="display: inline-block;margin: 0;">4,000원 X 3</h5> -->
							</div>
						</div>
						<div id="seats_sum">
							<label class="seats_infotitle">총금액</label>
							<div id="total_cal">
							<!-- <h5 style="display: inline-block;margin: 0;">63,000원</h5> -->
							</div>
						</div>
					</div>
				</div>
				<label class="seats_doreslabel" id="reserve">예매하기</label>
			</div>
		</div>
		</form>
	</div>
	
	
<script type="text/javascript">
$(function() {
	Seats.initSeats();
	$('.seats_number').change(function() {
		Seats.seats_number();
		Seats.seats_cal();
		Seats.initSeats();
		$('#seat_num').empty();
		});
	$('#reset_seats').click(function() {
		Seats.initSeats();
		$('#seat_num').empty();
	});
	$('#reserve').click(function() {Seats.reserve();});
});
var Seats = {
		normalNum : null,
		teenagerNum : null,
		treatmentNum : null,
		sum : null,
		price : null,
				
		initSeats : function() {
			$.getJSON('${context}/ticket/Ticket.do?page=initSeats', function(data) {
				var row = 1;
				var seat_list = '<br>';
					$.each(data, function(index,val) {
						if (val!==0) {
							seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
							for (var int = 0; int < val; int++) {
								var count = int+1;
								seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
							}
							seat_list += '<br>';
							row++;
						}
					});
					$(seat_list).appendTo($('#seats_seatsblock').empty());
					$('.seats_check').click(function() {Seats.selectSeats();});
			});
		},
		selectSeats : function() {
			var checklistNum = $('input:checkbox:checked').length;
			var checklist = $('input:checkbox:checked').map(function() {return this.value;}).get().join(',');
			var seat_num ='<h5 style="display: inline-block;margin: 0;">'+checklist+'</h5>';	
			$(seat_num).appendTo($('#seat_num').empty());
			if (checklistNum===sum) {
				$('#seats_seatsblock').children().prop('disabled',true);
				alert("좌석을 모두 선택하셨습니다.");
			}
			
		},
		seats_number : function() {
			normalNum = Number($("select[name=normal] option:selected").val());
			teenagerNum = Number($("select[name=teenager] option:selected").val());
			treatmentNum = Number($("select[name=treatment] option:selected").val());
			sum = normalNum+teenagerNum+treatmentNum;
			price = normalNum*10000 + teenagerNum*7000 + treatmentNum*4000;
			var ea ='<h5 style="display: inline-block;margin: 0;">일반'+normalNum+'명</h5><h5 style="display: inline-block;margin: 0;">청소년'+teenagerNum+'명</h5><h5 style="display: inline-block;margin: 0;">우대'+treatmentNum+'명</h5>';	
			$(ea).appendTo($('#ea').empty());
		},
		seats_cal : function() {
			var normal_cal ='<h5 style="display: inline-block;margin: 0;">10,000원 X '+normalNum+'</h5>';
			$(normal_cal).appendTo($('#normal_cal').empty());
			var teenager_cal ='<h5 style="display: inline-block;margin: 0;">7,000원 X '+teenagerNum+'</h5>';
			$(teenager_cal).appendTo($('#teenager_cal').empty());
			var treatment_cal ='<h5 style="display: inline-block;margin: 0;">4,000원 X '+treatmentNum+'</h5>';
			$(treatment_cal).appendTo($('#treatment_cal').empty());
			var total_cal ='<h5 style="display: inline-block;margin: 0;">'+price+'</h5>';
			$(total_cal).appendTo($('#total_cal').empty());
		},
		reserve : function() {
			$.ajax('${context}/ticket/Ticket.do',{
				type : 'get',
				data : {
					adult : Number($("select[name=normal] option:selected").val()),
					teenager : Number($("select[name=teenager] option:selected").val()),
					old_man : Number($("select[name=treatment] option:selected").val()),
					price :Number($("select[name=normal] option:selected").val())*10000 + Number($("select[name=teenager] option:selected").val())*7000 + Number($("select[name=treatment] option:selected").val())*4000,
					seat_number : $('input:checkbox:checked').map(function() {return this.value;}).get().join(','),
					page : "infoSave"
				},
				async : true,
				dataType : 'json',
				success : function(data) {
					location.href="${context}/ticket/Ticket.do?page=Confirm";
				},
				error : function(xhr, status, msg) {
					alert('에러발생상태 : '+status+',내용:'+msg);
				}
			});
		}
};

</script>