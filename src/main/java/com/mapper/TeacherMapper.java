package com.mapper;

import com.po.ReplyMsg;

import java.util.List;

public interface TeacherMapper {
    List<ReplyMsg> getReplyMsg();
    int addReplyMsg(ReplyMsg replyMsg);
    int deleteReplyMsg(Integer repmsg_id);
}