package com.model2.mvc.service.reply;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Reply;

public interface ReplyService {


	void insertReply(Reply reply) throws Exception;

	public Map<String,Object> getReply(int prodNo) throws Exception;



}

