package com.StaffManager.Service.implement;

import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.IProvinceDAO;
import com.StaffManager.Model.ProvinceModel;
import com.StaffManager.Service.IProvinceService;

public class ProvinceService implements IProvinceService {
	@Inject
	private IProvinceDAO provinceDAO;
	@Override
	public List<ProvinceModel> getList() {
		return provinceDAO.getList();
	}
	@Override
	public ProvinceModel getProvinceById(Long position) {
		
		return provinceDAO.getProvinceById(position);
	}

}
