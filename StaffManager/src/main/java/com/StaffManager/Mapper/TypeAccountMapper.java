package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.TypeAccountModel;

public class TypeAccountMapper implements RowMapper<TypeAccountModel> {

	@Override
	public TypeAccountModel mapRow(ResultSet rs) {
		TypeAccountModel typeAccountModel = new TypeAccountModel();
		try {
			typeAccountModel.setId(rs.getLong("id"));
			typeAccountModel.setName(rs.getString("name"));
			return typeAccountModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
