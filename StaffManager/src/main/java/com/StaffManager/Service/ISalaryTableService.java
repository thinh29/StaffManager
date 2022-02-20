package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.SalaryTableModel;
import com.StaffManager.Model.StaffModel;

public interface ISalaryTableService {

	Long insertListNew(List<StaffModel> listStaffModel, Long idPeriod);

	List<SalaryTableModel> getList(Integer page, Integer maxPageItem, String sortName, String sortBy);

	Integer getTotalPage(Integer maxPageItem);

	List<SalaryTableModel> getListByOption(Integer page, Integer maxPageItem, String sortName, String sortBy,
			String slrPeriodSort, String typeStaff);

	Integer getTotalPageByOption(Integer maxPageItem, String slrPeriodSort, String typeStaff);

	List<SalaryTableModel> getListSearch(Integer page, Integer maxPageItem, String sortName, String sortBy, String s);

	Integer getTotalPageSearch(Integer maxPageItem, String s);

	List<SalaryTableModel> getListByOptionSearch(Integer page, Integer maxPageItem, String sortName, String sortBy,
			String slrPeriodSortSearch, String typeStaffSearch, String s);

	Integer getTotalPageByOptionSearch(Integer maxPageItem, String slrPeriodSortSearch, String typeStaffSearch,
			String s);

	SalaryTableModel getSalaryTableById(Long salaryTableID);

	Boolean updateSalaryTable(SalaryTableModel salaryTableModel, Long upBy);

}
