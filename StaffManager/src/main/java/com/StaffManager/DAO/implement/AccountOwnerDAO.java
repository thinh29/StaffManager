package com.StaffManager.DAO.implement;

import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.IAccountOwnerDAO;
import com.StaffManager.Mapper.AccountOwnerMapper;
import com.StaffManager.Model.AccountOwnerModel;

public class AccountOwnerDAO extends AbstractDAO<AccountOwnerModel> implements IAccountOwnerDAO {

	@Override
	public String relaAccountAndStaff(Long accountId, Long staffId) {
		String sql = "INSERT INTO account_owner (staff_id, acc_id) values (?, ?);";
		Long lastID = insert(sql, staffId, accountId);
		return lastID==null?"":"add_staff_success";
	}

	@Override
	public AccountOwnerModel getAccountOwnerByAccountId(Long id) {
		List<AccountOwnerModel> listRS = new ArrayList<AccountOwnerModel>();
		String sql = "SELECT * FROM account_owner WHERE acc_id = ?;";
		listRS = queryGetList(sql, new AccountOwnerMapper(), id);
		return listRS.isEmpty()? null:listRS.get(0);
	}
	
	@Override
	public Long getIdStaffByAccountId(long id) {
		String sql="SELECT staff_id FROM account_owner WHERE acc_id= ?;";
		List<String> staffId = queryGetName(sql, "staff_id", id);
		return staffId.isEmpty() ? null : Long.parseLong(staffId.get(0));
	}

	@Override
	public Integer countAccountsOfOneStaff(Long staffId) {
		String sql="SELECT count(*) FROM account_owner WHERE staff_id = ?;";
		return count(sql, staffId);
	}

}
