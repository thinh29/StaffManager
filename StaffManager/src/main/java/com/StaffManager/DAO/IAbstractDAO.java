package com.StaffManager.DAO;

import java.util.List;

import com.StaffManager.Mapper.RowMapper;

public interface IAbstractDAO<T> {
	@SuppressWarnings("hiding")
	public <T> List<T> queryGetList(String sql, RowMapper<T> rowMapper, Object... objects );
}
