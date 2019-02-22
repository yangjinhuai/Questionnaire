package com.fengyukeji.questionnaire.bean;

public class SystemInfo {
    private Integer id;

    private String loginDate;

    private String loginIp;

    private Integer fkAdminId;

    
    public SystemInfo(Integer id,String loginDate,String loginIp,Integer fkAdminId)
    {
    	this.id=id;
    	this.fkAdminId=fkAdminId;
    	this.loginDate=loginDate;
    	this.loginIp=loginIp;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(String loginDate) {
        this.loginDate = loginDate == null ? null : loginDate.trim();
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

    public Integer getFkAdminId() {
        return fkAdminId;
    }

    public void setFkAdminId(Integer fkAdminId) {
        this.fkAdminId = fkAdminId;
    }
}