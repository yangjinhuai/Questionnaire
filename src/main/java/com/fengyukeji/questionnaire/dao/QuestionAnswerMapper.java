package com.fengyukeji.questionnaire.dao;

import java.util.List;

import com.fengyukeji.questionnaire.bean.QuestionAnswer;

/**
 * 自定义的QuestionAnwser 接口 
 * @author xt
 *
 * 2017年11月17日
 */
public interface QuestionAnswerMapper {
	//获取数据
	public List<QuestionAnswer> selectQuestionAnswer(Integer id) ;
}
