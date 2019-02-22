package com.fengyukeji.questionnaire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.questionnaire.bean.Quetionnaire;
import com.fengyukeji.questionnaire.bean.QuetionnaireExample;
import com.fengyukeji.questionnaire.dao.QuetionnaireMapper;
import com.fengyukeji.questionnaire.utils.FileUtil;

/**
 *  questionnaireService 层 
 * @author xt
 *
 * 2017年11月7日
 */
@Service
public class QuetionnaireService {
	
	@Autowired
	QuetionnaireMapper quetionnaireMapper;
	/**
	 * 添加表单函数
	 * @param quetionnaire
	 */
	public void saveForm(Quetionnaire quetionnaire) {
		
		quetionnaireMapper.insertSelective(quetionnaire);
		
	}
	
	/**
	 * 获取所有的表单
	 * @return
	 */
	public List<Quetionnaire> getForms() {
		return quetionnaireMapper.selectByExample(null);
	}
	
	/**
	 * 根据表单id 来删除一条表单 
	 * @param id
	 */
	public void deleteForm(Integer id,String path) {
		String fabuAddress = quetionnaireMapper.selectByPrimaryKey(id).getFabuAddress();
		quetionnaireMapper.deleteByPrimaryKey(id);
		// 删除生成的html
		
		FileUtil.delFile(path+"/"+fabuAddress);
		
	}

	/**
	 * 根据表单id 来获取一条表单
	 * @param id
	 */
	public Quetionnaire getFormById(Integer formId) {
		return quetionnaireMapper.selectByPrimaryKey(formId);
	}
	
	/**
	 * 更改表单的发布状态 为已经发布
	 * @param formId
	 */
	public void release(Integer formId,String address) {
		quetionnaireMapper.updateByPrimaryKeySelective(new Quetionnaire(formId, null, null, null,1,null,address,null,null,null));
		
	}
	
	/**
	 * 获取发布过的表单数据
	 * @return
	 */
	public List<Quetionnaire> getReleaseForms() {
		QuetionnaireExample example = new QuetionnaireExample();
		example.createCriteria().andQuesStatuEqualTo(1);
		
		return quetionnaireMapper.selectByExample(example);
	}
	
	/**
	 * 根据问卷编号 设置问卷的 填写权限
	 * @param anwserId
	 * @param confirmType
	 */
	public void setConfirmType(Integer anwserId, Integer confirmType) {
		
		quetionnaireMapper.updateByPrimaryKeySelective(new Quetionnaire(anwserId, null, null, null, null, null, null, null, null, confirmType));
	}
	
	/**
	 * 根据访问地址获取 填写者的权限
	 * @param requrl 访问的地址
	 * @return
	 */
	public Integer getConfrimType(String requrl) {
		QuetionnaireExample example = new QuetionnaireExample();
		example.createCriteria().andFabuAddressEqualTo(requrl);
		List<Quetionnaire> queList = quetionnaireMapper.selectByExample(example);
		if(!queList.isEmpty()){
			return queList.get(0).getConfirmType();
		}
		return 0;
	}

	/**
	 *获取 某个releaseForm 
	 * @return
	 */
	public Quetionnaire getOneForm(Integer formId) {	
		return quetionnaireMapper.selectByPrimaryKey(formId);
	}

	/**
	 * 根据表单id  修改表单
	 * @return
	 */
	
	public void modefiyForm(Integer id, Quetionnaire quetionnaire) {
		String html=quetionnaire.getQuesHtml();
		String name=quetionnaire.getName();
		Integer num=quetionnaire.getQuesNum();
		String comment=quetionnaire.getComment();
		String date=quetionnaire.getQuesDate();
		
		quetionnaireMapper.updateByPrimaryKeySelective(new Quetionnaire(id,name, num,html,0, 1, null,comment,date, 0));
		
	}
	
	/**
	 * 根据表单id  修改表单
	 * @return
	 */
	
	public void modefiyFormPublish(Integer id, Quetionnaire quetionnaire) {
		String html=quetionnaire.getQuesHtml();
		String name=quetionnaire.getName();
		Integer num=quetionnaire.getQuesNum();
		String comment=quetionnaire.getComment();
		String date=quetionnaire.getQuesDate();
		
		quetionnaireMapper.updateByPrimaryKeySelective(new Quetionnaire(id,name, num,html,1, 1, null,comment,date, 0));
		
	}
	
	/**
	 * 根据id 获取问卷发布的地址
	 * @param id
	 * @return
	 */
	public String getQuestionnaireFabuAddress(Integer id) {
		return quetionnaireMapper.selectByPrimaryKey(id).getFabuAddress();
	}
}
