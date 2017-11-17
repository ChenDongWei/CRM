package com.cdw.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdw.entity.User;
import com.cdw.service.UserService;

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
	
	@RequestMapping("/login")
	public ModelAndView login(User user, HttpServletRequest request)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		User resultUser = userService.login(user);
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
}
