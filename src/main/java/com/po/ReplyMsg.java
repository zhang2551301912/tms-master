package com.po;

public class ReplyMsg {
    private Integer repmsg_id;
    private String repmsg_content;
    private Integer msg_id;
    private Integer teacher_id;

    private User user;
    private Message message;

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public Integer getRepmsg_id() {
        return repmsg_id;
    }

    public void setRepmsg_id(Integer repmsg_id) {
        this.repmsg_id = repmsg_id;
    }

    public String getRepmsg_content() {
        return repmsg_content;
    }

    public void setRepmsg_content(String repmsg_content) {
        this.repmsg_content = repmsg_content;
    }

    public Integer getMsg_id() {
        return msg_id;
    }

    public void setMsg_id(Integer msg_id) {
        this.msg_id = msg_id;
    }

    public Integer getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(Integer teacher_id) {
        this.teacher_id = teacher_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}