package com.hnb.schedule;

import org.springframework.stereotype.Component;

@Component
public class SeatsVO {
	private int row;
	private int col;
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
}
