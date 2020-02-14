package com.service;

import com.po.ReplyMsg;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TeacherService {
    List<ReplyMsg> getReplyMsg();
    int addReplyMsg(ReplyMsg replyMsg);
    int deleteReplyMsg(Integer repmsg_id);
}
