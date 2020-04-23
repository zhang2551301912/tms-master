package com.service.impl;

import com.mapper.TeacherMapper;
import com.po.ReplyMsg;
import com.po.StudentCourse;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    TeacherMapper teacherMapper;

    @Override
    public List<ReplyMsg> getReplyMsg() {
        return teacherMapper.getReplyMsg();
    }

    @Override
    public int addReplyMsg(ReplyMsg replyMsg) {
        return teacherMapper.addReplyMsg(replyMsg);
    }

    @Override
    public int deleteReplyMsg(Integer repmsg_id) {
        return teacherMapper.deleteReplyMsg(repmsg_id);
    }

    //根据学生状态获取报名记录
    @Override
    public List<StudentCourse> getStudentCourseByStatus(Integer userId) {
        return teacherMapper.getStudentCourseByStatus(userId);
    }
    //审核报名状态
    @Override
    public int updateStudentCourseStatus(StudentCourse studentCourse) {
        return teacherMapper.updateStudentCourseStatus(studentCourse);
    }

    @Override
    public List<ReplyMsg> getReplyMsgByUserId(Integer userId) {
        return teacherMapper.getReplyMsgByUserId(userId);
    }

    @Override
    public List<ReplyMsg> getReplyMsgByMsgId(Integer userId) {
        return teacherMapper.getReplyMsgByMsgId(userId);
    }
}
