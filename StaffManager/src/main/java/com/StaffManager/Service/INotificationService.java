package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.NotificationModel;

public interface INotificationService {
	List<NotificationModel> getList(Integer page, Integer maxPageItem, int i, String sortBy, String sortName);

	Integer getTotalPage(Integer maxPageItem, Integer i);

	Boolean deleteNotification(NotificationModel noti, Long delBy);

	Boolean restoreNotification(Long stRstId, Long rstBy);
	
	NotificationModel getNotificationById(Long id);

	Long insertNewNotification(NotificationModel notificationModel, Long idStatus, Long createBy);
	
	Boolean updateNotification(NotificationModel notificationModel, Long udBy);

	public List<NotificationModel> getAllNotification(int del);
}
