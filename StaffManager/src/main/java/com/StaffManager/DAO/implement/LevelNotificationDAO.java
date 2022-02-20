package com.StaffManager.DAO.implement;

import java.util.List;

import com.StaffManager.DAO.ILevelNotificationDAO;
import com.StaffManager.Mapper.LevelNotificationMapper;
import com.StaffManager.Model.LevelNotificationModel;

public class LevelNotificationDAO extends AbstractDAO<LevelNotificationModel> implements ILevelNotificationDAO{

	@Override
	public LevelNotificationModel getLevelNotificationById(long id) {
		String sql="SELECT * FROM level_notification WHERE id = ?;";
		List<LevelNotificationModel>lists=queryGetList(sql, new LevelNotificationMapper(), id);
		return lists.isEmpty() ? null : lists.get(0);
	}

}
