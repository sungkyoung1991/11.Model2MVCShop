package com.model2.mvc.service.reply;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Reply;

public interface ReplyDao {

	public void insertReply(Reply reply) throws Exception;

	public List<Reply> getReply(int prodNo) throws Exception;
}
