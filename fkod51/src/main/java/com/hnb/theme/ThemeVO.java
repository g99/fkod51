package com.hnb.theme;

import org.springframework.stereotype.Component;

@Component
public class ThemeVO {
	private int themeNo;
	private String themeName;
	
	public int getThemeNo() {
		return themeNo;
	}
	public String getThemeName() {
		return themeName;
	}
	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
}
