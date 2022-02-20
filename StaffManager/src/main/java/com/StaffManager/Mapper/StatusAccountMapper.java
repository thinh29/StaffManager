package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.StatusAccountModel;

public class StatusAccountMapper implements RowMapper<StatusAccountModel>{

	@Override
	public StatusAccountModel mapRow(ResultSet rs) {
		StatusAccountModel statusAccount=new StatusAccountModel();
		try {
			statusAccount.setId(rs.getLong("id"));
			statusAccount.setName(rs.getString("name"));
			return statusAccount;
		}catch(SQLException e) {
			return null;
		}
	}

}
