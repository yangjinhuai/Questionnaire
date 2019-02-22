package com.fengyukeji.questionnaire.bean;

public class Answer {
    private Integer id;

    private String question;

    private String answer;

    private Integer answerMainId;

    private Integer fkQuestionnaireId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Integer getAnswerMainId() {
        return answerMainId;
    }

    public void setAnswerMainId(Integer answerMainId) {
        this.answerMainId = answerMainId;
    }

    public Integer getFkQuestionnaireId() {
        return fkQuestionnaireId;
    }

    public void setFkQuestionnaireId(Integer fkQuestionnaireId) {
        this.fkQuestionnaireId = fkQuestionnaireId;
    }

	public Answer(Integer id, String question, String answer,
			Integer answerMainId, Integer fkQuestionnaireId) {
		super();
		this.id = id;
		this.question = question;
		this.answer = answer;
		this.answerMainId = answerMainId;
		this.fkQuestionnaireId = fkQuestionnaireId;
	}

	public Answer() {
		
	}
    
    
}