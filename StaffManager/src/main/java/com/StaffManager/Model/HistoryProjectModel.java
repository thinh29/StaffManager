package com.StaffManager.Model;

public class HistoryProjectModel extends aAbstractModel<HistoryProjectModel> {
	private String title;
	private Long project_id;
	private Long assignFrom;
	private Long assignTo;
	private Long statusFrom;
	private Long statusTo;
	private String content;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getProject_id() {
		return project_id;
	}
	public void setProject_id(Long project_id) {
		this.project_id = project_id;
	}
	public Long getAssignFrom() {
		return assignFrom;
	}
	public void setAssignFrom(Long assignFrom) {
		this.assignFrom = assignFrom;
	}
	public Long getAssignTo() {
		return assignTo;
	}
	public void setAssignTo(Long assignTo) {
		this.assignTo = assignTo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getStatusFrom() {
		return statusFrom;
	}
	public void setStatusFrom(Long statusFrom) {
		this.statusFrom = statusFrom;
	}
	public Long getStatusTo() {
		return statusTo;
	}
	public void setStatusTo(Long statusTo) {
		this.statusTo = statusTo;
	}
	
}
