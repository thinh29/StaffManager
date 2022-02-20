package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.JoinProjectModel;

public class JoinProjectMapper implements RowMapper<JoinProjectModel> {

	@Override
	public JoinProjectModel mapRow(ResultSet rs) {
		JoinProjectModel map = new JoinProjectModel();
		try {
			map.setId(rs.getLong("id"));
			map.setAccountId(rs.getLong("account_id"));
			map.setRootId(rs.getLong("root_id"));
			map.setPosition(rs.getLong("position"));
			map.setAccountName(rs.getString("full_name"));
			map.setPositionName(rs.getString("name"));
			return map;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
