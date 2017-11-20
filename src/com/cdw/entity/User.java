package com.cdw.entity;

import java.io.Serializable;

/**
 * 用户实体
 * 
 * @author dongwei
 * @date 2017年11月15日
 */
public class User implements Serializable {
	private static final long serialVersionUID = 1856516507510488431L;

	private Integer id;// 编号
	private String userName;// 用户名
	private String password;// 密码
	private String trueName;// 真实姓名
	private String email;// 邮箱
	private String phone;// 电话
	private String roleType;// 角色(1-管理员，2-销售主管，3-客户经理，4-高管)

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

}
