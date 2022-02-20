package com.StaffManager.DAO;

import java.util.List;

import com.StaffManager.Model.SalaryPeriodModel;

public interface ISalaryPeriodDAO {

	Boolean isEmptyPeriod(String name);

	Long insertNewPeriod(Object...objects);

	List<SalaryPeriodModel> getList();

}
