package com.fengyukeji.questionnaire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.questionnaire.bean.Admin;
import com.fengyukeji.questionnaire.service.AdminService;
import com.fengyukeji.questionnaire.utils.Msg;

/**
 * 管理员控制器
 * @author xt
 *
 * 2017年10月29日
 */
@RequestMapping("/Admin")
@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	/**
	 * 获取管理员信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAdmins")
	public Msg getAllAdmin(){
		List<Admin> adminList = adminService.getAdmins();
		if(!adminList.isEmpty()){
			
			return Msg.success().add("data", adminList);
			}else{
				return Msg.failed();
			}
	}
	
	/**
	 * 修改管理员信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/modifyOne")
	public Msg modifyOne(HttpServletRequest request,HttpSession session)
	{
		Integer userid=Integer.parseInt(request.getParameter("userid"));
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		adminService.updateAdmin(userid,username,password);           //调用service层
	
		session.setAttribute("username", username);
		session.setAttribute("password", password);
	
		return Msg.success();             
		
	}
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addAdmin")
	public Msg addAdmin(Admin admin){
		adminService.addAdmin(admin);
		return Msg.success();
	}
	
	/**
	 * 删除管理员
	 * @param admin
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteadmin")
	public Msg deleteadmin(@RequestParam("id")Integer id){
		
		adminService.deleteadmin(id);
		return Msg.success();
	}
	
}

