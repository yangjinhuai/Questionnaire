package com.fengyukeji.questionnaire.bean;

public class Temp {
    private Integer id;

    private Integer userNum;

    private String submitOkMsg;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserNum() {
        return userNum;
    }

    public void setUserNum(Integer userNum) {
        this.userNum = userNum;
    }

    public String getSubmitOkMsg() {
        return submitOkMsg;
    }

    public void setSubmitOkMsg(String submitOkMsg) {
        this.submitOkMsg = submitOkMsg == null ? null : submitOkMsg.trim();
    }

	public Temp(Integer id, Integer userNum, String submitOkMsg) {
		this.id = id;
		this.userNum = userNum;
		this.submitOkMsg = submitOkMsg;
	}

	public Temp() {
	}
    
}