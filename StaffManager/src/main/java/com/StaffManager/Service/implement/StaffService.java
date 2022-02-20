package com.StaffManager.Service.implement;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.IAccountDAO;
import com.StaffManager.DAO.IStaffDAO;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Service.IStaffService;

public class StaffService implements IStaffService {
	@Inject
	private IStaffDAO staffDAO;
	@Inject
	private IAccountDAO accountDAO;

	@Override
	public List<StaffModel> getList(Integer page, Integer maxPageItem, int i, String sortName, String sortBy) {
		int start = (page - 1) * maxPageItem;
		return staffDAO.getList(sortName, sortBy, i, start, maxPageItem);
	}

	@Override
	public List<StaffModel> getListSearch(Integer page, Integer maxPageItem, int i, String name, String s,
			String sortName, String sortBy) {
		int start = (page - 1) * maxPageItem;
		return staffDAO.getListSearch(name, s, sortName, sortBy, i, start, maxPageItem);
	}

	@Override
	public StaffModel getStaffById(Long id) {
		return staffDAO.getStaffById(id);
	}

	@Override
	public Long insertNewStaff(StaffModel staffModel, Long createBy) {
		String fullName = staffModel.getFullName();
		Date dateOfBirth = staffModel.getDateOfBirth();
		Integer sex = staffModel.getSex();
		Long position = staffModel.getPosition();
		String peopleId = staffModel.getPeopleId();
		String emailAddress = staffModel.getEmailAddress();
		String address = staffModel.getAddress();
		Long hometown = staffModel.getHometown();
		String phone = staffModel.getPhone();
		Date beginWork = staffModel.getBeginWork();
		Long basicSalary = staffModel.getBasicSalary();
		Long typeSt = staffModel.getTypeSt();
		Integer dependent = staffModel.getDependent();
		Timestamp createAt = new Timestamp(System.currentTimeMillis());
		return staffDAO.insertNewStaff(fullName, dateOfBirth, sex, position, peopleId, address, hometown, emailAddress,
				phone, beginWork, basicSalary, typeSt, dependent, createAt, createBy, 0);
	}

	@Override
	public Boolean updateStaff(StaffModel staffModel, Long udBy) {
		Long staffId = staffModel.getId();
		String fullName = staffModel.getFullName();
		Date dateOfBirth = staffModel.getDateOfBirth();
		Integer sex = staffModel.getSex();
		Long position = staffModel.getPosition();
		String peopleId = staffModel.getPeopleId();
		String emailAddress = staffModel.getEmailAddress();
		String address = staffModel.getAddress();
		Long hometown = staffModel.getHometown();
		String phone = staffModel.getPhone();
		Date beginWork = staffModel.getBeginWork();
		Long basicSalary = staffModel.getBasicSalary();
		Long typeSt = staffModel.getTypeSt();
		Integer dependent = staffModel.getDependent();
		Timestamp updateAt = new Timestamp(System.currentTimeMillis());
		accountDAO.updateFullNameAccount(fullName, staffId);
		return staffDAO.updateStaff(fullName, dateOfBirth, sex, position, peopleId, address, hometown, emailAddress,
				phone, beginWork, basicSalary, typeSt, dependent, updateAt, udBy, staffId, 0);
	}

	@Override
	public Boolean deleteStaff(StaffModel staff, Long delBy) {
		Long staffId = staff.getId();
		Date finishWork = staff.getFinishWork();
		Timestamp delAt = new Timestamp(System.currentTimeMillis());
		accountDAO.deleteAccountByStaff(staffId, delBy, delAt);
		return staffDAO.deleteStaff(finishWork, staffId, delBy, delAt);

	}

	@Override
	public Boolean restoreStaff(Long stRstId, Long rstBy) {
		Timestamp updateAt = new Timestamp(System.currentTimeMillis());
		// TODO Auto-generated method stub
		return staffDAO.restoreStaff(updateAt, rstBy, stRstId);
	}

	@Override
	public Integer getTotalPage(Integer maxPageItem, Integer i) {
		Integer items = staffDAO.getCount(i);
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}

	@Override
	public Integer getTotalPageS(Integer maxPageItem, int i, String s) {
		Integer items = staffDAO.getCountS(i, s);
		Integer surplus = (items > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}

	@Override
	public List<StaffModel> getListAll(int del) {
		return staffDAO.getListAll(del);
	}

	@Override
	public Boolean updateStaffFromStaff(StaffModel staffModel, Long udBy) {
		Long staffId = staffModel.getId();
		String fullName = staffModel.getFullName();
		String address = staffModel.getAddress();
		String phone = staffModel.getPhone();
		String story = staffModel.getStory();
		Timestamp updateAt = new Timestamp(System.currentTimeMillis());
		return staffDAO.updateStaffFromStaff(fullName, address, phone, story, updateAt, udBy, staffId, 0);
	}
	@Override
	public List<StaffModel> getListStaffVu() {
		return staffDAO.getListStaffVu();
	}
}
