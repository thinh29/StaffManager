package com.StaffManager.DAO;

import java.util.List;

import com.StaffManager.Model.TypeAccountModel;

public interface ITypeAccountDAO {
	List<TypeAccountModel> getList();
	TypeAccountModel getTypeAccountById(Long typeId);
}
