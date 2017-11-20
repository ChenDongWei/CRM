package com.cdw.dao;

import java.util.List;
import java.util.Map;

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
	
	/**
	 * 查询用户列表数据
	 * @param map
	 * @return
	 */
	public List<User> getUserList(@Param("map")Map<String, Object> map);
	
	/**
	 * 获取用户数据总数
	 * @param map
	 * @return
	 */
	public Long getTotal(@Param("map")Map<String, Object> map);
}
