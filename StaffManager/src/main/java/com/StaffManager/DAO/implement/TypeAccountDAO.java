package com.StaffManager.DAO.implement;

import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.ITypeAccountDAO;
import com.StaffManager.Mapper.TypeAccountMapper;
import com.StaffManager.Model.TypeAccountModel;

public class TypeAccountDAO extends AbstractDAO<TypeAccountModel> implements ITypeAccountDAO {

	@Override
	public List<TypeAccountModel> getList() {
		List<TypeAccountModel> listRs = new ArrayList<TypeAccountModel>();
		String sql = "SELECT * FROM type_act;";
		listRs = queryGetList(sql, new TypeAccountMapper());
		return listRs.isEmpty()?null:listRs;
	}

	@Override
	public TypeAccountModel getTypeAccountById(Long typeId) {
		List<TypeAccountModel> listrs = new ArrayList<TypeAccountModel>();
		String sql="SELECT * FROM type_act WHERE id = ?;";
		listrs = queryGetList(sql, new TypeAccountMapper(), typeId);
		return listrs.isEmpty()?null:listrs.get(0);
	}

}
