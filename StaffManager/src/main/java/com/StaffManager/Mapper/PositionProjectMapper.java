package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.PositionProjectModel;

public class PositionProjectMapper implements RowMapper<PositionProjectModel> {

	@Override
	public PositionProjectModel mapRow(ResultSet rs) {
		PositionProjectModel position = new PositionProjectModel();
		try {
			position.setId(rs.getLong("id"));
			position.setName(rs.getString("name"));
			return position;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
