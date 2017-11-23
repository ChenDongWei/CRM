package com.cdw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdw.entity.PageModel;
import com.cdw.entity.UserModel;
import com.cdw.service.UserService;
import com.cdw.util.ResponseUtil;
import com.cdw.util.StringUtil;

/**
 * 用户Control层
 * @author dongwei
 * @date 2017年11月16日
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	/**
	 * 登录方法
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public ModelAndView login(UserModel user, HttpServletRequest request)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		UserModel resultUser = userService.login(user);
		if (resultUser == null) {
			modelAndView.setViewName("login");
			modelAndView.addObject("user", user);
			modelAndView.addObject("errorMsg", "用户名或密码错误！");
		}else {
			modelAndView.setViewName("main");
			modelAndView.addObject("currentUser", resultUser);
		}
		return modelAndView;
	}
	
	/**
	 * 查询用户列表
	 * @param page
	 * @param rows
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getUserList")
	@ResponseBody
	public Map<String, Object> getUserList(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="rows",required=false)String rows,
			UserModel user, HttpServletRequest request, HttpServletResponse response)throws Exception{
		PageModel pageModel = new PageModel(Integer.parseInt(page), Integer.parseInt(rows));
		String userName = StringUtil.formatLike(user.getUserName());
		int start = pageModel.getStart();
		int size = pageModel.getPageSize();
		List<UserModel> userList = userService.getUserList(userName, start, size);
		Long total = userService.getTotal(userName, start, size);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(userList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
}
