package com.StaffManager.Service;

import java.sql.Timestamp;
import java.util.List;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.AccountNotificationModel;


public interface IAccountService {
	
	public AccountModel getLogin(String username, String password);

	public AccountModel getAccountById(Long createBy);

	public Long insertNewAccount(String userName, String fullName, Long typeId, Long createBy);

	// public List<AccountModel> getListAccountManager();

	public Boolean updateAccountInStaff(String fullName, Long accountId);

	
	public List<AccountModel> getListAccount(int type_id);
	
	public List<AccountModel> getListStaffPosition();
	
	public String getTypeName(long typeId);
	public String getStatusName(long statusId);
	public String getCreateByName(long createById);
	public String getUpdateByName(long id);
	public String getDeleteByName(long id);
	public Integer getTotalPage(Integer maxPageItem, Integer i);
	public Boolean updateAccount(AccountModel account);
	public Boolean deleteAccount(long id, long deletedBy);
	public Boolean restoreAccount(long id);
	public List<AccountModel> getListSearch(Integer page, Integer maxPageItem, int i, String keyword, String sortBy, String sortName);
	public Boolean resetPassword(long id);
	public Boolean resetPassword(long id,String newPassword);
	public StaffModel getStaffByAccount(long id);
	public AccountModel getAccountByIdVu(Long id);
	public List<AccountModel> getList(Integer page, Integer maxPageItem, int i, String sortBy, String sortName);
	
	public List<AccountNotificationModel> getListAccountNoti();

	public List<AccountModel>getAll(Integer del);
	public List<AccountModel> getListAccountNew(Integer del);
	public Integer countAccountType(Long typeId, int del);
	public List<AccountModel>getListAccountCreateByOnSameDay(Long createBy, Integer day, String tableName, String tableDay);
	public String calculateMinuteForCreateAccount(Timestamp now, Timestamp createAt);
	public AccountModel getAccountByUsername(String username);

	public List<AccountModel> getListAccountNotActive(int i);

	public List<AccountModel> getAll();

	
}