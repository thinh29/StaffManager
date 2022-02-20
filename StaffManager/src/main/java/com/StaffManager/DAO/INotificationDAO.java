package com.StaffManager.DAO;

import java.sql.Timestamp;
import java.util.List;

import com.StaffManager.Model.NotificationModel;

public interface INotificationDAO {

	public List<NotificationModel> getList(String sortName,String sortBy,  Object... objects);

	public Integer getCount(Integer i);
	
	public NotificationModel getNotificationById(Long id);

	public Boolean restoreNotification(Timestamp updateAt, Long updateBy, Long stRstId);

	public Boolean deleteNotification(Long staffId, Long delBy, Timestamp delAt);
	
	public Long insertNewNotification(Object... objects);
	
	public Long insertNotificationSend(Object... objects);

	public Boolean updateNotification(Object... objects);

	public List<NotificationModel> getAllNotification(int del);
}
