package com.fengyukeji.questionnaire.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.questionnaire.bean.CountByDate;
import com.fengyukeji.questionnaire.bean.DataAnswer;
import com.fengyukeji.questionnaire.bean.QuestionAnswer;
import com.fengyukeji.questionnaire.bean.Quetionnaire;
import com.fengyukeji.questionnaire.bean.Submits;
import com.fengyukeji.questionnaire.bean.SubmitsExample;
import com.fengyukeji.questionnaire.bean.Temp;
import com.fengyukeji.questionnaire.dao.DataAnwserMapper;
import com.fengyukeji.questionnaire.dao.QuestionAnswerMapper;
import com.fengyukeji.questionnaire.dao.QuetionnaireMapper;
import com.fengyukeji.questionnaire.dao.SubmitsMapper;
import com.fengyukeji.questionnaire.dao.TempMapper;
import com.fengyukeji.questionnaire.utils.FileUtil;

/**
 * 数据采集服务层
 * @author xt
 *
 * 2017年11月16日
 */
@Service
public class DataService {
	@Autowired
	DataAnwserMapper dataAnserMapper;
	
	@Autowired
	QuestionAnswerMapper questionAnswerMapper;
	
	@Autowired
	QuetionnaireMapper quetionnaireMapper; 
	
	@Autowired
	TempMapper tempMapper;
	
	@Autowired
	SubmitsMapper submitsMapper;
	
	public List<DataAnswer> getRelesedAnswerNum(){
//		throw new Exception("抛出异常");
		return dataAnserMapper.selectDataAnswer();
		
	}
	
	public List<QuestionAnswer> getQuestionAnswerById(Integer id) {
		
		return questionAnswerMapper.selectQuestionAnswer(id);
	}

	public Quetionnaire getQuestion(Integer id) {
		
		return quetionnaireMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 取得回答者编号 以及设置编号自加
	 * @return
	 */
	public  int UserNumAndSetUserNum(){
		int num = dataAnserMapper.selectUserNum();
		dataAnserMapper.updateUserNum();
		return num;
	}
	/**
	 * 开启收集表单
	 * @param anwserId
	 */
	public void collection(String path,Integer anwserId) {
		Quetionnaire que = quetionnaireMapper.selectByPrimaryKey(anwserId);
		String address = que.getFabuAddress();
		//改变地址
		FileUtil.renameFile(path, address+".htmlb", address+".html");
		//设置状态
		Quetionnaire ques = new Quetionnaire(anwserId, null, null, null, null, 1, null, null, null,null);
		quetionnaireMapper.updateByPrimaryKeySelective(ques);
	}
	
	/**
	 * 关闭表单收集
	 * @param anwserId
	 */
	public void Nocollection(String path,Integer anwserId) {
		Quetionnaire que = quetionnaireMapper.selectByPrimaryKey(anwserId);
		String address = que.getFabuAddress();
		//改变地址
		FileUtil.renameFile(path, address+".html", address+".htmlb");
		//设置状态
		Quetionnaire ques = new Quetionnaire(anwserId, null, null, null, null, 0, null, null, null,null);
		quetionnaireMapper.updateByPrimaryKeySelective(ques);
	}
	
	/**
	 * 设置问卷填写完成提示内容
	 * @param messageContent
	 */
	public void setTipMsg(String messageContent) {
		tempMapper.updateByPrimaryKeySelective(new Temp(1,null, messageContent));
		
	}
	
	/**
	 * 获取问卷填写完成提示内容
	 * @param messageContent
	 * @return 
	 */
	
	public String getTipMsg() {
		return tempMapper.selectByExample(null).get(0).getSubmitOkMsg();
		
	}
	
	/**
	 * 录入提交时间
	 */
	public void addSubmitor() {
		
		submitsMapper.insert(new Submits(null, null, new java.util.Date()));
	}
	
	/**
	 * 根据当前时间获取12天前的数据
	 * @throws ParseException 
	 * 
	 */
	@Test
	public List<CountByDate> getSubmitorByTime(Integer days) throws ParseException{
		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd");  
		Date date = new Date();  
		Calendar c = Calendar.getInstance();  
		c.setTime(date);  
		c.add(Calendar.DATE, -days);  
															//获取指定多少天前 格式"2017-12-21"
		String dateBeforeStr = format.format(c.getTime()); 
		List<CountByDate> countByDates = submitsMapper.selectByDate(dateBeforeStr);
		c.setTime(date); 
		Map<String,Integer> countMap = new TreeMap<String, Integer>();
		for(int i = 0;i<days;i++){
			c.add(Calendar.DATE, -1);
			String t1 = format.format(c.getTime());
			countMap.put(t1, 0);
		}
		List<CountByDate> counts = new ArrayList<CountByDate>();			//用于返回所有值的list
		for(CountByDate countByDate:countByDates){
			String key = countByDate.getDate();
			if(countMap.get(key)!=null){
				countMap.put(key, countByDate.getNum());
			}
			
		}
		Set<String> mapKeys = countMap.keySet();
		for(String key:mapKeys){
			counts.add(new CountByDate(key,countMap.get(key)));
		}
			
		return counts;
		
	}
	
}
