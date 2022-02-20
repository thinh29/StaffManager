package com.StaffManager.Service.implement;

import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.IPositionStaffDAO;
import com.StaffManager.Model.PositionStaffModel;
import com.StaffManager.Service.IPositionStaffService;

public class PositionStaffService implements IPositionStaffService {
	@Inject
	private IPositionStaffDAO positionStaffDAO;
	@Override
	public List<PositionStaffModel> getList() {
		return positionStaffDAO.getList();
	}
	@Override
	public PositionStaffModel getPositionById(Long position) {
		
		return positionStaffDAO.getPositionById(position);
	}

}
