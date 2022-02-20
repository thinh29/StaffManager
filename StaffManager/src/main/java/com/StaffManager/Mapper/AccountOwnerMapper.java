package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.AccountOwnerModel;

public class AccountOwnerMapper implements RowMapper<AccountOwnerModel> {

	@Override
	public AccountOwnerModel mapRow(ResultSet rs) {
		AccountOwnerModel accountOwnerModel = new AccountOwnerModel();
		try {
			accountOwnerModel.setId(rs.getLong("id"));
			accountOwnerModel.setAccountId(rs.getLong("acc_id"));
			accountOwnerModel.setStaffId(rs.getLong("staff_id"));
			return accountOwnerModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
