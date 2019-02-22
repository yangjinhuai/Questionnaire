package com.fengyukeji.questionnaire.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.questionnaire.bean.SystemInfo;
import com.fengyukeji.questionnaire.bean.SystemInfoExample;
import com.fengyukeji.questionnaire.dao.SystemInfoMapper;

/**
 * SystemInfoService
 * @author xt
 *
 * 2017年11月1日
 */
@Service
public class SystemInfoService {
	@Autowired
	SystemInfoMapper systemInfoMapper;
	
	/**
	 * 获取上次登录信息
	 * @return
	 */
	public SystemInfo getlastLogoInfo(Integer userid) {
		SystemInfoExample  example = new SystemInfoExample();
		example.createCriteria().andFkAdminIdEqualTo(userid);

		if(systemInfoMapper.selectByExample(example).isEmpty())//调用dao层
		{
			SystemInfo systemInfo=new SystemInfo(null,"0","0",0);
			return systemInfo;
		}
		else{		
			return systemInfoMapper.selectByExample(example).get(0);
		}
	}
	/**
	 * 设置本次登录信息
	 * @return
	 */
	public void setCurrentLogoInfo(SystemInfo systemInfo) {
		SystemInfoExample  example = new SystemInfoExample();
		example.createCriteria().andFkAdminIdEqualTo(systemInfo.getFkAdminId());
		systemInfoMapper.updateByExampleSelective(systemInfo,example);//调用dao层 
	}
	public void setCurrentLogoInfoFirst(SystemInfo systemInfo) {
		systemInfoMapper.insert(systemInfo);
	}

}
