package com.StaffManager.Service.implement;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.ISalaryPeriodDAO;
import com.StaffManager.Model.SalaryPeriodModel;
import com.StaffManager.Service.ISalaryPeriodService;

public class SalaryPeriodService implements ISalaryPeriodService {
	@Inject private ISalaryPeriodDAO salaryPeriodDAO;

	@Override
	public Boolean isEmptyPeriod(String salaryPeriod) {
		return salaryPeriodDAO.isEmptyPeriod(salaryPeriod);
	}

	@Override
	public Long insertNewPeriod(String salaryPeriod, Long addID) {
		String month = salaryPeriod.split("-")[1];
		String year =  salaryPeriod.split("-")[0];
		Timestamp createAt = new Timestamp(System.currentTimeMillis()); 
		
		return salaryPeriodDAO.insertNewPeriod(salaryPeriod,month, year, createAt, addID);
	}

	@Override
	public List<SalaryPeriodModel> getList() {
		
		return salaryPeriodDAO.getList();
	}

}
