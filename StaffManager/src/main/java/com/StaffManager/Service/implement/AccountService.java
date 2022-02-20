package com.StaffManager.Service.implement;

import java.security.SecureRandom;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.IAccountDAO;
import com.StaffManager.DAO.implement.AccountDAO;
import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.AccountNotificationModel;
import com.StaffManager.Service.IAccountService;

public class AccountService implements IAccountService {
	@Inject
	private IAccountDAO accountDAO = new AccountDAO();
	private SecureRandom sRandom = new SecureRandom();

	private String getRandomPassword(Integer _lenght) {
		String alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		StringBuilder secretPassword = new StringBuilder("");
		for (int i = 0; i < _lenght; i++) {
			int index = sRandom.nextInt(alphabet.length());
			secretPassword.append(alphabet.substring(index, index + 1));
		}
		return secretPassword.toString();
	}

	@Override
	public AccountModel getLogin(String username, String password) {
		return accountDAO.getLogin(username, password);
	}

	@Override
	public AccountModel getAccountById(Long createBy) {
		return accountDAO.getAccountById(createBy);
	}

	@Override
	public Long insertNewAccount(String userName, String fullName, Long typeId, Long createBy) {
		String password = getRandomPassword(6);
		Timestamp createAt = new Timestamp(System.currentTimeMillis());
		return accountDAO.insertNewAccount(userName, password, fullName, typeId, createBy, createAt);
	}

	@Override
	public List<AccountModel> getListAccount(int type_id) {
		// TODO Auto-generated method stub
		return accountDAO.getListAccount(type_id);
	}
	
	@Override
	public List<AccountModel> getListStaffPosition(){
		return accountDAO.getListStaffPosition();
	}

	@Override
	public Boolean updateAccountInStaff(String fullName, Long accountId) {
		// TODO Auto-generated method stub
		Timestamp updateAt = new Timestamp(System.currentTimeMillis());
		return accountDAO.updateAccountFromStaff(fullName, updateAt, accountId, accountId);
	}

	@Override
	public String getTypeName(long typeId) {
		return accountDAO.getTypeName(typeId);
	}
	@Override
	public String getStatusName(long statusId) {
		return accountDAO.getStatusName(statusId);
	}
	@Override
	public String getCreateByName(long createById) {
		return accountDAO.getCreateByName(createById);
	}
	@Override
	public String getUpdateByName(long id) {
		return accountDAO.getCreateByName(id);
	}
	@Override
	public String getDeleteByName(long id) {
		return accountDAO.getCreateByName(id);
	}
	@Override
	public List<AccountModel> getList(Integer page, Integer maxPageItem, int i, String sortBy, String sortName) {
		int start = (page - 1) * maxPageItem;
		return accountDAO.getAccountList(sortBy, sortName, i, start, maxPageItem);
	}
	
	@Override
	public Integer getTotalPage(Integer maxPageItem, Integer i) {
		Integer items = accountDAO.getCount(i);
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}
	@Override
	public Boolean updateAccount(AccountModel account) {
		account.setUpdateAt(new Timestamp(System.currentTimeMillis()));
		return accountDAO.updateAccount(account);
	}
	
	@Override
	public Boolean deleteAccount(long id, long deletedBy) {
		Timestamp deletedAt =new Timestamp(System.currentTimeMillis());
		return accountDAO.deleteAccount(id, deletedBy, deletedAt);
	}
	@Override
	public Boolean restoreAccount(long id) {
		return accountDAO.restoreAccount(id);
	}
	@Override
	public List<AccountModel> getListSearch(Integer page, Integer maxPageItem, int i, String keyword, String sortBy,
			String sortName) {
		int start = (page - 1) * maxPageItem;
		return accountDAO.getListSearch(sortBy, sortName, keyword, i, start, maxPageItem);
	}
	@Override
	public Boolean resetPassword(long id) {
		String newPassword=getRandomPassword(6);
		return accountDAO.resetPassword(id, newPassword);
	}
	@Override
	public Boolean resetPassword(long id,String newPassword) {
		return accountDAO.resetPassword(id, newPassword);
	}
	@Override
	public StaffModel getStaffByAccount(long id) {
		return accountDAO.getStaffByAccount(id);
	}
	@Override
	public AccountModel getAccountByIdVu(Long id) {
		return accountDAO.getAccountByIdVu(id);
	}
	
	
	@Override
	public List<AccountNotificationModel> getListAccountNoti() {
		// TODO Auto-generated method stub
		return accountDAO.getListAccountNoti();
	}
	@Override
	public List<AccountModel> getAll(Integer del) {
		return accountDAO.getAll(del);
	}

	@Override
	public List<AccountModel> getListAccountNew(Integer del) {
		return accountDAO.getListAccountNew(del);
	}

	@Override
	public Integer countAccountType(Long typeId, int del) {
		return accountDAO.countAccountType(typeId, del);
	}

	@Override
	public List<AccountModel> getListAccountCreateByOnSameDay(Long createBy, Integer day, String tableName, String tableDay) {
		return accountDAO.getListAccountCreateByOnSameDay(createBy, day, tableName, tableDay);
	}
	
	@Override
	@SuppressWarnings("deprecation")
	public String calculateMinuteForCreateAccount(Timestamp now, Timestamp createAt) {
		if(now.getHours() == createAt.getHours()) {
			Integer minuteNow=now.getMinutes();
			Integer minuteCreateAt=createAt.getMinutes();
			Integer minute=minuteNow-minuteCreateAt;
			return minute+" "+(minute<=1?"minute":"minutes")+" ago";
		}else if(now.getMinutes()==createAt.getMinutes()) {
			Integer secondNow=now.getSeconds();
			Integer secondCreateAt=createAt.getSeconds();
			Integer second=secondNow-secondCreateAt;
			return second+" "+(second<=1?"second":"seconds")+" ago";
		}else {
			Integer hourNow=now.getHours();
			Integer hourCreateAt=createAt.getHours();
			Integer hour=hourNow-hourCreateAt;
			return hour+" "+(hour<=1?"hour":"hours")+" ago";
		}
	}

	@Override
	public AccountModel getAccountByUsername(String username) {
		return accountDAO.getAccountByUsername(username);
	}

	@Override
	public List<AccountModel> getListAccountNotActive(int i) {
		return accountDAO.getListAccountNotActive(i);
	}

	@Override
	public List<AccountModel> getAll() {
		return accountDAO.getAll();
	}	
}
