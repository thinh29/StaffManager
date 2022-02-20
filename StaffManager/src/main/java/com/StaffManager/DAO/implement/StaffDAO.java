package com.StaffManager.DAO.implement;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.IStaffDAO;
import com.StaffManager.Mapper.StaffMapper;
import com.StaffManager.Model.StaffModel;

public class StaffDAO extends AbstractDAO<StaffModel> implements IStaffDAO {

	@Override
	public List<StaffModel> getList(String sortName, String sortBy, Object... objects) {
		List<StaffModel> listResult = new ArrayList<StaffModel>();
		String sql = "SELECT * FROM staffs WHERE deleted = ? ORDER BY " + sortName + " " + sortBy + " LIMIT ?, ?;";
		listResult = queryGetList(sql, new StaffMapper(), objects);
		return listResult.isEmpty() ? null : listResult;
	}

	public List<StaffModel> getListSearch(String tbName, String s, String sortBy, String sortName, Object... objects) {
		List<StaffModel> listResult = new ArrayList<StaffModel>();
		String sql = "SELECT * FROM staffs WHERE deleted = ? AND " + tbName + " LIKE '%" + s + "%' ORDER BY " + sortBy
				+ " " + sortName + " LIMIT ?, ?;";
		listResult = queryGetList(sql, new StaffMapper(), objects);
		return listResult.isEmpty() ? null : listResult;
	}

	@Override
	public StaffModel getStaffById(Long id) {
		List<StaffModel> listResults = new ArrayList<StaffModel>();
		String sql = "SELECT * FROM Staffs WHERE id = ? ;";
		listResults = queryGetList(sql, new StaffMapper(), id);
		return listResults.isEmpty() ? null : listResults.get(0);
	}

	@Override
	public Integer getCount(Integer i) {
		String sql = "SELECT count(*) FROM staffs WHERE deleted = ?;";
		return count(sql, i);
	}

	@Override
	public Integer getCountS(int i, String s) {
		String sql = "SELECT count(*) FROM staffs WHERE deleted = ? AND full_name LIKE '%" + s + "%';";
		return count(sql, i);
	}

	@Override
	public Long insertNewStaff(Object... objects) {
		Long lastID = null;
		StringBuilder sql = new StringBuilder(
				"INSERT INTO staffs (full_name, dateofbirth, sex, position, people_id, address, hometown, email_address, phone, begin_work,basic_salary,type_id, dependent, create_at, create_by, deleted) ");
		sql.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
		lastID = insert(sql.toString(), objects);
		return lastID;
	}

	@Override
	public Boolean updateStaff(Object... objects) {
		StringBuilder sql = new StringBuilder("UPDATE staffs ");
		sql.append("SET full_name = ?, ");
		sql.append("dateofbirth = ?, ");
		sql.append("sex = ?, ");
		sql.append("position = ?, ");
		sql.append("people_id = ?, ");
		sql.append("address = ?, ");
		sql.append("hometown = ?, ");
		sql.append("email_address = ?, ");
		sql.append("phone = ?, ");
		sql.append("begin_work = ?, ");
		sql.append("basic_salary = ?, ");
		sql.append("type_id = ?, ");
		sql.append("dependent = ?, ");
		sql.append("update_at = ?, ");
		sql.append("update_by = ? ");
		sql.append("WHERE id = ? AND deleted = ?;");
		return update(sql.toString(), objects);

	}

	@Override
	public Boolean deleteStaff(Date finishWork, Long staffId, Long delBy, Timestamp delAt) {
		StringBuilder sql = new StringBuilder("UPDATE staffs ");
		sql.append("SET deleted = 1, ");
		sql.append("deleted_at = ?, ");
		sql.append("finish_work = ?, ");
		sql.append("deleted_by = ? ");
		sql.append("WHERE id = ?;");
		return update(sql.toString(), delAt, finishWork, delBy, staffId);
	}

	@Override
	public Boolean restoreStaff(Timestamp updateAt, Long updateBy, Long stRstId) {
		StringBuilder sql = new StringBuilder("UPDATE staffs ");
		sql.append("SET deleted = 0, ");
		sql.append("deleted_at = null, ");
		sql.append("deleted_by = null, ");
		sql.append("finish_work = null, ");
		sql.append("update_at = ?, ");
		sql.append("update_by = ? ");
		sql.append("WHERE id = ?;");
		return update(sql.toString(), updateAt, updateBy, stRstId);
	}

	@Override
	public List<StaffModel> getListAll(Object... objects) {
		List<StaffModel> listRs = new ArrayList<StaffModel>();
		String sql = "SELECT * FROM Staffs WHERE deleted = ?;";
		listRs = queryGetList(sql, new StaffMapper(), objects);
		return listRs.isEmpty() ? null : listRs;
	}

	@Override
	public Boolean updateStaffFromStaff(Object... objects) {
		// TODO Auto-generated method stub String fullName, String address, String phone, Timestamp updateAt, Long udBy,Long staffId, int i
		StringBuilder sql = new StringBuilder("UPDATE staffs ");
		sql.append("SET full_name = ?, ");	
		sql.append("address = ?, ");	
		sql.append("phone = ?, ");
		sql.append("story = ?, ");		
		sql.append("update_at = ?, ");
		sql.append("update_by = ? ");
		sql.append("WHERE id = ? AND deleted = ?;");
		return update(sql.toString(), objects);

	}

	@Override
	public List<StaffModel> getListStaffVu() {
		String sql="SELECT * FROM staffs";
		return queryGetList(sql, new StaffMapper());
	}

}
