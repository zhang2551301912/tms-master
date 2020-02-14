package com.po;

public class CourseTable {
    private Integer id;
    private Integer course_id;
    private Integer week;
    private Integer jieci;
    private Integer class_id;
    private Integer address;
    private Integer user_id;

    private Course course;
    private User user;
    private  Cla cla;
    private Week wk;
    private Jieci jie;
    private Address addr;

    public Week getWk() {
        return wk;
    }

    public void setWk(Week wk) {
        this.wk = wk;
    }

    public Address getAddr() {
        return addr;
    }

    public void setAddr(Address addr) {
        this.addr = addr;
    }

    public Jieci getJie() {
        return jie;
    }

    public void setJie(Jieci jie) {
        this.jie = jie;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public Integer getWeek() {
        return week;
    }

    public void setWeek(Integer week) {
        this.week = week;
    }

    public Integer getJieci() {
        return jieci;
    }

    public void setJieci(Integer jieci) {
        this.jieci = jieci;
    }

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }

    public Integer getAddress() {
        return address;
    }

    public void setAddress(Integer address) {
        this.address = address;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Cla getCla() {
        return cla;
    }

    public void setCla(Cla cla) {
        this.cla = cla;
    }
}
