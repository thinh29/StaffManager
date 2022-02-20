package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.ProvinceModel;

public interface IProvinceService {
	public List<ProvinceModel> getList() ;

	public ProvinceModel getProvinceById(Long position);
}
