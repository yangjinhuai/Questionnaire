package com.fengyukeji.questionnaire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.questionnaire.bean.Answer;
import com.fengyukeji.questionnaire.dao.AnswerMapper;

/**
 * answer service 层
 * @author xt
 *
 * 2017年11月15日
 */
@Service
public class AnswerService {
	
	@Autowired
	AnswerMapper answerMapper;
	
	/**
	 *  
	 * @param answerList
	 * 批量插入
	 */
	public void insertAnswerBath(List<Answer> answerList) {
		answerMapper.insertBatch(answerList);
	}
}
