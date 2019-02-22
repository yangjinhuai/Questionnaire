package com.fengyukeji.questionnaire.bean;
/**
 * 问题答案的bean
 * @author xt
 *
 * 2017年11月17日
 */
public class QuestionAnswer {
	//问题题目
	private String queName;
	//问题答案
	private String anwser;
	public String getQueName() {
		return queName;
	}
	public void setQueName(String queName) {
		this.queName = queName;
	}
	public String getAnwser() {
		return anwser;
	}
	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}
	public QuestionAnswer(String queName, String anwser) {
		super();
		this.queName = queName;
		this.anwser = anwser;
	}
	public QuestionAnswer() {
	}
	
	
}
