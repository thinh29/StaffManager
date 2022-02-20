package com.StaffManager.Service.implement;

import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.IStatusAccountDAO;
import com.StaffManager.DAO.implement.StatusAccountDAO;
import com.StaffManager.Model.StatusAccountModel;
import com.StaffManager.Service.IStatusAccountService;

public class StatusAccountService implements IStatusAccountService{

	@Inject
	private IStatusAccountDAO statusAccountDAO=new StatusAccountDAO();
	@Override
	public List<StatusAccountModel> getListStatus() {
		return statusAccountDAO.getListStatus();
	}

}
