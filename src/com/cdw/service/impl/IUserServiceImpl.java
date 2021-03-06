package com.cdw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cdw.dao.UserDao;
import com.cdw.entity.UserModel;
import com.cdw.service.UserService;

/**
 * userService实现类
 * @author dongwei
 * @date 2017年11月16日
 */
@Service("UserService")
@Transactional
public class IUserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public UserModel login(UserModel user) {
		return userDao.login(user);
	}

	@Override
	public List<UserModel> getUserList(String userName, String roleType, int start, int size) {
		return userDao.getUserList(userName, roleType, start, size);
	}

	@Override
	public Long getTotal(String userName, String roleType, int start, int size) {
		return userDao.getTotal(userName, roleType, start, size);
	}

	@Override
	public int addUser(UserModel user) {
		return userDao.addUser(user);
	}

	@Override
	public int updateUser(UserModel user) {
		return userDao.updateUser(user);
	}

	@Override
	public int deleteUser(List<Integer> id) {
		return userDao.deleteUser(id);
	}
}
