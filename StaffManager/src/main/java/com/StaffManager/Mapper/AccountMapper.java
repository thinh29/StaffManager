package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.AccountModel;

public class AccountMapper implements RowMapper<AccountModel> {
	
	
	@Override
	public AccountModel mapRow(ResultSet rs) {
		
		AccountModel account = new AccountModel();
		try {
			account.setId(rs.getLong("id"));
			account.setUsername(rs.getString("username"));
			account.setPassword(rs.getString("password"));
			account.setFullName(rs.getString("full_name"));
			account.setTypeId(rs.getLong("type_id"));
			account.setStatusAcc(rs.getLong("status_act"));
			account.setCreateAt(rs.getTimestamp("create_at"));
			account.setCreateBy(rs.getLong("create_by"));
			account.setUpdateAt(rs.getTimestamp("update_at"));
			account.setUpdateBy(rs.getLong("update_by"));
			account.setDeleted(rs.getInt("deleted"));
			account.setDeleteAt(rs.getTimestamp("deleted_at"));
			account.setDeleteBy(rs.getLong("deleted_by"));
			return account;
		} catch (SQLException e) {
			return null;
		}

	}
}
