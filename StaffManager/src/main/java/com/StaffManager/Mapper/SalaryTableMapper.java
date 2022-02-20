package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.SalaryTableModel;

public class SalaryTableMapper implements RowMapper<SalaryTableModel> {
	@Override
	public SalaryTableModel mapRow(ResultSet rs) {

		SalaryTableModel salaryTableModel = new SalaryTableModel();
		try {
			salaryTableModel.setId(rs.getLong("id"));
			salaryTableModel.setFullName(rs.getString("full_name"));
			salaryTableModel.setStaffId(rs.getLong("staff_id"));;
			salaryTableModel.setPositionId(rs.getLong("position_id"));
			salaryTableModel.setPeriodId(rs.getLong("period_id"));
			salaryTableModel.setTypeId(rs.getLong("type_id"));
			salaryTableModel.setWorkDay(rs.getFloat("work_day"));
			salaryTableModel.setOvertime(rs.getFloat("overtime"));
			salaryTableModel.setBonus(rs.getLong("bonus"));
			salaryTableModel.setPunish(rs.getLong("punish"));
			salaryTableModel.setAdvance(rs.getLong("advance"));
			salaryTableModel.setInsurance(rs.getLong("insurance"));
			salaryTableModel.setTax(rs.getLong("tax"));
			salaryTableModel.setTotal(rs.getLong("total"));
			salaryTableModel.setSettlement(rs.getInt("settlement"));
			salaryTableModel.setUpdateAt(rs.getTimestamp("update_at"));
			salaryTableModel.setUpdateBy(rs.getLong("update_by"));
			return salaryTableModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
