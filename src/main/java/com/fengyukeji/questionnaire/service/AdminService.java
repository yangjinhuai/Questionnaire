package com.fengyukeji.questionnaire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.questionnaire.bean.Admin;
import com.fengyukeji.questionnaire.bean.AdminExample;
import com.fengyukeji.questionnaire.dao.AdminMapper;

/**
 * adminService
 * @author xt
 *
 * 2017年10月29日 
 */
@Service
public class AdminService {
	@Autowired
	AdminMapper adminMapper;
	
	public Admin login(String username, String password) {
		AdminExample example = new AdminExample();
		example.createCriteria().andUsernameEqualTo(username).andPasswordEqualTo(password);
		List<Admin> adminList = adminMapper.selectByExample(example);
		if(!adminList.isEmpty()){
			return adminList.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 获取管理员信息
	 * @return
	 */
	public List<Admin> getAdmins() {
		// TODO Auto-generated method stub
		return adminMapper.selectByExample(null);
	}
	/**
	 * 修改管理员信息
	 * @return
	 */
	public void updateAdmin(Integer userid, String username, String password) 
	{   //调用dao层，修改数据 ，参数为bean层                                                     
		adminMapper.updateByPrimaryKeySelective(new Admin(userid,username,password,null,null));
	}
	
	/**
	 * 添加管理员
	 * @param admin
	 */
	public void addAdmin(Admin admin) {
		adminMapper.insertSelective(admin);
	}
	/**
	 * 删除管理员
	 * @param id
	 */
	public void deleteadmin(Integer id) {
		adminMapper.deleteByPrimaryKey(id);
	}
	
	
}
