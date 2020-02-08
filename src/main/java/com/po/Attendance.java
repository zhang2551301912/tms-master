package com.po;

public class Attendance {
    private Integer atten_id;
    private Integer atten_times;
    private String atten_unit;
    private Integer user_id;
    private double score;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getAtten_id() {
        return atten_id;
    }

    public void setAtten_id(Integer atten_id) {
        this.atten_id = atten_id;
    }

    public Integer getAtten_times() {
        return atten_times;
    }

    public void setAtten_times(Integer atten_times) {
        this.atten_times = atten_times;
    }

    public String getAtten_unit() {
        return atten_unit;
    }

    public void setAtten_unit(String atten_unit) {
        this.atten_unit = atten_unit;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }
    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}