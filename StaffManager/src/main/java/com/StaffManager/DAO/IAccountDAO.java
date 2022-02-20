package com.StaffManager.DAO;

import java.sql.Timestamp;
import java.util.List;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.AccountNotificationModel;

public interface IAccountDAO {

	public AccountModel getLogin(String username, String password);

	public AccountModel getAccountById(Long createBy);

	public Long insertNewAccount(Object... objects);

	public Boolean deleteAccountByStaff(Long staffId, Long delBy, Timestamp delAt);
	
	// public List<AccountModel> getListAccountManager();

	public Boolean updateAccountFromStaff(Object...objects);
	public List<AccountModel> getListAccount(int type_id);
	
	public List<AccountModel> getListStaffPosition();

	public List<AccountNotificationModel> getListAccountNoti();

	
	public String getTypeName(long typeId);
	public String getStatusName(long statusId);
	public String getCreateByName(long createById);
	public List<AccountModel>getAccountList(String sortBy, String sortName, Object... objects);
	public Integer getCount(Integer i);
	public Boolean updateAccount(AccountModel account);
	public Boolean deleteAccount(long id, long deletedBy, Timestamp deletedAt);
	public Boolean restoreAccount(long id);
	public List<AccountModel> getListSearch(String sortBy, String sortName, String keyword ,Object... objects);
	public Boolean resetPassword(long id, String password);
	public StaffModel getStaffByAccount(long id);
	public AccountModel getAccountByIdVu(Long id);
	public List<AccountModel>getAll(Integer del);
	public List<AccountModel> getListAccountNew(Integer del);
	public Integer countAccountType(Long typeId, int del);
	public List<AccountModel>getListAccountCreateByOnSameDay(Long createBy, Integer day, String tableName, String tableDay);
	public AccountModel getAccountByUsername(String username);

	public List<AccountModel> getListAccountNotActive(int i);

	public List<AccountModel> getAll();

	public Boolean updateFullNameAccount(String fullName, Long id);

}
