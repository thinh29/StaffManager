package com.StaffManager.DAO.implement;

import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.ITypeStaffDAO;
import com.StaffManager.Mapper.TypeStaffMapper;
import com.StaffManager.Model.TypeStaffModel;

public class TypeStaffDAO extends AbstractDAO<TypeStaffModel> implements ITypeStaffDAO {

	@Override
	public List<TypeStaffModel> getList() {
		List<TypeStaffModel> listRs = new ArrayList<TypeStaffModel>();
		String sql = "SELECT * FROM type_st;";
		listRs= queryGetList(sql, new TypeStaffMapper());
		return listRs.isEmpty()?null:listRs;
	}

}
