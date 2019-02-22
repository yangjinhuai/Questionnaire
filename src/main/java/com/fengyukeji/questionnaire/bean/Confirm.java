package com.fengyukeji.questionnaire.bean;

public class Confirm {
    private Integer id;

    private String idx;

    private String idcard;

    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx == null ? null : idx.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

	public Confirm(Integer id, String idx, String idcard, String name) {
		super();
		this.id = id;
		this.idx = idx;
		this.idcard = idcard;
		this.name = name;
	}

	public Confirm() {
		
	}
    
    
}