package com.fengyukeji.questionnaire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.questionnaire.bean.Confirm;
import com.fengyukeji.questionnaire.bean.ConfirmExample;
import com.fengyukeji.questionnaire.dao.ConfirmMapper;
import com.fengyukeji.questionnaire.utils.SimpleExcelWrite;

/**
 * 身份认证 服务层
 * @author xt
 *
 * 2017年11月21日
 */
@Service
public class ConfirmService {
	
	@Autowired
	ConfirmMapper confirmMapper;	
	
	/**
	 * 录入身份认证信息
	 */
	public void insertConfirm() {
		SimpleExcelWrite simpleExcel = new SimpleExcelWrite();
		List<Confirm> confirmList = simpleExcel.readExcel();
		
		confirmMapper.insertSelectiveBath(confirmList);
	}
	
	/**
	 * 删除数据
	 */
	public void deleteDatas() {
		confirmMapper.deleteByExample(null);
		
	}

	public List<Confirm> checkData() {
		return confirmMapper.selectByExample(null);
	}
	
	/**
	 * 通过姓名+学号认证填写权限信息
	 * @param idx
	 * @param name
	 * @return
	 */
	public boolean confirmUseridx(String idx, String name) {
		ConfirmExample example = new ConfirmExample();
		example.createCriteria().andIdxEqualTo(idx).andNameEqualTo(name);
		 List<Confirm> conList = confirmMapper.selectByExample(example);
		 if(!conList.isEmpty()){
			 return true;
		 }
		 return false;
	}
	/**
	 * 通过 学号+姓名 +身份证认证填写权限信息
	 * @param idx
	 * @param idc
	 * @param name
	 * @return
	 */
	public boolean confirmUser(String idx, String idc, String name) {
		
		ConfirmExample example = new ConfirmExample();
		example.createCriteria().andIdxEqualTo(idx).andNameEqualTo(name).andIdcardEqualTo(idc);
		 List<Confirm> conList = confirmMapper.selectByExample(example);
		 if(!conList.isEmpty()){
			 return true;
		 }
		 return false;
	}
	
	/**
	 *通过省份证 +姓名认证填写权限信息
	 * @param idc
	 * @param name
	 * @return
	 */
	public boolean confirmUseridc(String idc, String name) {
		ConfirmExample example = new ConfirmExample();
		example.createCriteria().andIdcardEqualTo(idc).andNameEqualTo(name);
		 List<Confirm> conList = confirmMapper.selectByExample(example);
		 if(!conList.isEmpty()){
			 return true;
		 }
		 return false;
	}

	/**
	 *获取全部身份数据
	 * @param idx
	 * @param idc
	 * @param name
	 * @return
	 */
	public List<Confirm> getForms() {
		return confirmMapper.selectByExample(null);
	}

	/**
	 *根据ID删除身份数据
	 * @return
	 */
	public void deleteOneData(Integer id) {
		confirmMapper.deleteByPrimaryKey(id);
	}
	
	/**
	 *保存单个身份数据
	 * @return
	 */
	public void saveOneData(Confirm confirm) {
	confirmMapper.insertSelective(confirm);	
	}

	
	/**
	 *编辑保存单个身份数据
	 * @return
	 */
	public void editSaveData(Integer id, String number, String card, String name) {
		confirmMapper.updateByPrimaryKeySelective(new Confirm(id,number,card,name));	
	}
}
