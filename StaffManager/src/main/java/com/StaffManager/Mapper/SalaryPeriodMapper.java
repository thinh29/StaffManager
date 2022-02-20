package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.SalaryPeriodModel;

public class SalaryPeriodMapper implements RowMapper<SalaryPeriodModel> {

	@Override
	public SalaryPeriodModel mapRow(ResultSet rs) {
		SalaryPeriodModel salaryPeriodModel = new SalaryPeriodModel();
		try {
			salaryPeriodModel.setId(rs.getLong("id"));
			salaryPeriodModel.setName(rs.getString("name"));
			salaryPeriodModel.setMonth(rs.getString("month"));
			salaryPeriodModel.setYear(rs.getString("year"));
			salaryPeriodModel.setCreateAt(rs.getTimestamp("create_at"));
			salaryPeriodModel.setCreateBy(rs.getLong("create_by"));
			return salaryPeriodModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
