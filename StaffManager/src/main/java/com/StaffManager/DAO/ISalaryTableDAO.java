package com.StaffManager.DAO;

import java.util.List;

import com.StaffManager.Model.SalaryTableModel;
import com.StaffManager.Model.StaffModel;

public interface ISalaryTableDAO {

	Long insertListNew(List<StaffModel> listStaffModel, Long idPeriod);

	List<SalaryTableModel> getList(String sortName, String sortBy, Object...objects);

	Integer getCount();

	List<SalaryTableModel> getListByOption(String sortName, String sortBy,String option, Object...objects);

	Integer getCountByOption(String string);

	List<SalaryTableModel> getListSearch(String s, String sortName, String sortBy, Object...objects);

	Integer getCountSearch(String s);

	SalaryTableModel getSalaryTableById(Long salaryTableID);

	Boolean updateSalaryTable(Object...objects);

}
