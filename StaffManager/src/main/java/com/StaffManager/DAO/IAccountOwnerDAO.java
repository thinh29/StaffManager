package com.StaffManager.DAO;

import com.StaffManager.Model.AccountOwnerModel;

public interface IAccountOwnerDAO {
	public String relaAccountAndStaff(Long accountId, Long staffId);

	public AccountOwnerModel getAccountOwnerByAccountId(Long id);
	public Long getIdStaffByAccountId(long id);
	public Integer countAccountsOfOneStaff(Long staffId);
}
