package com.fengyukeji.questionnaire.bean;

public class Quetionnaire {
    private Integer id;

    private String name;

    private Integer quesNum;

    private Integer quesStatu;

    private Integer colleStatu;

    private String fabuAddress;

    private String comment;

    private String quesDate;

    private Integer confirmType;

    private String quesHtml;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getQuesNum() {
        return quesNum;
    }

    public void setQuesNum(Integer quesNum) {
        this.quesNum = quesNum;
    }

    public Integer getQuesStatu() {
        return quesStatu;
    }

    public void setQuesStatu(Integer quesStatu) {
        this.quesStatu = quesStatu;
    }

    public Integer getColleStatu() {
        return colleStatu;
    }

    public void setColleStatu(Integer colleStatu) {
        this.colleStatu = colleStatu;
    }

    public String getFabuAddress() {
        return fabuAddress;
    }

    public void setFabuAddress(String fabuAddress) {
        this.fabuAddress = fabuAddress == null ? null : fabuAddress.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getQuesDate() {
        return quesDate;
    }

    public void setQuesDate(String quesDate) {
        this.quesDate = quesDate == null ? null : quesDate.trim();
    }

    public Integer getConfirmType() {
        return confirmType;
    }

    public void setConfirmType(Integer confirmType) {
        this.confirmType = confirmType;
    }

    public String getQuesHtml() {
        return quesHtml;
    }

    public void setQuesHtml(String quesHtml) {
        this.quesHtml = quesHtml == null ? null : quesHtml.trim();
    }

	public Quetionnaire(Integer id, String name, Integer quesNum,String quesHtml,
			Integer quesStatu, Integer colleStatu, String fabuAddress,
			String comment, String quesDate, Integer confirmType
			) {
		super();
		this.id = id;
		this.name = name;
		this.quesNum = quesNum;
		this.quesStatu = quesStatu;
		this.colleStatu = colleStatu;
		this.fabuAddress = fabuAddress;
		this.comment = comment;
		this.quesDate = quesDate;
		this.confirmType = confirmType;
		this.quesHtml = quesHtml;
	}

	public Quetionnaire() {
		
	}
    
    
}