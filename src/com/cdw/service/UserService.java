package com.cdw.service;

import org.apache.ibatis.annotations.Param;

import com.cdw.entity.User;

/**
 * 用户service接口
 * @author dongwei
 * @date 2017年11月16日
 */
public interface UserService {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User login(User user);
}
