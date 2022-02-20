package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.ProvinceModel;

public class ProvinceMapper implements RowMapper<ProvinceModel> {

	@Override
	public ProvinceModel mapRow(ResultSet rs) {
		ProvinceModel provinceModel = new ProvinceModel();
		try {
			provinceModel.setId(rs.getLong("id"));
			provinceModel.setName(rs.getString("name"));
			provinceModel.setType(rs.getString("type"));
			return provinceModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
