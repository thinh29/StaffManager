package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.StaffManager.Model.StatusProjectModel;

public class StatusProjectMapper implements RowMapper<StatusProjectModel> {
	@Override
	public StatusProjectModel mapRow(ResultSet rs) {
		StatusProjectModel statusModel = new StatusProjectModel() ; 
		try {			
			statusModel.setId(rs.getLong("id"));
			statusModel.setName(rs.getString("name"));
		}
		catch (SQLException e) {
			return null;
		}
		return statusModel;
	}
}

