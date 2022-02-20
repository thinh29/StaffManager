package com.StaffManager.DAO.implement;

import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.IProvinceDAO;
import com.StaffManager.Mapper.ProvinceMapper;
import com.StaffManager.Model.ProvinceModel;

public class ProvinceDAO extends AbstractDAO<ProvinceModel> implements IProvinceDAO {

	@Override
	public List<ProvinceModel> getList() {
		List<ProvinceModel> listPst = new ArrayList<ProvinceModel>();
		String sql ="SELECT * FROM province;";
		listPst = queryGetList(sql, new ProvinceMapper());
		return listPst;
	}

	@Override
	public ProvinceModel getProvinceById(Long position) {
		
		List<ProvinceModel> listPst = new ArrayList<ProvinceModel>();
		String sql ="SELECT * FROM province WHERE id = ?;";
		listPst = queryGetList(sql, new ProvinceMapper(),position);
		return listPst.isEmpty()?null:listPst.get(0);
	}

}
