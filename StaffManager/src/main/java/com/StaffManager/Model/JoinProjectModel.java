package com.StaffManager.Model;

public class JoinProjectModel extends aAbstractModel<NotificationModel> {
	private Long AccountId;
	private Long rootId;
	private Long Position;
	private String AccountName;
	private String PositionName;
	public Long getAccountId() {
		return AccountId;
	}
	public void setAccountId(Long accountId) {
		AccountId = accountId;
	}
	public Long getRootId() {
		return rootId;
	}
	public void setRootId(Long rootId) {
		this.rootId = rootId;
	}
	public Long getPosition() {
		return Position;
	}
	public void setPosition(Long position) {
		Position = position;
	}
	public String getAccountName() {
		return AccountName;
	}
	public void setAccountName(String accountName) {
		AccountName = accountName;
	}
	public String getPositionName() {
		return PositionName;
	}
	public void setPositionName(String positionName) {
		PositionName = positionName;
	}

	
}