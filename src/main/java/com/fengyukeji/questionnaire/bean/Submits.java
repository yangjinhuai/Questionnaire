package com.fengyukeji.questionnaire.bean;

import java.util.Date;

public class Submits {
    private Integer id;

    private String ipAddress;

    private Date submitDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress == null ? null : ipAddress.trim();
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

	public Submits(Integer id, String ipAddress, Date submitDate) {
		this.id = id;
		this.ipAddress = ipAddress;
		this.submitDate = submitDate;
	}

	public Submits() {
	}
    
}