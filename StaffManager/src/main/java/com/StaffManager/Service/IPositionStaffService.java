package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.PositionStaffModel;

public interface IPositionStaffService {
	public List<PositionStaffModel> getList() ;

	public PositionStaffModel getPositionById(Long position);
}
