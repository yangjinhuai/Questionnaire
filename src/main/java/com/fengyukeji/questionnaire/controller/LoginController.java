package com.fengyukeji.questionnaire.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.questionnaire.bean.Admin;
import com.fengyukeji.questionnaire.bean.LoginBean;
import com.fengyukeji.questionnaire.bean.SystemInfo;
import com.fengyukeji.questionnaire.service.AdminService;
import com.fengyukeji.questionnaire.service.SystemInfoService;
import com.fengyukeji.questionnaire.utils.Msg;

/**
 * 登录控制器
 * @author xt
 *
 * 2017年10月29日
 */
@RequestMapping("/Login")
@Controller
public class LoginController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	SystemInfoService systemInfoService;
	/**
	 * 登录方法
	 * @return
	 * @throws UnknownHostException 
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Msg login(LoginBean loginBean,HttpSession session) throws UnknownHostException{
		String code = (String) session.getAttribute("code");
		if(code.equalsIgnoreCase(loginBean.getCode())){
			Admin admin = adminService.login(loginBean.getUsername(), loginBean.getPassword());
			//验证码通过
			if(admin!=null){
				session.setMaxInactiveInterval(60*60*12);									//设置sessoin 过期时间 10小时
				session.setAttribute("userid", admin.getId());
				session.setAttribute("username", admin.getUsername());
				session.setAttribute("password", admin.getPassword());
				session.setAttribute("userType", admin.getType());
				
			    //获取系统当前时间
				SimpleDateFormat dt = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				//获取系统ip
				InetAddress addr = InetAddress.getLocalHost();
				String ip=addr.getHostAddress().toString(); 			
				SystemInfo systemInfoL=new SystemInfo(null,dt.format(new Date()),ip,admin.getId());
							
				//获取上次登录信息
				SystemInfo systemInfo=systemInfoService.getlastLogoInfo(admin.getId()); //调用service层
				if(systemInfo.getLoginDate().equals("0"))
				{
					session.setAttribute("lastLogoTime",  "您是第一次登录！");
					session.setAttribute("lastLogoIp", "无");					
					systemInfoService.setCurrentLogoInfoFirst(systemInfoL);
				}
				else
				{
					session.setAttribute("lastLogoTime",  systemInfo.getLoginDate());
					session.setAttribute("lastLogoIp", systemInfo.getLoginIp());					
					systemInfoService.setCurrentLogoInfo(systemInfoL);           //设置本次登录信息 
				}
				return Msg.success();
				
			}else{
				return Msg.failed();
			}
		}else{
			Msg msg = new Msg();
			msg.setCode(300);
			msg.setMsg("验证码错误");
			return msg;
		}
		
	}
	
	/**
	 * 退出
	 */
	@RequestMapping("/exit")
	public void exit(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		session.setAttribute("username", null);
		try {
			response.sendRedirect(request.getContextPath()+"/Index/index");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
