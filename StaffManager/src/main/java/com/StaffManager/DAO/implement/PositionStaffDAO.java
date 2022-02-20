package com.StaffManager.DAO.implement;

import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.IPositionStaffDAO;
import com.StaffManager.Mapper.PositionStaffMapper;
import com.StaffManager.Model.PositionStaffModel;

public class PositionStaffDAO extends AbstractDAO<PositionStaffModel> implements IPositionStaffDAO {

	@Override
	public List<PositionStaffModel> getList() {
		List<PositionStaffModel> listPst = new ArrayList<PositionStaffModel>();
		String sql ="SELECT * FROM position_staff;";
		listPst = queryGetList(sql, new PositionStaffMapper());
		return listPst;
	}

	@Override
	public PositionStaffModel getPositionById(Long position) {
		
		List<PositionStaffModel> listPst = new ArrayList<PositionStaffModel>();
		String sql ="SELECT * FROM position_staff WHERE id = ?;";
		listPst = queryGetList(sql, new PositionStaffMapper(),position);
		return listPst.isEmpty()?null:listPst.get(0);
	}

}
