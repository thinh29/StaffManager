package com.StaffManager.Service.implement;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.INotificationDAO;
import com.StaffManager.Model.NotificationModel;
import com.StaffManager.Service.INotificationService;

public class NotificationService implements INotificationService {
	@Inject
	private INotificationDAO notificationDAO;

	@Override
	public List<NotificationModel> getList(Integer page, Integer maxPageItem, int i, String sortBy, String sortName) {
		// TODO Auto-generated method stub
		int start = (page - 1) * maxPageItem;
		return notificationDAO.getList( sortName,sortBy, i, start, maxPageItem);
	}
	@Override
	public Integer getTotalPage(Integer maxPageItem, Integer i) {
		Integer items = notificationDAO.getCount(i);
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}
	@Override
	public Boolean deleteNotification(NotificationModel noti, Long delBy) {
		Long notiId = noti.getId();
		Timestamp delAt = new Timestamp(System.currentTimeMillis());
		return notificationDAO.deleteNotification( notiId, delBy, delAt);
	}
	@Override
	public List<NotificationModel> getAllNotification(int del) {
		return notificationDAO.getAllNotification(del);
	}
	
	@Override
	public Boolean restoreNotification(Long stRstId, Long rstBy) {
		Timestamp updateAt = new Timestamp(System.currentTimeMillis());
		// TODO Auto-generated method stub
		return notificationDAO.restoreNotification(updateAt, rstBy, stRstId);
	}
	@Override
	public NotificationModel getNotificationById(Long id) {
		return notificationDAO.getNotificationById(id);
	}
	@Override
	public Long insertNewNotification(NotificationModel notificationModel, Long idStatus, Long createBy) {
		//Long level = notificationModel.getLevel();
		String title = notificationModel.getTitle();
		String content = notificationModel.getContent();
		Timestamp createAt = new Timestamp(System.currentTimeMillis());
		return notificationDAO.insertNewNotification(title, content, idStatus, createAt, createBy, 0);
	}
	@Override
	public Boolean updateNotification(NotificationModel notificationModel, Long udBy) {
		Long level = notificationModel.getLevel();
		String title = notificationModel.getTitle();
		Long notiId = notificationModel.getId();
		String content = notificationModel.getContent();
		Timestamp updateAt = new Timestamp(System.currentTimeMillis());
		return notificationDAO.updateNotification(title, content, level, updateAt, udBy, notiId, 0);
	}
}
