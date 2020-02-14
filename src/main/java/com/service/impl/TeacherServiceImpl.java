package com.service.impl;

import com.mapper.TeacherMapper;
import com.po.ReplyMsg;
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
}
