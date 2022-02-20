package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.TypeStaffModel;

public class TypeStaffMapper implements RowMapper<TypeStaffModel> {

	@Override
	public TypeStaffModel mapRow(ResultSet rs) {
		TypeStaffModel typeStaffModel = new TypeStaffModel();
		
		try {
			typeStaffModel.setId(rs.getLong("id"));
			typeStaffModel.setName(rs.getString("name"));
			return typeStaffModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();return null;
		}
		
	}

}
