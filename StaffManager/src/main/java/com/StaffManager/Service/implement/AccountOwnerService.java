package com.StaffManager.Service.implement;

import javax.inject.Inject;

import com.StaffManager.DAO.IAccountOwnerDAO;
import com.StaffManager.Model.AccountOwnerModel;
import com.StaffManager.Service.IAccountOwnerService;

public class AccountOwnerService implements IAccountOwnerService {
@Inject
private IAccountOwnerDAO accountOwnerDAO;
	@Override
	public String relaAccountAndStaff(Long accountId, Long staffId) {
		return accountOwnerDAO.relaAccountAndStaff(accountId, staffId);
	}
	@Override
	public AccountOwnerModel getAccountOwnerByAccountId(Long id) {
		return accountOwnerDAO.getAccountOwnerByAccountId(id);
	}
	@Override
	public Long getIdStaffByAccountId(long id) {
		return accountOwnerDAO.getIdStaffByAccountId(id);
	}
	@Override
	public Integer countAccountsOfOneStaff(Long staffId) {
		return accountOwnerDAO.countAccountsOfOneStaff(staffId);
	}

}
