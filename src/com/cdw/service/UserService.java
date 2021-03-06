package com.cdw.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cdw.entity.UserModel;

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
	public UserModel login(UserModel user);
	
	/**
	 * 查询用户列表数据
	 * @param map
	 * @return
	 */
	public List<UserModel> getUserList(String userName, String roleType, int start, int size);
	
	/**
	 * 获取用户数据总数
	 * @param map
	 * @return
	 */
	public Long getTotal(String userName, String roleType, int start, int size);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public int addUser(UserModel user);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public int updateUser(UserModel user);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteUser(List<Integer> id);
}
