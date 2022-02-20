package com.StaffManager.Model;

public class AccountNotificationModel extends aAbstractModel<AccountNotificationModel>{
	private Long idAcc;
	private String fullNameStaff;
	private Long idPosition;
	public Long getIdAcc() {
		return idAcc;
	}
	public void setIdAcc(Long idAcc) {
		this.idAcc = idAcc;
	}
	public String getFullNameStaff() {
		return fullNameStaff;
	}
	public void setFullNameStaff(String fullNameStaff) {
		this.fullNameStaff = fullNameStaff;
	}
	public Long getIdPosition() {
		return idPosition;
	}
	public void setIdPosition(Long idPosition) {
		this.idPosition = idPosition;
	}
		
	

}
