package com.hnb.global;

public class Command implements Orderable {
	private String column, keyword; 
	private int pageNo, start, end;
	public final int PAGESIZE = 15;
	public Command(String pageNo) {
		this.pageNo = Integer.parseInt(pageNo);
		this.start = (Integer.parseInt(pageNo)-1)*PAGESIZE;
		this.end = (Integer.parseInt(pageNo)*PAGESIZE);
	}

	public Command(String column, String keyword, String pageNo) {
		this.column = column;
		this.keyword = keyword;
		this.pageNo = Integer.parseInt(pageNo);
		this.start = (Integer.parseInt(pageNo)-1)*PAGESIZE+1;
		this.end = (Integer.parseInt(pageNo)*PAGESIZE);
		 
	}

	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public void execute() {
		// TODO Auto-generated method stub
		
	}
	

}
