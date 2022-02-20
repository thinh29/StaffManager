package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.AccountNotificationModel;

public class AccountNotificationMapper implements RowMapper<AccountNotificationModel> {

	@Override
	public AccountNotificationModel mapRow(ResultSet rs) {
		AccountNotificationModel accNoti = new AccountNotificationModel();
		try {
			accNoti.setIdAcc(rs.getLong("id"));
			accNoti.setFullNameStaff(rs.getString("full_name"));
			accNoti.setIdPosition(rs.getLong("position_id"));
			return accNoti;
		}
		catch (SQLException e) {
			return null;
		}
	}
	

}
