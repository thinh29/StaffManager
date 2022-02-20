package com.StaffManager.Service.implement;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.ISalaryTableDAO;
import com.StaffManager.Model.SalaryTableModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Service.ISalaryTableService;

public class SalaryTableService implements ISalaryTableService {
	@Inject
	private ISalaryTableDAO salaryTableDAO;

	@Override
	public Long insertListNew(List<StaffModel> listStaffModel, Long idPeriod) {

		return salaryTableDAO.insertListNew(listStaffModel, idPeriod);
	}

	@Override
	public List<SalaryTableModel> getList(Integer page, Integer maxPageItem, String sortName, String sortBy) {
		int start = (page - 1) * maxPageItem;
		return salaryTableDAO.getList(sortName, sortBy, start, maxPageItem);
	}

	@Override
	public Integer getTotalPage(Integer maxPageItem) {
		Integer items = salaryTableDAO.getCount();
		items = (items==0)?1:items;
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;

	}

	@Override
	public List<SalaryTableModel> getListByOption(Integer page, Integer maxPageItem, String sortName, String sortBy,
			String slrPeriodSort, String typeStaff) {
		int start = (page - 1) * maxPageItem;
		StringBuilder option = new StringBuilder("");
		if (!slrPeriodSort.equals("") && !typeStaff.equals("")) {
			option.append("WHERE period_id = " + slrPeriodSort + " AND type_id = " + typeStaff + " ");
		} else if (!slrPeriodSort.equals("") && typeStaff.equals("")) {
			option.append("WHERE period_id = " + slrPeriodSort + " ");
		} else if (slrPeriodSort.equals("") && !typeStaff.equals("")) {
			option.append("WHERE type_id = " + typeStaff + " ");
		}
		return salaryTableDAO.getListByOption(sortName, sortBy, option.toString(), start, maxPageItem);
	}

	@Override
	public Integer getTotalPageByOption(Integer maxPageItem, String slrPeriodSort, String typeStaff) {
		StringBuilder option = new StringBuilder("");
		if (!slrPeriodSort.equals("") && !typeStaff.equals("")) {
			option.append("WHERE period_id = " + slrPeriodSort + " AND type_id = " + typeStaff + " ");
		} else if (!slrPeriodSort.equals("") && typeStaff.equals("")) {
			option.append("WHERE period_id = " + slrPeriodSort + " ");
		} else if (slrPeriodSort.equals("") && !typeStaff.equals("")) {
			option.append("WHERE type_id = " + typeStaff + " ");
		}
		Integer items = salaryTableDAO.getCountByOption(option.toString());
		items = (items==0)?1:items;
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}

	@Override
	public List<SalaryTableModel> getListSearch(Integer page, Integer maxPageItem, String sortName, String sortBy, String s) {
		int start = (page - 1) * maxPageItem;
		return salaryTableDAO.getListSearch(s, sortName, sortBy, start, maxPageItem);
	}

	@Override
	public Integer getTotalPageSearch(Integer maxPageItem, String s) {
		Integer items = salaryTableDAO.getCountSearch(s);
		items = (items==0)?1:items;
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}

	@Override
	public List<SalaryTableModel> getListByOptionSearch(Integer page, Integer maxPageItem, String sortName, String sortBy,
			String slrPeriodSortSearch, String typeStaffSearch, String s) {
		int start = (page - 1) * maxPageItem;
		StringBuilder option = new StringBuilder("WHERE full_name LIKE '%"+s+"%' ");
		if (!slrPeriodSortSearch.equals("") && !typeStaffSearch.equals("")) {
			option.append("AND period_id = " + slrPeriodSortSearch + " AND type_id = " + typeStaffSearch + " ");
		} else if (!slrPeriodSortSearch.equals("") && typeStaffSearch.equals("")) {
			option.append("AND period_id = " + slrPeriodSortSearch + " ");
		} else if (slrPeriodSortSearch.equals("") && !typeStaffSearch.equals("")) {
			option.append("AND type_id = " + typeStaffSearch + " ");
		}
		return salaryTableDAO.getListByOption(sortName, sortBy, option.toString(), start, maxPageItem);
	}

	@Override
	public Integer getTotalPageByOptionSearch(Integer maxPageItem, String slrPeriodSortSearch, String typeStaffSearch,
			String s) {
		StringBuilder option = new StringBuilder("WHERE full_name LIKE '%"+s+"%' ");
		if (!slrPeriodSortSearch.equals("") && !typeStaffSearch.equals("")) {
			option.append("AND period_id = " + slrPeriodSortSearch + " AND type_id = " + typeStaffSearch + " ");
		} else if (!slrPeriodSortSearch.equals("") && typeStaffSearch.equals("")) {
			option.append("AND period_id = " + slrPeriodSortSearch + " ");
		} else if (slrPeriodSortSearch.equals("") && !typeStaffSearch.equals("")) {
			option.append("AND type_id = " + typeStaffSearch + " ");
		}
		Integer items = salaryTableDAO.getCountByOption(option.toString());
		items = (items==0)?1:items;
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}

	@Override
	public SalaryTableModel getSalaryTableById(Long salaryTableID) {		
		return salaryTableDAO.getSalaryTableById(salaryTableID);
	}

	@Override
	public Boolean updateSalaryTable(SalaryTableModel salaryTableModel, Long upBy) {
		Float workDay = salaryTableModel.getWorkDay();
		Float overtime = salaryTableModel.getOvertime();
		Long bonus = salaryTableModel.getBonus();
		Long punish = salaryTableModel.getPunish();
		Long advance = salaryTableModel.getAdvance();
		Long insurance = salaryTableModel.getInsurance();
		Long tax = salaryTableModel.getTax();
		Long total = salaryTableModel.getTotal();
		Integer settlement = salaryTableModel.getSettlement();
		Timestamp upAt = new Timestamp(System.currentTimeMillis());
		Long id = salaryTableModel.getId();
		return salaryTableDAO.updateSalaryTable(workDay, overtime,bonus, punish,advance,insurance,tax,total,settlement,upAt,upBy, id);
	}

}
