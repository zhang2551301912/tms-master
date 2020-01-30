package com.po;

public class ReplyMsg {
    private Integer repmsgId;
    private String repmsgContent;
    private Integer msgId;
    private Integer teaId;

    public Integer getRepmsgId() {
        return repmsgId;
    }

    public void setRepmsgId(Integer repmsgId) {
        this.repmsgId = repmsgId;
    }

    public String getRepmsgContent() {
        return repmsgContent;
    }

    public void setRepmsgContent(String repmsgContent) {
        this.repmsgContent = repmsgContent;
    }

    public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public Integer getTeaId() {
        return teaId;
    }

    public void setTeaId(Integer teaId) {
        this.teaId = teaId;
    }
}