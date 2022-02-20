package com.StaffManager.Service.implement;

import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.ITypeStaffDAO;
import com.StaffManager.Model.TypeStaffModel;
import com.StaffManager.Service.ITypeStaffService;

public class TypeStaffService implements ITypeStaffService {
	@Inject
	private ITypeStaffDAO typeStaffDAO;

	@Override
	public List<TypeStaffModel> getList() {
		// TODO Auto-generated method stub
		return typeStaffDAO.getList();
	}

}
