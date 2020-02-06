package com.po;

public class Achievement {
    private Integer achi_id;
    private String achi_content;
    private String achi_grade;
    private Integer user_id;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getAchi_id() {
        return achi_id;
    }

    public void setAchi_id(Integer achi_id) {
        this.achi_id = achi_id;
    }

    public String getAchi_content() {
        return achi_content;
    }

    public void setAchi_content(String achi_content) {
        this.achi_content = achi_content;
    }

    public String getAchi_grade() {
        return achi_grade;
    }

    public void setAchi_grade(String achi_grade) {
        this.achi_grade = achi_grade;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

}