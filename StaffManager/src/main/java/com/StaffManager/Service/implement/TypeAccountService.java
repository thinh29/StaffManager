package com.StaffManager.Service.implement;

import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.ITypeAccountDAO;
import com.StaffManager.Model.TypeAccountModel;
import com.StaffManager.Service.ITypeAccountService;

public class TypeAccountService implements ITypeAccountService {
@Inject
private ITypeAccountDAO typeAccountDAO;
	@Override
	public List<TypeAccountModel> getList() {
		
		return typeAccountDAO.getList();
	}

	@Override
	public TypeAccountModel getTypeAccountById(Long typeId) {
		return typeAccountDAO.getTypeAccountById(typeId);
	}

}
