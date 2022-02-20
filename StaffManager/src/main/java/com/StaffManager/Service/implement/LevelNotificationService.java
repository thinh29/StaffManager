package com.StaffManager.Service.implement;

import javax.inject.Inject;

import com.StaffManager.DAO.ILevelNotificationDAO;
import com.StaffManager.Model.LevelNotificationModel;
import com.StaffManager.Service.ILevelNotificationService;

public class LevelNotificationService implements ILevelNotificationService{

	@Inject
	private ILevelNotificationDAO levelNotificationDAO;
	@Override
	public LevelNotificationModel getLevelNotificationById(long id) {
		return levelNotificationDAO.getLevelNotificationById(id);
	}
	
}
