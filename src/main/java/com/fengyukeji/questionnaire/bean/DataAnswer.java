package com.fengyukeji.questionnaire.bean;
/**
 * 数据的采集答案 获取到的 问卷id 和答案数
 * @author xt
 *
 * 2017年11月16日
 */
public class DataAnswer {
	//问卷id
	private Integer id;
	//获取收到的答案
	private Integer answerNum;
	public DataAnswer(Integer id, Integer answerNum) {
		this.id = id;
		this.answerNum = answerNum;
	}
	public DataAnswer() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(Integer answerNum) {
		this.answerNum = answerNum;
	}
	
	
}
