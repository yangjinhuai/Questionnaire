package com.fengyukeji.questionnaire.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fengyukeji.questionnaire.bean.Admin;
import com.fengyukeji.questionnaire.service.AdminService;

/**
 * 测试类
 * @author xt
 *
 * 2017年10月29日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class AdminLoginTest {
	@Autowired
	AdminService adminService;
	
	@Test
	public void adminTest(){
		String username = "a";
		String password = "a";
		Admin admin = adminService.login(username,password);
		if(admin!=null){
			System.out.println("登录成功");
		}
	}
}
