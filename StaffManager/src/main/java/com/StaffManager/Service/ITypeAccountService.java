package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.TypeAccountModel;

public interface ITypeAccountService {
	public List<TypeAccountModel> getList() ;

	public TypeAccountModel getTypeAccountById(Long typeId);
}
