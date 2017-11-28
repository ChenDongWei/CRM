package com.cdw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cdw.entity.UserModel;

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
	public UserModel login(@Param("user")UserModel user);
	
	/**
	 * 查询用户列表数据
	 * @param map
	 * @return
	 */
	public List<UserModel> getUserList(@Param("userName")String userName, @Param("roleType")String roleType, @Param("start")int start, @Param("size")int size);
	
	/**
	 * 获取用户数据总数
	 * @param map
	 * @return
	 */
	public Long getTotal(@Param("userName")String userName, @Param("roleType")String roleType, @Param("start")int start, @Param("size")int size);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public int addUser(@Param("user")UserModel user);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public int updateUser(@Param("user")UserModel user);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteUser(@Param("ids")List<Integer> ids);
}
