package com.StaffManager.Model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectModel extends aAbstractModel<ProjectModel> {
	private String name;
	private String description;
	private Integer progress;
	private Long status;
	private Timestamp beginDate;
	private Timestamp finishDate;
	private Timestamp expectedDate;
	private Long duration;
	private Long parentId;
	private Long manager;
	private Long accountId;
	private Long root;
	private Long position;
	public Timestamp getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Timestamp beginDate) {
		this.beginDate = beginDate;
	}

	public Timestamp getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Timestamp finishDate) {
		this.finishDate = finishDate;
	}

	public Timestamp getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(Timestamp expectedDate) {
		this.expectedDate = expectedDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getProgress() {
		return progress;
	}

	public void setProgress(Integer progress) {
		this.progress = progress;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public Long getDuration() {
		return duration;
	}

	public void setDuration(Long duration) {
		this.duration = duration;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getManager() {
		return manager;
	}

	public void setManager(Long manager) {
		this.manager = manager;
	}

	public String convertTime(Timestamp time,int type) {
		String pattern = "";
		switch (type) {
			case 1:
				pattern = "h':'mm a '<br/>' dd-MM-yyyy";
				break;
			case 2:
				pattern = "HH:mm:ss dd-MM-yyyy";
				break;
			case 3:
				pattern = "yyy-MM-dd";
				break;
			case 4:
				pattern = "HH:mm";
				break;
			default:
				pattern = "yyyy-MM-dd";
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(time);
		return date;
	}

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public Long getRoot() {
		return root;
	}

	public void setRoot(Long root) {
		this.root = root;
	}

	public Long getPosition() {
		return position;
	}

	public void setPosition(Long position) {
		this.position = position;
	}
	
}
