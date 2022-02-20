package com.StaffManager.Service.implement;

import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.INotificationLevelDAO;
import com.StaffManager.Model.NotificationLevelModel;
import com.StaffManager.Service.INotificationLevelService;

public class NotificationLevelService implements INotificationLevelService {

	@Inject
	private INotificationLevelDAO notificationLevelDAO;

	@Override
	public List<NotificationLevelModel> getList() {
		// TODO Auto-generated method stub
		return notificationLevelDAO.getList();
	}

}
