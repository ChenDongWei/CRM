package com.cdw.dao;

import org.apache.ibatis.annotations.Param;

import com.cdw.entity.User;

/**
 * 用户dao接口
 * @author dongwei
 * @date 2017年11月16日
 */
public interface UserDao {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User login(@Param("user")User user);
}
