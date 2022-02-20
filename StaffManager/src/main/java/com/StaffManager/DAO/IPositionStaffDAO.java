package com.StaffManager.DAO;

import java.util.List;

import com.StaffManager.Model.PositionStaffModel;

public interface IPositionStaffDAO {
	public List<PositionStaffModel> getList();

	public PositionStaffModel getPositionById(Long position);
	}
