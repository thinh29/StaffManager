package com.StaffManager.Model;

public class NotificationSendModel extends aAbstractModel<NotificationSendModel>{
	private Long notificationId;
	private Long accountId;
	private Integer seen;
	
	
	public Long getNotificationId() {
		return notificationId;
	}
	public void setNotificationId(Long notificationId) {
		this.notificationId = notificationId;
	}
	public Long getAccountId() {
		return accountId;
	}
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	public Integer getSeen() {
		return seen;
	}
	public void setSeen(Integer seen) {
		this.seen = seen;
	}

}
