package com.mapper;

import com.po.ReplyMsg;
import com.po.StudentCourse;

import java.util.List;

public interface TeacherMapper {
    List<ReplyMsg> getReplyMsg();
    int addReplyMsg(ReplyMsg replyMsg);
    int deleteReplyMsg(Integer repmsg_id);

    //根据学生状态获取报名记录
    List<StudentCourse> getStudentCourseByStatus(Integer userId);
    //审核报名状态
    int updateStudentCourseStatus(StudentCourse studentCourse);

    List<ReplyMsg> getReplyMsgByUserId(Integer userId);

    List<ReplyMsg> getReplyMsgByMsgId(Integer userId);
}