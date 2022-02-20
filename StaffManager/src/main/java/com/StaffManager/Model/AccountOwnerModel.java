package com.StaffManager.Model;

public class AccountOwnerModel extends aAbstractModel<AccountOwnerModel> {
	private Long accountId;
	private Long staffId;
	public Long getAccountId() {
		return accountId;
	}
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	public Long getStaffId() {
		return staffId;
	}
	public void setStaffId(Long staffId) {
		this.staffId = staffId;
	}
	
}
