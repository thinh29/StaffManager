package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.StaffModel;

public interface IStaffService {

	List<StaffModel> getList(Integer page, Integer maxPageItem, int i, String sortBy, String sortName);

	List<StaffModel> getListSearch(Integer page, Integer maxPageItem, int i, String name, String s,
			String sortName, String sortBy);

	StaffModel getStaffById(Long id);

	Long insertNewStaff(StaffModel staffModel, Long createBy);

	Boolean updateStaff(StaffModel staffModel, Long udBy);

	Boolean deleteStaff(StaffModel staffModel, Long delBy);

	Boolean restoreStaff(Long stRstId, Long rstBy);

	Integer getTotalPage(Integer maxPageItem, Integer i);

	Integer getTotalPageS(Integer maxPageItem, int i, String s);
	
	public List<StaffModel>getListStaffVu();

	List<StaffModel> getListAll(int del);

	Boolean updateStaffFromStaff(StaffModel staffModel, Long udBy);

}
