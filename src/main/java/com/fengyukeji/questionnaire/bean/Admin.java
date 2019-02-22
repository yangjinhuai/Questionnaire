package com.fengyukeji.questionnaire.bean;

public class Admin {
    private Integer id;

    private String username;

    private String password;

    private String phone;

    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public Admin() {
    	
	}

	public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

	public Admin(Integer id, String username, String password, String phone, Integer type) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.type = type;
	}
    
}