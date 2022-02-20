package com.StaffManager.DAO.implement;

import java.util.List;

import com.StaffManager.DAO.IStatusAccountDAO;
import com.StaffManager.Mapper.StatusAccountMapper;
import com.StaffManager.Model.StatusAccountModel;

public class StatusAccountDAO extends AbstractDAO<StatusAccountModel> implements IStatusAccountDAO{

	@Override
	public List<StatusAccountModel> getListStatus() {
		String sql="SELECT * FROM status_act;";
		return queryGetList(sql, new StatusAccountMapper());
	}

}
