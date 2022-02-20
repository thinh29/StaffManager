package com.StaffManager.DAO;

import java.util.List;

import com.StaffManager.Model.ProvinceModel;

public interface IProvinceDAO {
	public List<ProvinceModel> getList();

	public ProvinceModel getProvinceById(Long position);
	}
