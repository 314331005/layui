package com.ws.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.nutz.lang.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ws.common.Page;
import com.ws.model.User;
import com.ws.service.UserService;
import com.ws.utils.ReturnUtils;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String getAllUser(HttpServletRequest request, String tid){
		
		List<User> list = userService.findAll();
		request.setAttribute("tid", tid);
		request.setAttribute("userList", list);
		return "/user-list";
	}
	/**
	 * 获取用户数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/jsonlist")
	@ResponseBody
	public Object getAllUserJson(HttpServletRequest request, String tid, String pageSize, String pageNumber){
		
		Page<User> page = new Page<User>();
		page.setPageSize(Integer.valueOf(pageSize));
		page.setPageNumber(Integer.valueOf(pageNumber));
		
		Page<User> p = userService.findPage(page);
		JSONObject json = new JSONObject();
		json.put("total",p.getTotalCount());
		json.put("rows", p.getResult());
		return json;
	}
	
	/**
	 * 跳转到添加用户界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit")
	public String toAddUser(HttpServletRequest request, String tid, String type){
		System.out.println("tabid"+ tid);
		request.setAttribute("tid", tid);
		if(Strings.isNotBlank(type) && type.equals("2")){
			return "/user-edit-tab";
		}
		return "/user-edit";
	}
	/**
	 * 添加用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody 
	public Object addUser(User user, HttpServletRequest request){
		System.out.println(user.getUserName());
		userService.save(user);
		return ReturnUtils.success("操作成功");
	}
	
	/**
	 *编辑用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateUser")
	public String updateUser(User user,HttpServletRequest request){
		
		
		if(userService.update(user)){
			user = userService.findById(user.getId());
			request.setAttribute("user", user);
			return "redirect:/user/getAllUser";
		}else{
			return "/error";
		}
	}
	/**
	 * 根据id查询单个用户
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewUser")
	public String viewUser(int id, HttpServletRequest request, String type, String tid){
		
		request.setAttribute("user", userService.findById(id));
		request.setAttribute("tid", tid);
		if(!Strings.isBlank(type) && type.equals("2")){
			return "/user-view-tab";
		}
		return "/user-view";
	}
	/**
	 * 根据id查询单个用户
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUser")
	public String getUser(int id,HttpServletRequest request){
		
		request.setAttribute("user", userService.findById(id));
		return "/editUser";
	}
	/**
	 * 删除用户
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delUser")
	public void delUser(int id,HttpServletRequest request,HttpServletResponse response){
		String result = "{\"result\":\"error\"}";
		
		if(userService.delete(id)){
			result = "{\"result\":\"success\"}";
		}
		
		response.setContentType("application/json");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
