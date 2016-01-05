package com.hnb.movie;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component

public class MovieVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private String filmNumber;
	private String filmName;
	private String director;
	private String actor;
	private String rate;
	private int runtime;
	private int price;
	private String genre;
	private String country;
	private Date releaseDate;
	private Date endDate;
	private String story;
	private String cut;
	private String trailer;
	private int tRate;
	public MovieVO() {
		// TODO Auto-generated constructor stub
	}
	public MovieVO(String filmNumber, String filmName, String director, String actor, String rate, int runtime,
			int price, String genre, Date releaseDate, Date endDate, String story, String cut,
			String trailer, int tRate) {
		super();
		this.filmNumber = filmNumber;
		this.filmName = filmName;
		this.director = director;
		this.actor = actor;
		this.rate = rate;
		this.runtime = runtime;
		this.price = price;
		this.genre = genre;
		this.releaseDate = releaseDate;
		this.endDate = endDate;
		this.story = story;
		this.cut = cut;
		this.trailer = trailer;
		this.tRate = tRate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getFilmNumber() {
		return filmNumber;
	}
	public String getFilmName() {
		return filmName;
	}
	public String getDirector() {
		return director;
	}
	public String getActor() {
		return actor;
	}
	public String getRate() {
		return rate;
	}
	public int getRuntime() {
		return runtime;
	}
	public int getPrice() {
		return price;
	}
	public String getGenre() {
		return genre;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public String getStory() {
		return story;
	}
	public String getCut() {
		return cut;
	}
	public String getTrailer() {
		return trailer;
	}
	public String getCountry() {
		return country;
	}
	public int gettRate() {
		return tRate;
	}
	public void settRate(int tRate) {
		this.tRate = tRate;
	}
	public void setFilmNumber(String filmNumber) {
		this.filmNumber = filmNumber;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public void setReleaseDate(Date date) {
		this.releaseDate = date;
	}
	public void setEndDate(Date date) {
		this.endDate = date;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public void setCut(String cut) {
		this.cut = cut;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
}

