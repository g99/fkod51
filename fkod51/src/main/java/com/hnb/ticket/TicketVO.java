package com.hnb.ticket;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class TicketVO {
	private String ticketNumber;
	private String id;
	private String filmNumber;
	private String theaterName;
	private String roomName;
	private String seatNumber;
	private String startTime;
	private String date;
	private int adult;
	private int oldMan;
	private int teenager;
	private int price;
	public String getTicketNumber() {
		return ticketNumber;
	}
	public String getId() {
		return id;
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
	public String getSeatNumber() {
		return seatNumber;
	}
	public String getDate() {
		return date;
	}
	public int getAdult() {
		return adult;
	}
	public int getOldMan() {
		return oldMan;
	}
	public int getTeenager() {
		return teenager;
	}
	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
	public void setId(String id) {
		this.id = id;
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
	public void setSeatNumber(String string) {
		this.seatNumber = string;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public void setOldMan(int oldMan) {
		this.oldMan = oldMan;
	}
	public void setTeenager(int teenager) {
		this.teenager = teenager;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
