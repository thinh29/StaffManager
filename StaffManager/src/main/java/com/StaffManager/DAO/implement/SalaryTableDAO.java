package com.StaffManager.DAO.implement;

import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.ISalaryTableDAO;
import com.StaffManager.Mapper.SalaryTableMapper;
import com.StaffManager.Model.SalaryTableModel;
import com.StaffManager.Model.StaffModel;

public class SalaryTableDAO extends AbstractDAO<SalaryTableModel> implements ISalaryTableDAO {

	@Override
	public Long insertListNew(List<StaffModel> listStaffModel, Long idPeriod) {
		StringBuilder sql = new StringBuilder("INSERT INTO salary_table ");
		sql.append("(full_name, staff_id, position_id, period_id, type_id) VALUES ");
		for (int i = 0; i < listStaffModel.size(); i++) {
			if(i==listStaffModel.size()-1) {
				sql.append("('"+listStaffModel.get(i).getFullName()+"', ");
				sql.append(listStaffModel.get(i).getId()+", ");
				sql.append(listStaffModel.get(i).getPosition()+", ");
				sql.append(idPeriod+", ");
				sql.append(listStaffModel.get(i).getTypeSt()+");");
			}else {
				sql.append("('"+listStaffModel.get(i).getFullName()+"', ");
				sql.append(listStaffModel.get(i).getId()+", ");
				sql.append(listStaffModel.get(i).getPosition()+", ");
				sql.append(idPeriod+", ");
				sql.append(listStaffModel.get(i).getTypeSt()+"), ");
			}
		}
		return insert(sql.toString());
	}

	@Override
	public List<SalaryTableModel> getList(String sortName, String sortBy, Object... objects) {
		String sql = "SELECT * FROM salary_table ORDER BY " + sortName + " " + sortBy + " LIMIT ?, ?;";
		List<SalaryTableModel> listRS = new ArrayList<SalaryTableModel>();
		listRS = queryGetList(sql, new SalaryTableMapper(), objects);
		return listRS.isEmpty()?null:listRS;
	}

	@Override
	public Integer getCount() {
		String sql = "SELECT count(*) FROM salary_table;";
		return count(sql);
	}

	@Override
	public List<SalaryTableModel> getListByOption(String sortName, String sortBy, String option, Object... objects) {
		// String string, String sortName, String sortBy, int start, Integer maxPageItem
		List<SalaryTableModel> listRS = new ArrayList<SalaryTableModel>();
		String sql = "SELECT * FROM salary_table "+option+" ORDER BY "+sortName+" "+sortBy+" LIMIT ?, ?;";
		listRS = queryGetList(sql, new SalaryTableMapper(), objects);
		return listRS.isEmpty()?null:listRS;
	}

	@Override
	public Integer getCountByOption(String string) {
		String sql = "SELECT count(*) FROM salary_table "+string+";";
		return count(sql);
	}

	@Override
	public List<SalaryTableModel> getListSearch(String s, String sortName, String sortBy,Object...objects) {
		String sql = "SELECT * FROM salary_table WHERE full_name LIKE '%"+s+"%' ORDER BY " + sortName + " " + sortBy + " LIMIT ?, ?;";
		List<SalaryTableModel> listRS = new ArrayList<SalaryTableModel>();
		listRS = queryGetList(sql, new SalaryTableMapper(), objects);
		return listRS.isEmpty()?null:listRS;
	}

	@Override
	public Integer getCountSearch(String s) {
		String sql = "SELECT count(*) FROM salary_table WHERE full_name LIKE '%"+s+"%' ;";
		return count(sql);
	}

	@Override
	public SalaryTableModel getSalaryTableById(Long salaryTableID) {
		List<SalaryTableModel> listRs = new ArrayList<SalaryTableModel>();
		String sql = "SELECT * FROM salary_table WHERE id = ?;";
		listRs = queryGetList(sql, new SalaryTableMapper(), salaryTableID);
		return listRs.isEmpty()?null:listRs.get(0);
	}

	@Override
	public Boolean updateSalaryTable(Object... objects) {
//		Float workDay, Float overtime, Long bonus, Long punish, Long advance, Long insurance,
//		Long tax, Long total, Timestamp upAt, Long upBy, Long id
		StringBuilder sql = new StringBuilder("UPDATE salary_table ");
		sql.append("SET work_day = ?, ");
		sql.append("overtime = ?, ");
		sql.append("bonus = ?, ");
		sql.append("punish = ?, ");
		sql.append("advance = ?, ");
		sql.append("insurance = ?, ");
		sql.append("tax = ?, ");
		sql.append("total = ?, ");
		sql.append("settlement = ?, ");
		sql.append("update_at = ?, ");
		sql.append("update_by = ? ");
		sql.append("WHERE id = ? ;");
		return update(sql.toString(), objects);
	}

}
