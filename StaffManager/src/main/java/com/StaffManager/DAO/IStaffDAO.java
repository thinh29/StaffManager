package com.StaffManager.DAO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.StaffManager.Model.StaffModel;

public interface IStaffDAO {
	public List<StaffModel> getList(String sortName,String sortBy,  Object... objects);

	public List<StaffModel> getListSearch(String tbName, String s,String sortName, String sortBy,  Object... objects);

	public StaffModel getStaffById(Long id);

	public Long insertNewStaff(Object... objects);

	public Boolean updateStaff(Object... objects);

	public Boolean deleteStaff(Date finishWork, Long staffId, Long delBy, Timestamp delAt);

	public Boolean restoreStaff(Timestamp updateAt, Long rstBy, Long stRstId);

	public Integer getCount(Integer i);

	public Integer getCountS(int i, String s);

	public List<StaffModel> getListAll(Object...object);

	public Boolean updateStaffFromStaff(Object...objects);
	
	public List<StaffModel>getListStaffVu();
}
