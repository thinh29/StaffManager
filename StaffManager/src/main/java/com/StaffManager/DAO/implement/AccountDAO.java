package com.StaffManager.DAO.implement;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.IAccountDAO;
import com.StaffManager.Mapper.AccountMapper;
import com.StaffManager.Mapper.AccountPositionMapper;
import com.StaffManager.Mapper.StaffMapper;
import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Mapper.AccountNotificationMapper;
import com.StaffManager.Model.AccountNotificationModel;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

	@Override
	public AccountModel getLogin(String username, String password) {
		List<AccountModel> results = new ArrayList<>();
		String sql = "SELECT * FROM accounts WHERE username= ? AND password= ? AND deleted= 0;";
		results = queryGetList(sql, new AccountMapper(), username, password);
		return results.isEmpty() ? null : results.get(0);
	}

	@Override
	public AccountModel getAccountById(Long createBy) {
		List<AccountModel> results = new ArrayList<>();
		String sql = "SELECT * FROM accounts WHERE id = ? AND deleted= 0;";
		results = queryGetList(sql, new AccountMapper(), createBy);
		return results.isEmpty() ? null : results.get(0);
	}
	
	
	@Override
	public Long insertNewAccount(Object... objects) {
		Long lastID = null;
		StringBuilder sql = new StringBuilder("");
		sql.append(
				"INSERT INTO accounts (username, password,full_name,type_id,status_act,create_by,create_at,deleted)");
		sql.append(" VALUES (?, ?, ?, ?, 1, ?, ?, 0);");
		lastID = insert(sql.toString(), objects);
		return lastID;
	}

	@Override
	public Boolean deleteAccountByStaff(Long staffId, Long delBy, Timestamp delAt) {
		StringBuilder sql = new StringBuilder("UPDATE accounts AS A INNER JOIN account_owner AS B ON A.id = B.acc_id ");
		sql.append("SET A.deleted = 1, A.deleted_at = ?, A.deleted_by = ? ");
		sql.append("WHERE B.staff_id = ?;");
		return update(sql.toString(), delAt, delBy, staffId);
	}
	
	@Override
	public List<AccountModel> getListAccount(int type_id) {
		String sql = "select * from accounts where type_id = ? and deleted = 0 " ; 
		List<AccountModel> results = new ArrayList<>();
		results = queryGetList(sql, new AccountMapper(),type_id);	
		return results.isEmpty() ? null : results;
	}
	
	@Override
	public List<AccountModel> getListStaffPosition() {
		List<AccountModel> results = new ArrayList<>();;
		String sql = "select A.id , B.full_name, D.name From accounts as A inner join account_owner as C on A.id = C.acc_id inner join staffs as B on C.staff_id = B.id inner join position_staff as D on D.id = B.position where A.type_id = 5 AND A.deleted = 0 order by D.id asc";
		results = queryGetList(sql,new AccountPositionMapper());
		return results;
	}
	

	@Override
	public Boolean updateAccountFromStaff(Object... objects) {
		// TODO Auto-generated method stub String fullName, String address, String phone, String story, Long accountId
		StringBuilder sql = new StringBuilder("");
		sql.append("UPDATE accounts ");
		sql.append("SET full_name = ?, ");
		sql.append("update_at = ?, ");
		sql.append("update_by = ? ");
		sql.append("WHERE id = ?;");
		return update(sql.toString(), objects);
	}

	
	
	@Override
	public String getTypeName(long typeId) {
		List<String> types = new ArrayList<String>();
		String sql = "SELECT name FROM type_act WHERE id = ? ;";
		types = queryGetName(sql, "name", typeId);
		return types.isEmpty()? null: types.get(0);
	}

	@Override
	public String getStatusName(long statusId) {
		String sql="SELECT name FROM status_act WHERE id = ? ;";
		List<String> status = new ArrayList<String>();
		status = queryGetName(sql, "name", statusId);
		return status.isEmpty()? null : status.get(0);
	}

	@Override
	public String getCreateByName(long createById) {
		String sql="SELECT full_name FROM accounts WHERE id = ? ;";
		List<String> createBy = new ArrayList<String>();
		createBy = queryGetName(sql, "full_name", createById);
		return createBy.isEmpty()?null : createBy.get(0);
	}

	@Override
	public List<AccountModel> getAccountList(String sortBy, String sortName, Object... objects) {
		String sql = "SELECT * FROM accounts WHERE deleted = ? ORDER BY " + sortBy + " " + sortName + " LIMIT ?, ?;";
		return queryGetList(sql, new AccountMapper(), objects);
	}

	@Override
	public Integer getCount(Integer i) {
		String sql = "SELECT count(*) FROM accounts WHERE deleted = ?;";
		return count(sql, i);
	}

	@Override
	public Boolean updateAccount(AccountModel account) {
		StringBuilder sql = new StringBuilder("UPDATE accounts SET username = ?, password = ?, ");
		sql.append("type_id= ?, status_act= ?, update_by=? ,update_at= ? ");
		sql.append("WHERE id = ?;");
		return update(sql.toString(), account.getUsername(), account.getPassword(), account.getTypeId(), account.getStatusAcc(), 
		account.getUpdateBy(), account.getUpdateAt(), account.getId());
	}
	
	@Override
	public Boolean deleteAccount(long id, long deletedBy, Timestamp deletedAt) {
		String sql="UPDATE accounts SET deleted= 1, status_act= 3, deleted_by= ?, deleted_at = ? WHERE id = ?;";
		return update(sql, deletedBy, deletedAt, id);
	}

	@Override
	public Boolean restoreAccount(long id) {
		String sql="UPDATE accounts SET deleted = 0, status_act= 1, deleted_by= null, deleted_at= null WHERE id =?;";
		return update(sql, id);
	}

	@Override
	public List<AccountModel> getListSearch(String sortBy, String sortName, String keyword, Object... objects) {
		String sql="SELECT * FROM accounts WHERE full_name LIKE '%"+keyword+"%' AND deleted = ? ORDER BY "+sortBy+" "+sortName+" LIMIT ?, ?;";
		return queryGetList(sql, new AccountMapper(), objects);
	}

	@Override
	public Boolean resetPassword(long id, String password) {
		String sql="UPDATE accounts SET password = ? WHERE id = ?;";
		return update(sql, password, id);
	}

	@Override
	public StaffModel getStaffByAccount(long id) {
		StringBuilder sql =new StringBuilder("SELECT staffs.* ");
		sql.append("FROM account_owner ");
		sql.append("INNER JOIN staffs ON account_owner.staff_id = staffs.id ");
		sql.append("INNER JOIN accounts ON account_owner.acc_id = accounts.id ");
		sql.append("WHERE accounts.id = ?;");
		List<StaffModel>accountOwner=queryGetList(sql.toString(), new StaffMapper(), id);
		return accountOwner.isEmpty() ? null : accountOwner.get(0);
	}

	@Override
	public AccountModel getAccountByIdVu(Long id) {
		List<AccountModel> results = new ArrayList<>();
		String sql = "SELECT * FROM accounts WHERE id = ?;";
		results = queryGetList(sql, new AccountMapper(), id);
		return results.isEmpty() ? null : results.get(0);
	}

	
	@Override
	public List<AccountNotificationModel> getListAccountNoti() {
		// TODO Auto-generated method stub
		String sql = "select A.id , B.full_name, D.id as position_id  From accounts as A inner join account_owner as C on A.id = C.acc_id inner join staffs as B on C.staff_id = B.id inner join position_staff as D on D.id = B.position  where A.type_id = 5 AND A.deleted = 0;"; 
		return queryGetList(sql, new AccountNotificationMapper());
	}
	@Override
	public List<AccountModel> getAll(Integer del) {
		String sql="SELECT * FROM accounts where deleted = ?;";
		return queryGetList(sql, new AccountMapper(), del);
	}

	@Override
	public List<AccountModel> getListAccountNew(Integer del) {
		String sql ="SELECT * FROM accounts WHERE deleted = ? ORDER BY create_by DESC LIMIT 0, 5;";
		return queryGetList(sql, new AccountMapper(), del);
	}

	@Override
	public Integer countAccountType(Long typeId, int del) {
		String sql="SELECT count(*) FROM accounts WHERE type_id= ? AND deleted = ?;";
		return count(sql, typeId, del);
	}

	@Override
	public List<AccountModel> getListAccountCreateByOnSameDay(Long createBy, Integer day, String tableName, String tableDay) {
		String sql ="SELECT * FROM accounts WHERE "+tableName+"= ? AND day("+tableDay+") = ?;";
		return queryGetList(sql, new AccountMapper(), createBy, day);
	}

	@Override
	public AccountModel getAccountByUsername(String username) {
		String sql="SELECT * FROM accounts WHERE username = ?";
		List<AccountModel>accounts=queryGetList(sql, new AccountMapper(), username);
		return accounts.isEmpty() ? null : accounts.get(0);
	}

	@Override
	public List<AccountModel> getListAccountNotActive(int i) {
		String sql ="SELECT * FROM accounts WHERE status_act = 1 AND deleted = ? ORDER BY create_by DESC;";
		return queryGetList(sql, new AccountMapper(), i);
	}

	@Override
	public List<AccountModel> getAll() {
		String sql="SELECT * FROM accounts;";
		return queryGetList(sql, new AccountMapper());
	}

	@Override
	public Boolean updateFullNameAccount(String fullName, Long id) {
		StringBuilder sql = new StringBuilder("update accounts inner join account_owner on accounts.id=account_owner.acc_id set accounts.full_name= ? ");
		sql.append("where account_owner.staff_id = ?;");
		return update(sql.toString(), fullName, id);
		
	}

	
}
