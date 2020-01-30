package com.po;

public class Achievement {
    private Integer achiId;
    private String achiContent;
    private String achiGrade;
    private Integer teaId;

    public Integer getAchiId() {
        return achiId;
    }

    public void setAchiId(Integer achiId) {
        this.achiId = achiId;
    }

    public String getAchiContent() {
        return achiContent;
    }

    public void setAchiContent(String achiContent) {
        this.achiContent = achiContent;
    }

    public String getAchiGrade() {
        return achiGrade;
    }

    public void setAchiGrade(String achiGrade) {
        this.achiGrade = achiGrade;
    }

    public Integer getTeaId() {
        return teaId;
    }

    public void setTeaId(Integer teaId) {
        this.teaId = teaId;
    }
}