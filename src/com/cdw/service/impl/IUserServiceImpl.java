package com.cdw.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cdw.dao.UserDao;
import com.cdw.entity.User;
import com.cdw.service.UserService;

/**
 * userService实现类
 * @author dongwei
 * @date 2017年11月16日
 */
@Service("UserService")
@Transactional
public class IUserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public List<User> getUserList(Map<String, Object> map) {
		return userDao.getUserList(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return userDao.getTotal(map);
	}
}
