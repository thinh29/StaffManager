package com.StaffManager.DAO.implement;

import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.ISalaryPeriodDAO;
import com.StaffManager.Mapper.SalaryPeriodMapper;
import com.StaffManager.Model.SalaryPeriodModel;

public class SalaryPeriodDAO extends AbstractDAO<SalaryPeriodModel> implements ISalaryPeriodDAO{

	@Override
	public Boolean isEmptyPeriod(String name) {
		List<SalaryPeriodModel> listRS = new ArrayList<SalaryPeriodModel>();
		String sql ="SELECT * FROM salary_period WHERE name = ?;";
		listRS = queryGetList(sql, new SalaryPeriodMapper(), name);
		return listRS.isEmpty()?true:false;
	}

	@Override
	public Long insertNewPeriod(Object... objects) {
		String sql ="INSERT INTO salary_period SET name = ? , month = ?, year = ?, create_at = ?, create_by = ?;";
		return insert(sql, objects);
	}

	@Override
	public List<SalaryPeriodModel> getList() {
		List<SalaryPeriodModel> listRS = new ArrayList<SalaryPeriodModel>();
		String sql ="SELECT * FROM salary_period";
		listRS = queryGetList(sql, new SalaryPeriodMapper());
		return listRS.isEmpty()?null:listRS;
	}

}
