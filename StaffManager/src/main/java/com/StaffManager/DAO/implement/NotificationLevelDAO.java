package com.StaffManager.DAO.implement;

import java.util.List;

import com.StaffManager.DAO.INotificationLevelDAO;
import com.StaffManager.Mapper.NotificationLevelMapper;
import com.StaffManager.Model.NotificationLevelModel;

public class NotificationLevelDAO extends AbstractDAO<NotificationLevelModel> implements INotificationLevelDAO{

	@Override
	public List<NotificationLevelModel> getList() {
		String sql = "select * from level_notification;" ; 
		return queryGetList(sql, new NotificationLevelMapper());	
	} 
}
