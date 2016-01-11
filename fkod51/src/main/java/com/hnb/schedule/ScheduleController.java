package com.hnb.schedule;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hnb.ticket.TicketVO;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired ScheduleServiceImpl scheduleService;
	@Autowired TicketVO ticket;
	@Autowired SeatsVO seats;
	
	@RequestMapping("/Ticket")
	public String ticketMain(){
		logger.info("ScheduleController-ticketMain() 진입");
		return "ticket/Ticket.jsp";
	}
	
	@RequestMapping("/movieSelect")
	public Model movieSelect(
			String movie,
			String theater,
			String date,
			Model model
			){
		logger.info("ScheduleController-movieSelect() 진입");
		logger.info("movie : {}", movie);
		logger.info("theater : {}", theater);
		logger.info("date : {}", date);
		logger.info("=================================================================구분==================================");
		
		List<?> theaterList = new ArrayList<>();
		List<?> dateList = new ArrayList<>();
		List<?> timeList = new ArrayList<>();
		if (theater==null && date!=null) {
			theaterList = scheduleService.getTheaterListByMD(movie,date);
			dateList = scheduleService.getShowDateListByM(movie);
		} else if (theater!=null && date==null) {
			theaterList = scheduleService.getTheaterListByM(movie);
			dateList = scheduleService.getShowDateListByMT(movie,theater);
		} else if (theater==null && date==null) {
			theaterList = scheduleService.getTheaterListByM(movie);
			dateList = scheduleService.getShowDateListByM(movie);
		} else if (movie!=null&&theater!=null&&date!=null) {
			theaterList = scheduleService.getTheaterListByMD(movie, date);
			dateList = scheduleService.getShowDateListByMT(movie, theater);
			timeList = scheduleService.getTimeList(movie, theater, date);
		}
		logger.info("theaterList : {}", theaterList);
		logger.info("dateList : {}", dateList);
		logger.info("timeList : {}", timeList);
		logger.info("movie : {}", movie);
		model.addAttribute("theaterList",theaterList);
		model.addAttribute("dateList",dateList);
		model.addAttribute("timeList",timeList);
		return model;
	}
	@RequestMapping("/theaterSelect")
	public Model theaterSelect(
			String movie,
			String theater,
			String date,
			Model model
			){
		logger.info("ScheduleController-theaterSelect() 진입");
		logger.info("movie : {}", movie);
		logger.info("theater : {}", theater);
		logger.info("date : {}", date);
		List<?> movieListRate = new ArrayList<>();
		List<?> movieListAsc = new ArrayList<>();
		List<?> dateList = new ArrayList<>();
		List<?> timeList = new ArrayList<>();
		if (movie==null && date!=null) {
			movieListRate = scheduleService.getMovieRateByTD(theater,date);
			movieListAsc = scheduleService.getMovieAscByTD(theater,date);
			dateList = scheduleService.getShowDateListByT(theater);
		} else if (movie!=null && date==null) {
			logger.info("영화, 극장 : {}, {}",movie,theater);
			movieListRate = scheduleService.getMovieRateByT(theater);
			movieListAsc = scheduleService.getMovieAscByT(theater);
			dateList = scheduleService.getShowDateListByMT(movie, theater);
		} else if (movie==null && date==null) {
			movieListRate = scheduleService.getMovieRateByT(theater);
			movieListAsc = scheduleService.getMovieAscByT(theater);
			dateList = scheduleService.getShowDateListByT(theater);
		} else if (movie!=null&&theater!=null&&date!=null) {
			movieListRate = scheduleService.getMovieRateByTD(theater, date);
			movieListAsc = scheduleService.getMovieAscByTD(theater, date);
			dateList = scheduleService.getShowDateListByMT(movie, theater);
			timeList = scheduleService.getTimeList(movie, theater, date);
		}
		model.addAttribute("movieListRate", movieListRate);
		model.addAttribute("movieListAsc", movieListAsc);
		model.addAttribute("dateList", dateList);
		model.addAttribute("timeList", timeList);
		return model;
	}
	@RequestMapping("/dateSelect")
	public Model dateSelect(
			String movie,
			String theater,
			String date,
			Model model
			){
		logger.info("ScheduleController-dateSelect() 진입");
		List<?> movieListRate = new ArrayList<>();
		List<?> movieListAsc = new ArrayList<>();
		List<?> theaterList = new ArrayList<>();
		List<?> timeList = new ArrayList<>();
		if (movie==null && theater!=null) {
			movieListRate = scheduleService.getMovieRateByTD(theater,date);
			movieListAsc = scheduleService.getMovieAscByTD(theater,date);
			theaterList = scheduleService.getTheaterListByD(date);
		} else if (movie!=null && theater==null) {
			movieListRate = scheduleService.getMovieRateByD(date);
			movieListAsc = scheduleService.getMovieAscByD(date);
			theaterList = scheduleService.getTheaterListByMD(movie,date);
		} else if (movie==null && theater==null) {
			movieListRate = scheduleService.getMovieRateByD(date);
			movieListAsc = scheduleService.getMovieAscByD(date);
			theaterList = scheduleService.getTheaterListByD(date);
		} else if (movie!=null&&theater!=null&&date!=null) {
			movieListRate = scheduleService.getMovieRateByTD(theater, date);
			movieListAsc = scheduleService.getMovieAscByTD(theater, date);
			theaterList = scheduleService.getTheaterListByMD(movie, date);
			timeList = scheduleService.getTimeList(movie, theater, date);
		}
		logger.info("ScheduleController-dateSelect() 진입 timeList: ======== {}",timeList);
		model.addAttribute("movieListRate", movieListRate);
		model.addAttribute("movieListAsc", movieListAsc);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("timeList", timeList);
		return model;
	}
	@RequestMapping("/choiceseat")
	public Model choiceseat(
			String movie,
			String theater,
			String date,
			String time,
			Model model
			){
		logger.info("ScheduleController-choiceseat() 진입");
		String filmNumber = scheduleService.getFilmNumberBy(movie);
		ticket.setFilmNumber(filmNumber);
		ticket.setTheaterName(theater);
		ticket.setDate(date);
		ticket.setRoomName(time.split(" ")[0]);
		ticket.setStartTime(time.split(" ")[1]);
		logger.info("영화번호 : {}", ticket.getFilmNumber());
		logger.info("영화관 : {}", ticket.getTheaterName());
		logger.info("날짜 : {}", ticket.getDate());
		logger.info("관번호 : {}", ticket.getRoomName());
		logger.info("시작시간 : {}", ticket.getStartTime());
		model.addAttribute("movie", movie);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("ticket", ticket);
		return model;
	}
	
	@RequestMapping("/initList")
	public Model initList(Model model){
		logger.info("ScheduleController-initList() 진입");
		List<?> movieListRate = scheduleService.getRateList();
		logger.info("movieListRate : {}",movieListRate);
		List<?> movieListAsc = scheduleService.getAscList();
		List<?> theaterList = scheduleService.getTheaterList();
		List<?> dateList = scheduleService.getShowDateList();
		model.addAttribute("movieListRate", movieListRate);
		model.addAttribute("movieListAsc", movieListAsc);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("dateList", dateList);
		logger.info("initList : {}",model);
		return model;
	}
	@RequestMapping("/Seats")
	public Model seatsMain(Model model){
		logger.info("ScheduleController-seatsMain() 진입");
		model.addAttribute("movie", ticket.getFilmNumber());
		model.addAttribute("date", ticket.getDate());
		model.addAttribute("time", ticket.getStartTime());
		return model;
	}
	@RequestMapping("/infoSave")
	public Model infoSave(
			String adult,
			String old_man,
			String teenager,
			String price,
			String seat_number,
			Model model
			){
		logger.info("ScheduleController-infoSave() 진입");
		ticket.setAdult(Integer.parseInt(adult));
		ticket.setOldMan(Integer.parseInt(old_man));
		ticket.setTeenager(Integer.parseInt(teenager));
		ticket.setPrice(Integer.parseInt(price));
		ticket.setSeatNumber(seat_number);
		model.addAttribute("result", "success");
		return model;
	}
	@RequestMapping("/Confirm")
	public Model confirmMain(Model model){
		logger.info("ScheduleController-confirmMain() 진입");
		model.addAttribute("movie", ticket.getFilmNumber());
		model.addAttribute("ticket", ticket);
		return model;
	}
	@RequestMapping("/initSeats")
	public Model initSeats(
			String movie,
			String date,
			String time,
			String filmNumber,
			String theater,
			String roomName,
			String startTime,
			Model model){
		logger.info("ScheduleController-initSeats() 진입");
		logger.info("ScheduleController-initSeats() 진입======room scale : {}",scheduleService.getSeatList(ticket.getTheaterName(),ticket.getRoomName()));
		String scheduleSeqTemp = scheduleService.getScheduleSeq(filmNumber,theater,roomName,date,startTime);
		String scheduleSeq = scheduleSeqTemp+"-%";
		logger.info("ScheduleController-initSeats() 스케줄번호 : {}", scheduleSeq);
		List<?> selectedSeatsList = scheduleService.getSelectedSeats(scheduleSeq);
		List<SeatsVO> seatsList = new ArrayList<>();
		List<Boolean> aArr = new ArrayList<>();
		List<Boolean> bArr = new ArrayList<>();
		List<Boolean> cArr = new ArrayList<>();
		List<Boolean> dArr = new ArrayList<>();
		List<Boolean> eArr = new ArrayList<>();
		List<Boolean> fArr = new ArrayList<>();
		List<Boolean> gArr = new ArrayList<>();
		List<Boolean> hArr = new ArrayList<>();
		List<Boolean> iArr = new ArrayList<>();
		List<Boolean> jArr = new ArrayList<>();
		RoomVO selectedRoom = scheduleService.getSeatList(ticket.getTheaterName(),ticket.getRoomName());
		//seatsList 만드는 for문
		for (int i = 0; i < selectedSeatsList.size(); i++) {
			String temp = (String) selectedSeatsList.get(i);
			String hoo = temp.replace((scheduleSeqTemp+"-"), "");
			SeatsVO seats = new SeatsVO();
			seats.setRow(Integer.parseInt(hoo.split("열 ")[0]));
			seats.setCol(Integer.parseInt(hoo.split("열 ")[1]));
			seatsList.add(seats);
		}
		//초기화
		for (int i = 0; i < selectedRoom.getA(); i++) {
			aArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getB(); i++) {
			bArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getC(); i++) {
			cArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getD(); i++) {
			dArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getE(); i++) {
			eArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getF(); i++) {
			fArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getG(); i++) {
			gArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getH(); i++) {
			hArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getI(); i++) {
			iArr.add(false);
		}
		for (int i = 0; i < selectedRoom.getJ(); i++) {
			jArr.add(false);
		}
		// 있는 좌석  true로 변경
		for (int i = 0; i < seatsList.size(); i++) {
			switch (seatsList.get(i).getRow()) {
			case 1:
				aArr.remove(seatsList.get(i).getCol()-1);
				aArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 2:
				bArr.remove(seatsList.get(i).getCol()-1);
				bArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 3:
				cArr.remove(seatsList.get(i).getCol()-1);
				cArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 4:
				dArr.remove(seatsList.get(i).getCol()-1);
				dArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 5:
				eArr.remove(seatsList.get(i).getCol()-1);
				eArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 6:
				fArr.remove(seatsList.get(i).getCol()-1);
				fArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 7:
				gArr.remove(seatsList.get(i).getCol()-1);
				gArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 8:
				hArr.remove(seatsList.get(i).getCol()-1);
				hArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 9:
				iArr.remove(seatsList.get(i).getCol()-1);
				iArr.add(seatsList.get(i).getCol()-1, true);
				break;
			case 10:
				jArr.remove(seatsList.get(i).getCol()-1);
				jArr.add(seatsList.get(i).getCol()-1, true);
				break;
			default:
				break;
			}
		}
		logger.info("dArr : {}",dArr);
		
		model.addAttribute("seatList", scheduleService.getSeatList(ticket.getTheaterName(),ticket.getRoomName()));
		//model.addAttribute("selectedSeats", seatsList);
		model.addAttribute("aArr", aArr);
		model.addAttribute("bArr", bArr);
		model.addAttribute("cArr", cArr);
		model.addAttribute("dArr", dArr);
		model.addAttribute("eArr", eArr);
		model.addAttribute("fArr", fArr);
		model.addAttribute("gArr", gArr);
		model.addAttribute("hArr", hArr);
		model.addAttribute("iArr", iArr);
		model.addAttribute("jArr", jArr);
		logger.info("ScheduleController-initSeats() 진입 좌석 리스트{}", selectedSeatsList.toString());
		return model;
	}
}
