package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.StaffModel;

public class StaffMapper implements RowMapper<StaffModel> {
	
	@Override
	public StaffModel mapRow(ResultSet rs) {
		StaffModel staffModel = new StaffModel();
		try {
			staffModel.setId(rs.getLong("id"));
			staffModel.setFullName(rs.getString("full_name"));
			staffModel.setDateOfBirth(rs.getDate("dateofbirth"));
			staffModel.setSex(rs.getInt("sex"));
			staffModel.setPosition(rs.getLong("position"));
			staffModel.setEmailAddress(rs.getString("email_address"));
			staffModel.setPhone(rs.getString("phone"));
			staffModel.setStory(rs.getString("story"));
			staffModel.setBeginWork(rs.getDate("begin_work"));
			staffModel.setFinishWork(rs.getDate("finish_work"));
			staffModel.setSexName((rs.getInt("sex")==1)?"Nam":(rs.getInt("sex")==2)?"Nữ":"Khác");
			staffModel.setCreateAt(rs.getTimestamp("create_at"));
			staffModel.setCreateBy(rs.getLong("create_by"));
			staffModel.setUpdateAt(rs.getTimestamp("update_at"));
			staffModel.setUpdateBy(rs.getLong("update_by"));
			staffModel.setDeleted(rs.getInt("deleted"));
			staffModel.setDeleteAt(rs.getTimestamp("deleted_at"));
			staffModel.setDeleteBy(rs.getLong("deleted_by"));
			staffModel.setPeopleId(rs.getString("people_id"));
			staffModel.setAddress(rs.getString("address"));
			staffModel.setHometown(rs.getLong("hometown"));
			staffModel.setBasicSalary(rs.getLong("basic_salary"));
			staffModel.setTypeSt(rs.getLong("type_id"));
			staffModel.setDependent(rs.getInt("dependent"));
			return staffModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

}
