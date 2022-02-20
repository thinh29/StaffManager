package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.SalaryPeriodModel;

public interface ISalaryPeriodService {

	Boolean isEmptyPeriod(String salaryPeriod);

	Long insertNewPeriod(String salaryPeriod, Long addID);

	List<SalaryPeriodModel> getList();

}
