package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.AccountModel;

public class AccountPositionMapper implements RowMapper<AccountModel> {
	
	
	@Override
	public AccountModel mapRow(ResultSet rs) {
		
		AccountModel account = new AccountModel();
		try {
			account.setId(rs.getLong("id"));
			account.setFullName(rs.getString("full_name"));
			account.setPositionName(rs.getString("name"));
			return account;
		} catch (SQLException e) {
			return null;
		}

	}
}
