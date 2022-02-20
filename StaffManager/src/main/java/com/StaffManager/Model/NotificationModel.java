package com.StaffManager.Model;

import java.text.DateFormatSymbols;

public class NotificationModel extends aAbstractModel<NotificationModel> {
	private String title;
	private String content;
	private Long level;
	private String levelName;
	private String backgroundName;
	
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Long getLevel() {
		return level;
	}


	public void setLevel(Long level) {
		this.level = level;
	}


	public String getLevelName() {
		return levelName;
	}


	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}


	public String getBackgroundName() {
		return backgroundName;
	}


	public void setBackgroundName(String backgroundName) {
		this.backgroundName = backgroundName;
	}


	public String convertNumberMonthToMonthName(int month) {
	    return new DateFormatSymbols().getMonths()[month-1];
	}

	
	
}
