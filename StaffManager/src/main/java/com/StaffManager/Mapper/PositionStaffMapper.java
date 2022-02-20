package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.PositionStaffModel;

public class PositionStaffMapper implements RowMapper<PositionStaffModel> {

	@Override
	public PositionStaffModel mapRow(ResultSet rs) {
		PositionStaffModel positionStaffModel = new PositionStaffModel();
		try {
			positionStaffModel.setId(rs.getLong("id"));
			positionStaffModel.setName(rs.getString("name"));
			return positionStaffModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
