package com.hnb.schedule;

import org.springframework.stereotype.Component;

@Component
public class ScheduleVO {
	private int seq;
	private String filmNumber;
	private String theaterName;
	private String roomName;
	private String showDate;
	private String showTime;
	private int seatStatus;
	public int getSeq() {
		return seq;
	}
	public String getFilmNumber() {
		return filmNumber;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public String getRoomName() {
		return roomName;
	}
	public String getShowDate() {
		return showDate;
	}
	public String getShowTime() {
		return showTime;
	}
	public int getSeatStatus() {
		return seatStatus;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setFilmNumber(String filmNumber) {
		this.filmNumber = filmNumber;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
	public void setSeatStatus(int seatStatus) {
		this.seatStatus = seatStatus;
	}
	
}
