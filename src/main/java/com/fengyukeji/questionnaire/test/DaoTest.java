package com.fengyukeji.questionnaire.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fengyukeji.questionnaire.bean.DataAnswer;
import com.fengyukeji.questionnaire.bean.QuestionAnswer;
import com.fengyukeji.questionnaire.dao.TempMapper;
import com.fengyukeji.questionnaire.service.DataService;
import com.fengyukeji.questionnaire.utils.PromptText;

/**
 * 测试dao层
 * @author xt
 *
 * 2017年11月17日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class DaoTest {
	@Autowired
	DataService dataService;

	@Autowired
	TempMapper tempMapper;
	
	@Test
	public void testQuestionAnwser(){
		List<QuestionAnswer> datas = dataService.getQuestionAnswerById(109);
		for(QuestionAnswer data :datas){
			System.out.println(data.getQueName()+":"+data.getAnwser());
		}
	}
	@Test
	public void  rtr() {
		System.out.println(PromptText.getInstance().getPromptText());
		return;
	}
}
